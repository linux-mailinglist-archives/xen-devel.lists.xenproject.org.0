Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C802628987
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 20:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443568.698184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oufJL-0006uy-AT; Mon, 14 Nov 2022 19:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443568.698184; Mon, 14 Nov 2022 19:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oufJL-0006rL-55; Mon, 14 Nov 2022 19:40:03 +0000
Received: by outflank-mailman (input) for mailman id 443568;
 Mon, 14 Nov 2022 19:40:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ip0=3O=citrix.com=prvs=31080188b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oufJJ-0006cc-Bx
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 19:40:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e82b18d-6454-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 20:39:59 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Nov 2022 14:39:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 19:39:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8eca:f9cc:8bf5:83a6]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8eca:f9cc:8bf5:83a6%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 19:39:48 +0000
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
X-Inumbo-ID: 1e82b18d-6454-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668454799;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7gWQsTtoviTYbO4eqLT38yq1u5IitY5vz9hOq+o1nnQ=;
  b=O0760g9nIn61Z9aTLQu/0v1/KTQoPOcDVrKJWI/210rOGY3E2953HXJq
   hvMb2ySGCqCgCdHTwTM0M0DS26d86aaVSaH9DNj+I+qN7cx0MScafguiq
   kRTnUwde0RQCCzW3/hJ5Eq0htZNva0poeVk8mlSzlYKQICkqgg6EiW17f
   k=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 84797466
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zoGjUKD3yj9EARVW/8viw5YqxClBgxIJ4kV8jS/XYbTApGh00DYHy
 jBJCGCOaK2LamvxfIxyOdyx9UwGvceEn9ZmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpB4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp9lGQmJU9
 PEjETUWQQHdmv260rLic7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+TwnKkBNxMfFG+3v1Rjnuy7GZKND1ITFLk/aKI0WqHcM0Kf
 iT4/QJr98De7neDS9DnWhSirX2svxgCWsFRGek39AGMzKXP5w+TQGMDS1ZpcdEjqYo6SCIn0
 nePmNXmAyEpt6eaIVqG7audpz62PSkTLEcBaDUCQA9D5MPsyKkrhw/LZsZuFuiylNKdMSH9x
 XWGoTYzg50XjNUXzOOr8FbfmTWuq5PVCAkv6W3qsnmN6wp4YMuvYdyu4F2Ct/JYdt/HHx+Go
 WQOnNWY4KYWF5aRmSeRQeILWra0+/KCNz6aillqd3U8ywmQF7eYVdg4yFlDyI1BaJpslePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:z1LX069tIWtKpQZSvVJuk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r52u4DrsAwcuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+/3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqjNT7krJ9R7GkmjJl+WiR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="84797466"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiyBj+etWIPIcMya8mv2nJzD2DDRIbS4NerLA2MbhRwC3+K2G85yShncCVVePtU66VrvcyKpxrye3ZtPUItYNwjV0xbi3PhzuOU3CWvstW6ORckDsP0AfQX7y6x7EmCwc5supw2+LBTQdqWqrjhkR7Z+5a1PdprL6qt1R/rs1dQ7hpkq6UYu4j+OR3u3Q3+ixtEWaUJJd2Q0+n2lauqSHkM2XljCjxbUnRysQdf11GrZsiAarzjIL1uhF5Tgto2UGWu7Dg/zubnrS2F7U1HiI3ib8G4P3lB8YXGRARy2rCh93V8/A2JGGNJ1yhganXlNZT3dEVAnsf9eHBuOeon2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gWQsTtoviTYbO4eqLT38yq1u5IitY5vz9hOq+o1nnQ=;
 b=YHNZ51IUlnKZFqXo/rpa7fZcpWkAlhUODLhHvQu+LrinOfMxlxEOLl4/cWf7u49hsI7K+97ELPJepkklHdEyL8hfrkHnlJ0pkKQW/kdBwTnQDV1iRR8QtKtNv0AA6GNWHZ3bQfSr3SpWTE5f5g8eC/sa/XDAzO4yLAHgadqsw8EdwyXLIEI6rLOnARR8zn/ehzaTBvmAQQDgG/ksOBOMK2I/uT/7dYK+1WNAQde0cRmUiOnBelOLKWp76SHexBR5R5R3+PM+nSYf6dNsXTCsx3sDeMuI2aQgpZg6/EL5tjm5Aaa63xCznkrruqkVz8FXBy+Ci4qHFRWmxiGvUEtbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gWQsTtoviTYbO4eqLT38yq1u5IitY5vz9hOq+o1nnQ=;
 b=uqdbSWuB/2BS8tB6eCendTE/VKhm4zlJCKD7cDwR360KKDfa0y+RrWNbpsFn+q7/fogar4MQeYxb4MTrzvg2/d9/Ox/myJOehSumNEdXjjk02s6rRARJDD2rJ88wnChgtzCAaD5qMyGFbWWPWTmPjniCDQW32BPt6uKcr4/MP28=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Thread-Topic: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Thread-Index: AQHY+F5BmJFZlWQQDUevznp0C5ln9a4+0PkA
