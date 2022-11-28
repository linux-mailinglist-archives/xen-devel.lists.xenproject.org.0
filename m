Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C652563A5E8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 11:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448862.705424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbCV-0001vE-Ia; Mon, 28 Nov 2022 10:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448862.705424; Mon, 28 Nov 2022 10:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbCV-0001sa-Fk; Mon, 28 Nov 2022 10:17:23 +0000
Received: by outflank-mailman (input) for mailman id 448862;
 Mon, 28 Nov 2022 10:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGlV=34=citrix.com=prvs=324bca1c8=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1ozbCU-0001sT-1C
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 10:17:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d64ec2f5-6f05-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 11:17:19 +0100 (CET)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Nov 2022 05:16:59 -0500
Received: from BN6PR03MB3378.namprd03.prod.outlook.com (2603:10b6:405:42::30)
 by PH0PR03MB5862.namprd03.prod.outlook.com (2603:10b6:510:42::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 10:16:57 +0000
Received: from BN6PR03MB3378.namprd03.prod.outlook.com
 ([fe80::b136:4ba1:712f:cec4]) by BN6PR03MB3378.namprd03.prod.outlook.com
 ([fe80::b136:4ba1:712f:cec4%5]) with mapi id 15.20.5857.019; Mon, 28 Nov 2022
 10:16:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d64ec2f5-6f05-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669630640;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XI9KoTAeUO1ke64jAv3W7cYMqIp6oRzu/NVY/wNK59c=;
  b=BtisyCoYIR4agSYpunNS0am/1BhP6EyqPYXLkEZ2eeL+f0/AlGjNPnE2
   D0QoT6rj1Qr8maIcwStd+sg1iS82UP7Y0bQV+FmMlPMDepmbWvZaWJ8gQ
   qCGA2Xn3chJdtNrm13KSe+3aTYxvlAFaCqhzUkHiTTP4Q6N1l+qSykX5Y
   g=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 85229605
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RiKYzKD/OmpxaBVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApGx01DAGy
 zRKUWqOOqzeZzT2edklbYjl8B8EscKDx9ViQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9+lJM1xUz
 +YjLRNKX1O7hNy08OnrY7w57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exrvAA/zyQouFTpGOLYYJqgRMFOk26Tp
 37c/nS/CRYfXDCa4WrYqCj92LeS9c/9cNsdDq/hqtFnvHiS+0xJVC0wZGG6iubs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c8JZDukS+AyLjK3O7G6xGWwsXjNHLts8u6ceRyEu1
 1KPt8PkA3poqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWdi9T0HXT6x
 WCMpS1m27EL15ZXiOO84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComV/lhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:yz5846/FjwxXE4kBVq9uk+Hpdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFq7X5To3SJjUO31HYYb2KjLGSiAEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpodKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qj5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 J29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQBo+dY7bWDHAbIcYa
 1T5fLnlbFrmJShHjbkV1xUsZmRt7IIb067qwY5y5SoOnNt7Q1EJgMjtbAidzE7hdMAotB/lp
 v5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZdc60l/22urKCY8OlZaXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/XBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhuzi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHfZpY5ummiZ5rAQD2OwXsrKtmlwwE68vl9CqRc9g4IlF+++saHbTVfr61eRj
 oMHI/a
X-IronPort-AV: E=Sophos;i="5.96,200,1665460800"; 
   d="scan'208";a="85229605"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe5OdqmJvWf8EMgRkZBJabEvIESwMpYWoznJYTOQJ8T9texW89Vp8Foyuo+IRm94iLZh/Q6eXn6h1zSvyRxbE3/IcsjRWy4WGt7/2poyYUFuGIvyubNAM4DsvV/gkWeEeBkt7Dz4A2718te23tXgkq2/n+ugZEzA8VZA1WLbkAMr0XsMNGRUkxCRUrj9j0IeEeisXjxHcZlYF7QFLTb9SfQYYr1EfiJ61l5lSNAwd1qaSQRUutx+2aqyg15/GoyOkpR9MlxzREvSt4tlPwBV/V5Al/0UwekjtrgYTCSKRouUFQTjwpUapOVqpVCsIxNsmi6fT6Kolyo2LtWzumoT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI9KoTAeUO1ke64jAv3W7cYMqIp6oRzu/NVY/wNK59c=;
 b=FRLlxzIB/f6E/7YHxy03CjMN4ZpE4YUxVFcvKusOgGbqlm8CeT4vCmYUzPsVgAcnCGwEXr6KrJ9wRz9tLNJC0rYyVdoLMy4+Ic58HTzpO5kWS70pgXgjqqti7tNxfST5cdZlD5K42a13Aj7st0+v9aSS7u2v9u9b4dyiH2YHOI9fpaSvXPehDQMLffr4nDPFKmu/Az62uJRl1P3gyN4b9gls3xtencZOc6y8/uI8fWhPqe6unELUpKEfF2WFaTqKDbbANPVhdw3MUbwE/ExaqOwCKt38s/OtKRYA3fTXE9UOLJlb+stcT0BYJJK9PcZPtA5TPHY7Q83pVXfz7/iYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI9KoTAeUO1ke64jAv3W7cYMqIp6oRzu/NVY/wNK59c=;
 b=fDme3mWhL2vPdGsboUh8NUGLmIy1DmQ5GFq3c2ivtx0mzqAOzVM2ZoyTJdlaw4loAXjrBFcSTNfGUHkS1RLoZsVoueM3MwbIwbMqER1AmAtjhBlJHnRitRQhzs32w5+u5CHOzKVjA2hbDFsF/3lKABnzYNu6ZJ1iTlLNLdic/kw=
From: "Per Bilse (3P)" <Per.Bilse@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
Thread-Topic: [PATCH] ioreq_broadcast(): accept partial broadcast success
Thread-Index: AQHZAxKKQ5gC8MSrQkutQViuEWIcyQ==
Date: Mon, 28 Nov 2022 10:16:56 +0000
Message-ID: <b432d29a-e704-1e4f-bcce-e6c4258a3204@citrix.com>
References:
 <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
 <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
 <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
In-Reply-To: <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR03MB3378:EE_|PH0PR03MB5862:EE_
x-ms-office365-filtering-correlation-id: a623ccba-e1ed-4610-68cd-08dad129add9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZzfD7zOwNjppLwtg5Pc1ykA3fJg1Qz4CyhOm742SSboDkQTio1PI2FqY+Wcbk/0O+xVicUuJ6Zk8/IP4bk8u+wg+A/RBMXByUXNCqP3pB7NqkSftB4MtUtUjzjjiVvrgtJ/k0+eYC5dTHNxB3BROtihsW+TCo0zf+6IGH38pGNjNwMmHYiq2ab5rODqE/RZ3vkeSr6sooGYt6Zap185f54nWBCbGWGbXsz3CalFNc4RwiE2iTsxhN6k0exJ3hOv1O2GzapNyUvwPeqntgDpo94qeH16KqHChABQo7X5tCjzQrxpU+nTfnA+IcZOOuy+jAT3mXBFTOiXgGg1soEAZbufXAOCWkhainmthrqg0vliGxV9ZZzSItSazBoqKkEACZVfEXe5WUmqcWETp5bnUF5fwwGSQL29EAo8yACP4R7A27HnhbOTw2/RFtV1eRZipQU0rBgXAUjJ2LxnzZzOuS5692T/aqP92bQfsvEITsDbCs9pmEucJBCMKMji27ZSvFt82MyFo98f/e0ALdrdTnIPzQ9ubP+9svgjzg7oWoFQuoxwKO2poTiKVsBM+LdQ53CFOGThbrtp8UY/73CaaKSfezQ9o/ETTOp3knNNWGQMPEk89dFJl1awoFbvcCcNYszdnZUe6G0TVvKIzdzTSyY+z+9ae7o/9UtRS2Cfh8KzIkQPDC/X4DMNKY2r2ZDK50fFABGBOoMniNSsIz4PidAAXmDz/rwTsnZ+Mn5sk1N4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR03MB3378.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199015)(5660300002)(64756008)(4326008)(66556008)(66476007)(66446008)(8676002)(31686004)(41300700001)(8936002)(6486002)(6916009)(54906003)(71200400001)(66946007)(2906002)(478600001)(316002)(91956017)(36756003)(76116006)(86362001)(31696002)(6512007)(26005)(55236004)(6506007)(53546011)(186003)(2616005)(38070700005)(83380400001)(82960400001)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SURkYkJiNExPT1MzTjhCbFpLMEl6dXpCR1MzRTBic2tBQWxzSnhrRGZBR1NP?=
 =?utf-8?B?QTN6c1VUN0RlOGoyNUh2UUkzZkRRVGtSWXBjOVU1OFZMZGhwQ28wbHR4bHNL?=
 =?utf-8?B?Nk1xUG8weFpNRmR4b3RESGtGV1FNMVJaWVBsQTd2OUxQb2lwUVpRcFM3eTNa?=
 =?utf-8?B?cUxrejNaZ1pLV2pNL0Zoc3dzS1RRb2FDY0hWUXJpVlBqb080SUM0TXF4K2RJ?=
 =?utf-8?B?M2R5NWRCa3pGbzBFVUVSVTNGdWg3MDg0TThuZkZkRlZ4U1BIMUZWZlZhMVdX?=
 =?utf-8?B?aEIxdkFtQU9oYUkxbENrL3RpeXJTWjFsRkZjcWFxVjNrYTdQZXhRcEgrWUhB?=
 =?utf-8?B?Y3REcS9pUTNKUkRKZzd1dEhFRHRwOWl3S05JZk03cys3eFIyZVlyV0dETHh3?=
 =?utf-8?B?SktPMEU4YTA5bldKdG91Z3NSVFlFMlVnaTVHaEVLK2VpUmpCMjkwZmFpc0NQ?=
 =?utf-8?B?NWRQNVBTYVk2RHExM1k1Y2tqUk0yaVpUSTkwUnpYQklDNnJaM2h4alg0aEVP?=
 =?utf-8?B?NDRTMC9oZzQ2TVVyYmhUcDRlQXZOZERsdFFDRXFWS2ExeXBmYjZ1Yms2RnR4?=
 =?utf-8?B?dy8vVFNBYmlvcVZpb3RkblE0WUN0aW1jNzMrbmVHZ1Z5Vld4Zk53OUpDZStk?=
 =?utf-8?B?MUpSTU1jTHliYXpPSnhRR2x2ckc3QlJRTHI1dTdLb0JycDQrb0NuanBIcmNv?=
 =?utf-8?B?QnV2ck9nR2dLV0hFeDYvWXdYMkpZMGtuZmRQNnNCbzYvVWxWWHJ2WFo2MUt6?=
 =?utf-8?B?dWVKNzVFS2pTbitsSmpUOGJZaUJqSnFCUlUwSnZSN0hyWWxCbXVkUWN6QTJ6?=
 =?utf-8?B?Z1YzNlVDNC96d0pGL3I4L2Fmci9VOWtMS1NGckEreElJQm0zTUlDV3E4dDMx?=
 =?utf-8?B?K0dpZW1jNU1IQzdNZ3c0S1ZhR2haWGZVNFZOZWg5WFFCM3lxcTVZalZodmVQ?=
 =?utf-8?B?MkRFL05UQXdESFpaV3UxN2NMM254TTRTQ3BoYVF2aG1HWFA0WGRpM2ZhekUr?=
 =?utf-8?B?NzVDNllqUU9vWWpYV3RrM1hmY2xDbGowU0FQYWFhUGRBUVIyUmN6T0RpR1RK?=
 =?utf-8?B?Wis3MmhySFNaeVEwNGZjSzlaK2ZGbDRKQzVVTjNobWpCWWtVRWI0NExaQVdN?=
 =?utf-8?B?UkhOR00wa21adXY5eUE2V0JOUllwdlhNTmdabWt3aGVkS1RJc2NPQ2VmVUNY?=
 =?utf-8?B?WDhGV2Z5dVFiMXg2bkh2RzZib1ZXc2JINGZ1d0FVWm9UT1NPOEhlZ3ZXRjRZ?=
 =?utf-8?B?OENnK0IyKzdyL0IzRHlGeGFEWjBVdzh5cXNxdmxac2ZQVWJWTVdRK3dPS1dW?=
 =?utf-8?B?QnFDNVdja05jWXJXcllleW1YNHI1SEUrMkx2MDF3RFJ3MlZiOTNtM21ST0c3?=
 =?utf-8?B?bkxmNVpnVFdLN2Z3RGRxaFg5RmFPb3FSeWg2TlpZZ3I4VFJNNGsvZ0lEL3ZU?=
 =?utf-8?B?aGNlZ1k1NjQ2Y1BreTh0RGQrTFJnV1MzbGwvMVdNMVUwendiUlFJYk94a2dM?=
 =?utf-8?B?MWoxaC9DRFdlSjROYzdoTFRiS01mOXZ3cHJONmpweHJqREtMSWRKWTN5NVZj?=
 =?utf-8?B?RGo4SmlFNUdKSksrNWNDZVlHdHZBQjJpWXR6YTM4VVVBQ2FPL1laYVk3bkJO?=
 =?utf-8?B?REZiL0pqdFNsbEdBYWd1NXkyMzE4UzBqZldJY0tsU01oM0tvUk8xV2dtNUx6?=
 =?utf-8?B?bnNlN1NUQzhCOVpPdE0ycWtObXpYQ2pHUG1ZbFFqTjFiUkVqbjlJRTU1eG1G?=
 =?utf-8?B?SGZaQ0t6eVZmbU9uSGhyNXNXTnMzNStYWlVDZDFnNUFZcWhjdGNHK05FWEoz?=
 =?utf-8?B?N2RjeUd4S3lSK0tRQmEvdytvZjBnVlNjSWFEVVlUSVRINHBLVHNpSHFGMUhh?=
 =?utf-8?B?WXBWNVNqS1ZESElqMXhucDlNTnJiTzkwdlMwSFo2UlBvdUQ1eGdGQzlPdDgz?=
 =?utf-8?B?bGNaZ3BLRm5hdGRGNlB5Y2tpQWNFUjFyK2lZemNpa2IyRzBFclM4WnBjbUFa?=
 =?utf-8?B?b3RMZW5ERWNhL1NPbytmZC9HaUp6UXhLR2IzUWpabExpTjJRYTVhSkNMTkxm?=
 =?utf-8?B?WmZmMTBFL0FFY05UcjBHaFovWHlYU3N2K0hWWVdLZlA3OXJzSmlneFZhbHQx?=
 =?utf-8?Q?2fSGnErOOU1C6PF24IJMDuJ2s?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E506CB8EE7C7CF49B739E551965C4E36@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rfKQOzuxzaCgv5H7L2uqvVLRnOCwMpWF3/ouqFxqIsVE2mUJ3q9vymoZTpNS4oKfR8JO6wlNbyZfeTjgKA5c9/tYw8xF0dLzY9WCbbUmh5Mn5z+PhyWWwgG1jbnNbkam8sMdw1DXehcEKcesiHrpEQVnuOrHi1cc2gNrnc+oz+d2HQFBntOfA+FcbXlmWSRbI/F7QxB/0B2RySi+As66acML/KxJs5VP1hySTzRKaGU0np7E5n3ag7SCdZJvKwxuKmcaTqEVsGgLCTKUnpDuitLamkmXkILqeqFZRx0bvfSZ4bKyCXvxNccJRPVnl+7wckb/0eYat5bOySQCKE8n8q2s2COE++2/jM+Jw/WU7WuR1qpGHPNYCT8tX2CzCVhX7sbaPph+fM5TObUvjvXtce3MZoabHq4dPfmU+h8HbhmmXiyqE9SIaVtnYlEv8ePEPUHIvKE4m7mB9mNgV7Zgh/YSFHwaN0ocQfRswTMQ4NPLRBNzAfHZLP/KVv2BVysHo9p7pcT8uzkyfqxqptn0X3Z5fZBJhn374NSfyG0YmQL2QmweZzqrrtLI7uUP2Cfmtae7nwi/wCXCLhX3d/PveDlokeoGrnNL4lgLjV4pkLIIX2P4UThaowXuDH8mHQ6HWcT3S+13MaTa0DIhWR0xMP9AWLRN/2GOS+gnzY0reqgiXVXz4nDJ+gqE0RSA5W5D//Oe5KP+uNSBAX3wHQ3GEBq98HanT49mvJNbJ6cKB88JGRuLPDrnpbcCyiG5laCN3SyWMxB9zWOXhDCodDMYA2vXgr1+ErcaVUlgb7qfy7lEH6oLsJyW08HpMkeDdF7e12aD4DWw8rCpMD92OUphKmI0ync4JBWcyv15TeSW/x0YlOwCaFGmYuzdGBW1hIxM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR03MB3378.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a623ccba-e1ed-4610-68cd-08dad129add9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 10:16:56.6604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbtcuZmdcgHI8mlpoe2WdKIa6DZsdnGJY7rnfvXg5ka8OgoHZ6ODRh06UHtB2tehVJ9XhklmCnxBsdfCIwCBJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5862

T24gMjgvMTEvMjAyMiAwODoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjExLjIwMjIg
MjM6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+DQo+PiBUaGUgY29tbWl0IG1lc3NhZ2UgaXMg
cXVpdGUgdmFndWUsIHNvIGl0IGlzIGhhcmQgdG8ga25vdyB3aGF0IHlvdSBhcmUNCj4+IHRyeWlu
ZyB0byBzb2x2ZSBleGFjdGx5LiBBRkFJVSwgdGhlcmUgYXJlIHR3byByZWFzb25zIGZvcg0KPj4g
aW9yZXFfYnJvYWRjYXN0IHRvIGZhaWxzOg0KPj4gICAgMSkgVGhlIElPUkVRIHNlcnZlciBkaWRu
J3QgcmVnaXN0ZXIgdGhlIGJ1ZmlvcmVxDQo+PiAgICAyKSBUaGUgSU9SRVEgYnVmZmVyIHBhZ2Ug
aXMgZnVsbA0KPj4NCj4+IFdoaWxlIEkgd291bGQgYWdyZWUgdGhhdCB0aGUgZXJyb3IgbWVzc2Fn
ZSBpcyBub3QgbmVjZXNzYXJ5IGZvciAxKSAodGhlDQo+PiBJT1JFUSBzZXJ2ZXIgZG9lc24ndCBj
YXJlIGFib3V0IHRoZSBldmVudCksIEkgd291bGQgZGlzYWdyZWUgZm9yIDIpDQo+PiBiZWNhdXNl
IGl0IHdvdWxkIGluZGljYXRlIHNvbWV0aGluZyB3ZW50IGhvcnJpYmx5IHdyb25nIGluIHRoZSBJ
T1JFUQ0KPj4gc2VydmVyIGFuZCB0aGVyZSBpcyBhIGNoYW5jZSB5b3VyIGRvbWFpbiBtYXkgbWlz
YmVoYXZlIGFmdGVyd2FyZHMuDQo+IA0KPiBJbiBhZGRpdGlvbiBJIHRoaW5rIGlnbm9yaW5nIGZh
aWx1cmUgKGFuZCwgYXMgc2FpZCBieSBKdWxpZW4sIG9ubHkgYmVjYXVzZQ0KPiBvZiBubyBidWZp
b3JlcSBiZWluZyByZWdpc3RlcmVkKSBpcyAoa2luZCBvZiBpbXBsaWNpdGx5KSB2YWxpZCBvbmx5
IGZvcg0KPiBidWZmZXJlZCByZXF1ZXN0cy4gSGVuY2UgSSdtIHVuY29udmluY2VkIG9mIHRoZSBu
ZWVkIG9mIGEgbmV3IGJvb2xlYW4NCj4gZnVuY3Rpb24gcGFyYW1ldGVyLiBJbnN0ZWFkIEkgdGhp
bmsgd2UgbmVlZCBhIG5ldyBJT1JFUV9TVEFUVVNfLi4uIHZhbHVlDQo+IHJlcHJlc2VudGluZyB0
aGUgIm5vdCByZWdpc3RlcmVkIiBjYXNlLiBBbmQgdGhhdCBjb3VsZCB0aGVuIGJlIHVzZWQgYnkN
Cj4gaW9yZXFfYnJvYWRjYXN0KCkgdG8gc2tpcCBpbmNyZW1lbnRpbmcgb2YgImZhaWxlZCIuDQoN
CkhpIGd1eXMsIGFuZCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgZmVlZGJhY2suICBBcyBJ
J20gc3VyZSB5b3UndmUgDQpndWVzc2VkIEknbSBhIG5ld2JpZSBpbiBYZW4gdGVybXMsIHNvIGFw
b2xvZ2llcyBmb3Igbm90IGdldHRpbmcgdGhpbmdzIA0KcXVpdGUgcmlnaHQuDQoNClZhcnN0b3Jl
ZCBkcm9wcGVkIHN1cHBvcnQgZm9yIGJ1ZmZlcmVkIGlvcmVxcywgaGVuY2UgdGhlIHBlcnNpc3Rl
bnQgDQplcnJvciBtZXNzYWdlKHMpLCBhbmQgdGhlIHByb3Bvc2VkIGZpeCB3YXMgZGVyaXZlZCBm
cm9tIGRpc2N1c3Npb24gaW4gDQpDaXRyaXgncyBoeXBlcnZpc29yIHRlYW0uICBUaGUgJ3BhcnRp
YWwnIHBhcmFtZXRlciBjb3VsZCBhcmd1YWJseSBiZSANCmNvbnNpZGVyZWQgYSBjYXNlIG9mICh1
bmRlc2lyYWJsZSkgc3BlY2lhbCBjYXNlIGhhbmRsaW5nLCBidXQgDQppb3JlcV9icm9hZGNhc3Qo
KSBpcyBjYWxsZWQgZnJvbSBvbmx5IHR3byBwbGFjZXMgaW4gdGhlIGNvZGUsIHNvIHRoaXMgDQpz
ZWVtZWQgdG8gYmUgdGhlIGxpZ2h0ZXN0IGFuZCBzaW1wbGVzdCBzb2x1dGlvbi4gIEknbGwgaGF2
ZSB0byBkZWZlciB0byANCm1vcmUga25vd2xlZGdlYWJsZSB0ZWFtIG1lbWJlcnMgZm9yIGZ1cnRo
ZXIgdGhvdWdodHMgb24gdGhpcy4NCg0KQmVzdCwNCg0KICAgLS0gUGVyDQoNCg==