Date: Mon, 14 Nov 2022 19:39:48 +0000
Message-ID: <5f2b496a-f1dc-aa45-9600-aa9e5bbede8e@citrix.com>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
In-Reply-To: <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA0PR03MB5610:EE_
x-ms-office365-filtering-correlation-id: e6fd53ed-4e37-40e0-7f88-08dac677fdc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jrn2/T+NTZTKAkcxIjDsAUZr0hbzoEroykQNvpyhagrB8gvVtsFWQSXYPzIoGJ/iVHzM9u1mmwnoHcCiI6O4q3zS/J/1qbNLmgNYhpGELGHQ2yvUznho+qY0HxfAXE8vnfPNB0ql5ImpOWkkiZHsvxEtmBsXZDkyjlX+b//oRBfVFdAypGvGjahSYgSIWAWuFE+FVVnr0ZZbCpZVxtGGpJ1CzSIAEWD5ZIwSvxCdOTW1ykYRWzT3FXMIIXy93p+371evekCRmOBJ9VCcZNOdG1Ln3TkcFkHf2ZXK+aw0e4AqeYYE4JqC9Hr7zVRY3DysQgZgfqX7vSMO1Y9TGwpaLTPIwdtxJfhlgOY2Gtj+0pQqkUvaR7vc/SHH11oLCbvFoiD1wzOkE27AVC4CPE3PXLkp8xXb2Mja7UA4zO589zRtOfNrJfGLXaYJVZVg4jLlA95Qq5qhr5CBpcBRfkoe5pI/61NCYk0LQ6ZzFm+1k7QNbPTeyePokSqnQQZjP95LRAjsEADvfeCuq5tDZ+ktZVWJiOssU5hIKZnT8a9NdEa+f7eC8a66s+xXETS0r4kqjTlhotH+oqQTa7waLuMI6JNcwuz1KX4oDUc3a0Ik1VETEyardjPJwNBWNYtQvFfFTJoV7DDb74smbBty4ekaOEIFAEB5jd0XSPsB4OKCYcUmCr+zIo1EXw/4Y07AndmA/VZE8H8FITF5Hc9WzJ+gUpesHE+BWw40cebtB1n78H4aUQVq4CqANle+jd+yvrr5awHGYBBbiGefGlxarPiM9s0ah059ze0y07rX2YdwWCxqE8Nxw91guzmaxk5Ive/T
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(26005)(5660300002)(31696002)(41300700001)(86362001)(8936002)(2906002)(2616005)(122000001)(83380400001)(186003)(6512007)(316002)(38100700002)(82960400001)(66946007)(91956017)(66574015)(110136005)(66556008)(66446008)(8676002)(4326008)(64756008)(66476007)(54906003)(6506007)(76116006)(6486002)(53546011)(71200400001)(478600001)(31686004)(38070700005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDE1TE14azVyS2JJME1KM21IRDRmZ2pvMFNnWXhZN2VqTi9OY0RSUkc1SVVI?=
 =?utf-8?B?THNaQXVZL1lzdWMyejZtZzgyWHYvYldzWUFvc0NONjRMWVpWMEhLTGJwYXNJ?=
 =?utf-8?B?VzExdTAxQVhIQWpXU3M4UkRIdHRNeE83bGRtNmNtU1dmcGdKODBFeTk3MGxH?=
 =?utf-8?B?VFVlbjNpUmoraGQ2eHBKQ2ZDWGw4UDk0K2ZXcWVuKy9SZEx4OFVoRktQUkUx?=
 =?utf-8?B?cWZxUnpqM3MyNGNGWHJLZm12dlZ5WUk1bmErUUYzSEhyUFZVU3RGK0NSaXJ1?=
 =?utf-8?B?Z29na0RScnlVWlNPRldqSHV0UERpRXgwcTFDTzVTSk5nZ0NBNjJwcUlweVk5?=
 =?utf-8?B?bzVQR1ltL2hwcmRhcGtzeWsrZ2ZGOTVCaHZMVXE2S04va05Dbm4rYjFGMFlr?=
 =?utf-8?B?Ti9xNjNoQjJkTWoyQTQrY2UrNkhLYytvSWpud1ZnQnhWSmQwVmVEcGxmR1oy?=
 =?utf-8?B?alZIdk9KdStTb1NJczczVThra2pzMHBLcVB1blVyWkNIaVU0S0RmS3ZJTkx6?=
 =?utf-8?B?aVMxaFh6eWE0cnB4ZDZzbFNKVnFaOUUvQmt1RUxad1BWZDNQOHBLZ2dOU0Jy?=
 =?utf-8?B?WEo1bU4yUzlnMHhQbXZ2M0JHeTFQT1V3bGVlaTNjc3pMdGVVRmI3aFdEWC9w?=
 =?utf-8?B?ZlNxUHJSZGNmQVRuZ0wraTM0SHBEWDVYZ0RJQVgzR2VDUUtjd3JsUlJTZ3gx?=
 =?utf-8?B?N2FpN2QxV2F5WGN1ZW5TVUI1NFpiMWszWHZYNytKWXh5UHdDRkg4eWg5dmhF?=
 =?utf-8?B?cUpnK2pIemlBQTJGeG8wQXVuWitLZU43Qk1xR0czL0pJUGk3dnhGMk5DWjhr?=
 =?utf-8?B?RDRTU0tIcnY2dlRmbVQ0OU5mVHRPa1ozS0xaSW8wUmlFOWFEdFNQQmNaVDdo?=
 =?utf-8?B?OC9waVV6dFVYVlBzbFBndGZ1SEhiNVhZSXFDOCtYSHJPMnRsTFJPdWFiOEho?=
 =?utf-8?B?VXZrWEx5OVc5YjNaNTdPVHRBcDZwV3VCaU1RQ0grOTA4WG9yU1k5VWZaMDJU?=
 =?utf-8?B?YkFwOWtMVGowcTE3bjArUk93MkhtV1hSbEdwZXJjY1Z5cjAwWHhXeGg1aGZp?=
 =?utf-8?B?SVVDWVNhdUZBc1V6S1o0bXBKai9leU5YamI5NTJ3ZkliSXBiUU5nTkhoYm00?=
 =?utf-8?B?UXh3K0xmdEJHR1hUYVhBUWVaTU83WDc0NVdkalJXQ01WNkdyeERtQUl3QlZW?=
 =?utf-8?B?YXlHUmtoa1d5bU9vZFhTUGVlMjFWVG42cXR1RUJWcUJsTWF5YTY2UkllRkdN?=
 =?utf-8?B?WWVxSEFjRUgydVBrY2FwMDh3YVE3MmhaUnRFcyttS0FOSUZZb0dCL2NlOUxs?=
 =?utf-8?B?V1FlTDNiTXFFZ0Z3MHF1Y2R0SEtEcE0xOTNGRjl2SG92TkRFMzlaVDYzajBa?=
 =?utf-8?B?T3lYWnk3UmFZQWxMQzdsRGQ3U0hnVHpaazE3UlhoY1JXVE81anNXYld0Z0o5?=
 =?utf-8?B?SzNHOCtDZkpVYTVqd1VPaVp4a1BNNDlkOGRXWnhvTXNXeTVPMEh6aFlNSlU3?=
 =?utf-8?B?VTFBMlAwcFFFd0h3dXhCNWdEekV3dkRNQVZCbnBnVEQyaXJoZGxCRUdOMEtk?=
 =?utf-8?B?OTBJaGFzdGhpR3B0RDJ6WlFiVHlPUktQTXRManlXZHZkdFVzdzBpSktVRUtW?=
 =?utf-8?B?eFlyVzBqd3ZTeFUwVVBpZ1dhTGtZS1pCbDhGdWsyWXJqSkpUb2l3NG5saWto?=
 =?utf-8?B?Tjc2bE0xSW5Db1MvSGFESk5GUGoxZkFiY3AzcW45MlIvQkgyLzZzcWNZbGM1?=
 =?utf-8?B?VEhLVy9ZWHZLWDgrb0J0YnJzbTkxRERHN20rYm53NEVnd1hKK1pGYXZPTm52?=
 =?utf-8?B?S1ZOWnR1L1RSaEs2VXVFcm1sWFJ2NmRyeVltZEdJWkJkWG5hWG9ZSjVleEZJ?=
 =?utf-8?B?Snk4cjBkQzg2aHI2WmFEVk9YckJLWE1MdUdDNHBTQjFYVjBacTNJME5ERnZF?=
 =?utf-8?B?bkR2dDhldTRrOGlBS3BFSlNrU0FrNmhaRkFuYWRFYXg0RUJuY1dtd3BRMkt5?=
 =?utf-8?B?UkxPKzR5ZStFMEtjU2tkb1A5bG54T0ZxeE00QnJpaHNLak9ZRVJtNXgzME1S?=
 =?utf-8?B?N0JVNHoyRVhpVU13bWI2a2NuNUFGSnlpbUp1YUVkcXZSbjg3TlBvVEhmcTRF?=
 =?utf-8?Q?xG8dWWUTLAmEOjSOHK7K9369E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CECB2A6C391C21469B14A1F4514AB78C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vqr4s6RYTSuslumP3wWKitZHnss2E7f8zNFKPU9OPMCrnwxAn2DcGZ+BKZUa2jJMov/7wRknRDjI69LAcUptQF2ObulqYjElY0dCJpa3Dw/C/3s/thpWXzCIO9OYKH/EvVHVxGDQ7nQQ/oEe1/I2JWKU7IozMDDlqSMT47529uw4sRfh2QGPfZP3rtoX2xC3JuArstkLf3kngNGuTGlDPkOav4PAWTXj2qlm/rrlHzF1IiyOHhFrcMBhpmG9C0UQEzjZboxxHeQLh9Z0H7FW9xvFATLZ/V5G8P1vAcce2DKD/UWvlxga7UzyvknbTZ+CdGT0aVaVpTt9FkgzRkVqN258Yb0x5D+jcZxLX/uwfQNmMuWuXWAAjCX1t2xwSC33oFZ5p+PyCWAkVcuPfvjrGxtNQiiuSrDQ9lLL8K10/ePMhkLDKpfmPzCm9UODLB0IzJSAZtd1DIOEGZOAMwYqgtjO51K66yYTgAigSOSnlVZra0WcHeALgS2ALiXyIaCxieSCw8we3BJveg/MjXpFIk4fMeF/z8RU1e24qwKJhKbwXkUXK8OebaiugADRploSPRRCM3eey5lq8BGRSEIrRvVGMrVvwzhr//rDFnYTHOGbjyY8ZLd3Jd+IyTRB8kqQJ/XviQgiAe8YgeGkSPbSlSOJD7BJpcgJLXEi+v9feKZrQaEXaidZ/OQgGqwIO6DBrkQLfD8pX2dBq6WoCNmUroo71pSquugvxygzzSnUW49aLGmxZHuj3k9vDvc/HKuFI+arjGwWRRZLDgsL1PIlBRIg26d7V17IhQBE5/0W9QBrLIfOfK/u3w0qJCszc4BC7UPbsvcm6Mnqz5ny/L1lXulWFFgoaK6yaJt/RiQdmqJlBV1emKiVua83nQUk+dsutHV4Qn30lu6AuiMSpFT51MNiRrSd9KYArUytetvbokE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fd53ed-4e37-40e0-7f88-08dac677fdc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 19:39:48.7439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sd1Dcm1hyQF6R+dC+p453OOMjmvh0X96SlvBaqUc1VqkzjBLO7k92rML5Ct/Akods/r8NSyIhw9kt6R6lWnJeZzv8yXRuAI5v2RfIRHLhUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5610

T24gMTQvMTEvMjAyMiAxOToyMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
PiBUaGUgL2Rldi9tZW0gaXMgdXNlZCBmb3IgdHdvIHB1cnBvc2VzOg0KPiAgLSByZWFkaW5nIFBD
SV9NU0lYX0VOVFJZX0NUUkxfTUFTS0JJVA0KPiAgLSByZWFkaW5nIFBlbmRpbmcgQml0IEFycmF5
IChQQkEpDQo+DQo+IFRoZSBmaXJzdCBvbmUgd2FzIG9yaWdpbmFsbHkgZG9uZSBiZWNhdXNlIHdo
ZW4gWGVuIGRpZCBub3Qgc2VuZCBhbGwNCj4gdmVjdG9yIGN0cmwgd3JpdGVzIHRvIHRoZSBkZXZp
Y2UgbW9kZWwsIHNvIFFFTVUgbWlnaHQgaGF2ZSBvdXRkYXRlZCBvbGQNCj4gcmVnaXN0ZXIgdmFs
dWUuIFRoaXMgaGFzIGJlZW4gY2hhbmdlZCBpbiBYZW4sIHNvIFFFTVUgY2FuIG5vdyB1c2UgaXRz
DQo+IGNhY2hlZCB2YWx1ZSBvZiB0aGUgcmVnaXN0ZXIgaW5zdGVhZC4NCj4NCj4gVGhlIFBlbmRp
bmcgQml0IEFycmF5IChQQkEpIGhhbmRsaW5nIGlzIGZvciB0aGUgY2FzZSB3aGVyZSBpdCBsaXZl
cyBvbg0KPiB0aGUgc2FtZSBwYWdlIGFzIHRoZSBNU0ktWCB0YWJsZSBpdHNlbGYuIFhlbiBoYXMg
YmVlbiBleHRlbmRlZCB0byBoYW5kbGUNCj4gdGhpcyBjYXNlIHRvbyAoYXMgd2VsbCBhcyBvdGhl
ciByZWdpc3RlcnMgdGhhdCBtYXkgbGl2ZSBvbiB0aG9zZSBwYWdlcyksDQo+IHNvIFFFTVUgaGFu
ZGxpbmcgaXMgbm90IG5lY2Vzc2FyeSBhbnltb3JlLg0KPg0KPiBSZW1vdmluZyAvZGV2L21lbSBh
Y2Nlc3MgaXMgdXNlZnVsIHRvIHdvcmsgd2l0aGluIHN0dWJkb21haW4sIGFuZA0KPiBuZWNlc3Nh
cnkgd2hlbiBkb20wIGtlcm5lbCBydW5zIGluIGxvY2tkb3duIG1vZGUuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbT4NCg0KVGhlIGNvbW1pdCBtZXNzYWdlIG91Z2h0IHRvIGdvIGZ1cnRoZXIuwqAg
VXNpbmcgL2Rldi9tZW0gbGlrZSB0aGlzIGlzDQpidWdneSBhbnl3YXksIGJlY2F1c2UgaXQgaXMg
dHJhcHBlZCBhbmQgZW11bGF0ZWQgYnkgWGVuIGluIHdoYXRldmVyDQpjb250ZXh0IFFlbXUgaXMg
cnVubmluZy7CoCBRZW11IGNhbm5vdCBnZXQgdGhlIGFjdHVhbCBoYXJkd2FyZSB2YWx1ZSwgYW5k
DQpldmVuIGlmIGl0IGNvdWxkLCBpdCB3b3VsZCBiZSByYWN5IHdpdGggdHJhbnNpZW50IG9wZXJh
dGlvbnMgbmVlZGluZyB0bw0KbWFzayB0aGUgdmVjdG9yLg0KDQppLmUuIGl0J3Mgbm90IGp1c3Qg
bmljZS10by1yZW1vdGUgLSBpdCdzIGZpeGluZyByZWFsIGNvcm5lciBjYXNlcy4NCg0KfkFuZHJl
dw0K

