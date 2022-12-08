Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE7646F38
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 13:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457084.714918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Fc3-0004lo-5D; Thu, 08 Dec 2022 12:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457084.714918; Thu, 08 Dec 2022 12:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3Fc3-0004jn-2Q; Thu, 08 Dec 2022 12:02:51 +0000
Received: by outflank-mailman (input) for mailman id 457084;
 Thu, 08 Dec 2022 12:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uovv=4G=citrix.com=prvs=334de2702=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3Fc2-0004jh-8a
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 12:02:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac8b11e-76f0-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 13:02:48 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Dec 2022 07:02:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5304.namprd03.prod.outlook.com (2603:10b6:610:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 12:02:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Thu, 8 Dec 2022
 12:02:36 +0000
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
X-Inumbo-ID: 3ac8b11e-76f0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670500968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J9wr1uMF3GfKTEZtbQCvFSyis/7rfWI+8zGoBGgRtnA=;
  b=ZrLWh6SQX3wj7CMOb9sniL+libA7VQaxPhLSIJtWOb8E2inQ/F7GhIHT
   CF+K0X8w+9HEmTrJVUumCW2jEkKkb0ap0VrTNVsbh5fKcIT+BddjhlGmM
   gHd0yFtljdcov9koKOAgdGyT7aaz/g1AwMKN2LATY2Fv5ind/VbU8V00b
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 89759218
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3JRF5KrxUSJrcTmW7hEcI9FRyfBeBmL1ZBIvgKrLsJaIsI4StFCzt
 garIBmEOKyNZzOget13boyy8R4Hv8OEyoRjTlY6/Co1QXgT9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzylNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAwLdj3am8fr/IqiSOdQwYMhAtL1ELpK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXop6E30QfKlgT/DjUOBVr4oeCFsHX5fNcCN
 G4L9yEFlYg9oRnDot7VGkfQTGS/lhERXMBfHqs29QeJw7L86AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv5hDaq0g9vdCTz2h
 TeQo0AWnK4PhMQG06G6+1HvgD+2oJXNCAkv6W3/QWaN/g5/Iom/aOSVBUPz6P9BKMOTSAmHt
 X1dwsyGtrlQXdeKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vfe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:U1RytaHjBIw/KvNRpLqEi8eALOsnbusQ8zAXPiFKKSC9F/byqy
 nAppkmPHPP4gr5O0tApTn/Asa9qBrnnPZICOIqUYtKMjOJhFeV
X-IronPort-AV: E=Sophos;i="5.96,227,1665460800"; 
   d="scan'208";a="89759218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAUeIqIj6DeDQJ8WcXofBXbaKUaY2qW0N/kEJzfCwJ8bAbUdVTe14qArIZn6221Iy/XdSU1Tf3gTHhEusZPxSnYhpQhT3D/2bDDhGbGMSRnE7hn+bGJ2ufYGQDGmEVwrlH84jkuyo4uuJ8FbXz/1gOAHxG/8CGEiAqtIX96VgEdikST1JRevrimCxBfyj3OVq9tNnEfWJcBEOISYQtf55aFRBJ6LhBvy3XZGcIxzUOj/aK7pHjA11TcrlGmWMsw9li4MZfDRyr1WvM6GvD9sB/Hz5D+RGLDbunOMEnDbBm9Sl4VMJTJOjKTJWPo5mMmRnurstPUg2cRFJ1E60s+TMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9wr1uMF3GfKTEZtbQCvFSyis/7rfWI+8zGoBGgRtnA=;
 b=lOLPSojeR5zTH4oivrDwNoDKW2ImcoIfS2Adh0y5uP21T0t1i0GaVXtOdcV99Jx92o0067dsLtW7dIQBlQIX1cDFa3hEQIIpLsoTBJceJ4O8enjSamBDWXBL8qIpv5aScCavG9TJRcr5JCxuGxHQ4Tw3I39OLHRkvaCueouzwfE+VBMWnd/h+JGtaF+8H4kqTqB9FKqYTg5hFv1KemWGxl03NNnUY+maQx82XHAgptexQZEjvwAJ4MVO/rIuntUucDYqH/DzALYB1qA0KzoQcFWz3wOnHNnOkJaalL9pgHJ76dJtbEi2TBWmo7SeVFMNuUUBiDLVd7tmfXg38TxIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9wr1uMF3GfKTEZtbQCvFSyis/7rfWI+8zGoBGgRtnA=;
 b=c8S31cf+c17FBujJ7rW5+aYXgtp03lSxHflUvdCH3iqFOAC/d1XDAZZn+MMEl5A0jH2iIocNIE3y9kcSvBAb7V5fbfNN0d+rZTFfn8/aEw2kRojXfQJ2gz8ACsRaN5TPpSe1ej7rJO8wZd7cz8L91KDTwzlVIDOnX3ANUAIIUzE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
Thread-Topic: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
Thread-Index: AQHZCvLCk6L0DZ2CykKxacFzdNbhE65j5AWA
Date: Thu, 8 Dec 2022 12:02:35 +0000
Message-ID: <2650908d-ce90-3e11-a267-8ed4328d0ec5@citrix.com>
References: <20221208104924.76637-1-george.dunlap@cloud.com>
In-Reply-To: <20221208104924.76637-1-george.dunlap@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5304:EE_
x-ms-office365-filtering-correlation-id: 0e67a865-8f04-42c4-c170-08dad9141886
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /P1FWSM1bABaJ4JK5WAzP7322uILiTLgFwIbi2EhVSxM0mzVsMSwJbHePnFd/QF8FZUaJEalLGstSousWLrOUGCpnvb1FJ2f8LXpdybgWUhloNfk9KmleO8Q95NRe1Phng8gXB9MIkdjKrItQBPT7Q/ajmZ5QUXqUSUtWCqNsNmG3bLQYr+5fAcV8XRAFrF9rjOMzTLrF2mGXxPS3PIj5WiJcQVVBaW5l6T6BLHYLw/ZEABtFYOn+ZRhd3CXhbi6rpdN3C+s22S9Vg2ywlBQwVsN2K4uSb1xrJ8z8o9OTpvxduZ0ICus5niMrZNrQHs1G9ZzOA6K+4qrcedxs6oWTyeSFUuTr2JHEM0d6vm3KOKLWeqpom51XIfB9+ldT+JgUx5DSHbQLpLvrdi/ahtpIJfycek2yLVfoo94PYMVH9+ZWnZyXJ+Sk4GlS5Zdm1wOmW8ejUQ/iqkqQj1v0916Ffy7i7hJ8mgpPw/iG+MURitU33a4/dhQNLYHsywFt0ItYnT6NoMY/JebyQv3s9pmAXoNHvBHt8aZg7fHyuIDsmbhrqdBGpP+EcazGuZWU8u9QGME2acoeXBGFtsE8HG/tnePUmk2CPTU/WAizRpXKIyhl8ubE99hq+uDARH3ZWNUypsVfMBme5cHiJAx/GCrnyQoGOWMhSdItC19xwK42J2y2GgtO89ZkrI/VjMtv2pTBY4iwYSzUYMMlbyaj2HO97reeMmorsIJqDf7N1E5ctGNHo7D2KssO7xKI4oW3QN1SXwzmTAbk+uqgbZynO17cg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(38100700002)(122000001)(66446008)(66556008)(8676002)(66946007)(4326008)(91956017)(2906002)(38070700005)(64756008)(41300700001)(66476007)(478600001)(8936002)(5660300002)(6506007)(6512007)(26005)(53546011)(71200400001)(186003)(6486002)(82960400001)(54906003)(110136005)(316002)(2616005)(76116006)(31696002)(86362001)(36756003)(31686004)(66899015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZGJ6SFQ5cjdNL0tQZ1RNQW1mcWNQb0w4Y1Y4aTZEQ0xINUswNlE4SldRYjcw?=
 =?utf-8?B?eUFlSnhUZGZwbzBqcUlzMmgvekxqT2daeGVMSEY3eGc5SkhReElxa3daekl2?=
 =?utf-8?B?dy91VmhLWXV5dDgxY29Ud1ZrSExWek9FeEZoWXlsdU9HdCswa1UwaWo0WThZ?=
 =?utf-8?B?b3FENVJBMmEzT2Vuc2NJdi9JbXBQaXB0NU1YYW91bGduZkZibU1jbzRRYzha?=
 =?utf-8?B?K1E4enBkTmZSQThvdmsrNlFpU3V5eURZWmova0dpMnJldFRMM0FDSmJCMjNG?=
 =?utf-8?B?Q1ZzSDFxSnRJUmVueHdoNFQrREZxaVAyZ0YxVGJIR2REYWcrSHJONWJjR2dv?=
 =?utf-8?B?dnVibTgzUnZscGY0dlFRMm9iR3lNVEZDam83TitCU29vLzhjZnlwUHFZbnVM?=
 =?utf-8?B?czBPSUVUOEhlVXVDMHdyanRmNXBqOWF3bGQvdVVvdkF4TU81ay9vRzhCMFRS?=
 =?utf-8?B?azhDREV6djdBNTd5eWR0d3dyYWcxS2dqa25ZQnlIQ3RpSlBYQkVlMGJMOEMx?=
 =?utf-8?B?eWJqWFJWd2Z2T0VKeXduLzZHaGpSR21pNndJbktQeFZlR1Y5c0NUemxOUktn?=
 =?utf-8?B?akV2Q1NaSjZuREtxSUhnMDIyKzNUcWdCNytHZFA2a2dpQ1ZFRUp1NndJQzBD?=
 =?utf-8?B?Z1JqU3QxZmJJSnM1bXBLclR0ZGNKOTR1VDUxOEErUmdENzdrNGFwUmhPQUVY?=
 =?utf-8?B?WHlRakFXV3B1aFhyQjd4TmloWUpCOVdVWDVtSXVPVFROVEQzZ1BQME94NmJE?=
 =?utf-8?B?VlBaaTZSbXI2ZTBUdGYrbVV4SWRERXNlWUovMWx2ck11ZWN6M3RiVHo0ZUdQ?=
 =?utf-8?B?QnRNeHN6TjVtaVp1S1JPOFVLL1BwOFpFSFF2Z1RVYVpWN2lkZUNGb1VZeG8z?=
 =?utf-8?B?R2NzZ21OZ3YxQmd2T3VaSTJBQ09sbDFPbE9CZFlYZTE2d1dhNHY1M3drbmFq?=
 =?utf-8?B?UXdOeUFSVlk3OHpSYWM2akdhQlNmc2FVWFBDemdtclgwcUMzai9OQVY0MENl?=
 =?utf-8?B?TjVLRFlCdmhGaDZvaERGTC9pUEFQcDFvajRRdTIxSXR0V1N0bzEvYnBtLzAx?=
 =?utf-8?B?V1VYclFvWE5YQmpPV0kwNzJnYS9HeUVDbmtWZEw2cDg4YnpkaHdJV2JGakpt?=
 =?utf-8?B?VkEyVVJLcmVVKzB5Zmhwc1h6Ky9xQVlpTzVMMmsrR1laZi96bUozKzhnalRu?=
 =?utf-8?B?M1FLWjBMczJRUk02R2Z6SmVnMTNHZk9UZGVLdjkwaUNVZ21nM0VKeko3KzBu?=
 =?utf-8?B?NG1td0pWc3l4U1A0SmxTOHFzUUcrMm9OTVFaN0kwb2g0UWFaSGJrTUpmbW1i?=
 =?utf-8?B?RVAwVnpSOXg0bDl5elBjYnhqdG9rQnRxdGhaaE80OXhzQTBzSlV0b3YyZzBG?=
 =?utf-8?B?NjMzL3NNOHB5aHduSk1XMnN6WkNLKzJIellGT25KNUpTNXRpYm5YKzdmUGhx?=
 =?utf-8?B?aUwyemFEb2pHWDMyYjVYUWpoZnRPQUxUTGJOV25wNW96VDhDZ3FZYnJiMlpX?=
 =?utf-8?B?cVNQUHN0Q3VUYkNkbWMrVE55bnkzbVVrZ1RaYkVlb0JqMEhqVm5Dd2U1Q05j?=
 =?utf-8?B?aHplMTJaS05yYzRyT01RM2JteWJ1WVpBYzVOc1B5T2NsMUxITWozL0k4SnZJ?=
 =?utf-8?B?NlJyWVVuaGRtZ3BwYUJmb09teDZlSVpYaW1EQXo2amlvb2VCQnRySlk0T08w?=
 =?utf-8?B?TXVQNGF2eWNYc2NwNFlOMlMzTE05Q2kwUmplcTJ4YmRZZDNnNlcxOXVYOHJw?=
 =?utf-8?B?VWVmVG1KcFJWZzdnUGJhdXlDaVUxWGlIL0xZeVpzdXJ3dmowbTJyL295RTUx?=
 =?utf-8?B?RW5MelZBTE0zckdQNlZRaFFvbDVpdWlTZDcyVDhjaGJGQzFNOXBNK2NNRkJN?=
 =?utf-8?B?UndreHhGSVQwZWZleHljRTQvQks0emljN1N1Nk9Fa0ZNb2VQTlZNVWRybkdW?=
 =?utf-8?B?ZjVxaEQrOEJLenhMRldUT1RmRFBxOFJxSFNqV1F5d2N0QVZPVDJId3RrTkMw?=
 =?utf-8?B?d3dOSzNkdUVET0RHTmo1MDVYUmZqVEphejk4SHhJRS9yWUUzcC9rS2tNS0hZ?=
 =?utf-8?B?bk5JWVl3Nll0eWVCa1VlSURpZUdnd29Kb1dSRm5SbVR1Smp5RERlUWowVmR3?=
 =?utf-8?Q?PYTMyTEwBXuHPWG7Cul16YxHz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B2EB9A75B973245B251D8B4CAE73915@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e67a865-8f04-42c4-c170-08dad9141886
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 12:02:35.9935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b2tU+pMIQXJogKmoIpDnf2bCSIG/s9dMGnrsj4DjEAm1PvGWJ5mvZ1k5nOiy19tB1mowZghOBlzDXPpdJrj12fMvofAXVSajJvuBCkK21aU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5304

T24gMDgvMTIvMjAyMiAxMDo0OSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gQ29uY2VybnMgd2Vy
ZSByYWlzZWQgYWJvdXQgdHdvIG1haW50YWluZXJzIGZyb20gdGhlIHNhbWUgY29tcGFueQ0KPiBj
b2xsdWRpbmcgdG8gZ2V0IGEgcGF0Y2ggaW4gZnJvbSB0aGVpciBjb21wYW55OyBidXQgc3VjaCBt
YWludGFpbmVycw0KPiBjb3VsZCBhbHJlYWR5IGNvbGx1ZGUsIGJ5IHdvcmtpbmcgb24gdGhlIHBh
dGNoIGluIHNlY3JldCwgYW5kIHBvc3RpbmcNCj4gaXQgcHVibGljbHkgd2l0aCBvbmx5IGEgc2lu
Z2xlIGF1dGhvcidzIFNvQiwgYW5kIGhhdmluZyB0aGUgb3RoZXINCj4gcGVyc29uIHJldmlldyBp
dC4NCg0KSSBrbm93IHRoaXMgd2FzIGhvdyB0aGUgY29uY2VybiB3YXMgdm9pY2VzLCBidXQgaXQg
d2FzIGZhaXJseSBib2d1cyBldmVuDQphcyBzdGF0ZWQuwqAgInNhbWUgY29tcGFueSIgb3Igbm90
IGhhcyBubyBiZWFyaW5nIGF0IGFsbCBvbiB0d28NCm1haW50YWluZXJzIGNob29zaW5nIHRvIGNv
bGx1ZGUgaW4gc2VjcmV0Lg0KDQpUaGUgbWl0aWdhdGlvbiB0byBhbGwgb2YgdGhpcyBpcyB0aGUg
ZmFjdCB0aGF0IGJlaW5nIGEgbWFpbnRhaW5lciBzdGFydHMNCmZyb20gaGF2aW5nIGdhaW5lZCB0
cnVzdCAvIHJlcHV0YXRpb24gaW4gdGhlIGNvbW11bml0eSwgYW5kIGNvbWVzIHdpdGgNCnRoZSBy
ZXNwb25zaWJpbGl0eSB0byBub3QgdmlvbGF0ZSB0aGF0IHRydXN0LsKgIEZ1cnRoZXJtb3JlLCB0
aGVyZSBhcmUNCm1lY2hhbmlzbXMgaW4gcGxhY2UgdG8gZGVhbCB3aXRoIGlzc3VlcyBhcm91bmQg
c2FpZCB0cnVzdCBiZWluZyB2aW9sYXRlZC4NCg0KPiBUaGVyZSdzIGFsc28gc29tZXRoaW5nIHNs
aWdodGx5IHN0cmFuZ2UgYWJvdXQgYWRkaW5nICJSZXZpZXdlZC1ieSIgdG8NCj4gY29kZSB0aGF0
IHlvdSd2ZSB3cml0dGVuOyBidXQgaW4gdGhlIGVuZCB5b3UncmUgcmV2aWV3aW5nIG5vdCBvbmx5
IHRoZQ0KPiBjb2RlIGl0c2VsZiwgYnV0IHRoZSBmaW5hbCBhcnJhbmdlbWVudCBvZiBpdC4gIFRo
ZXJlJ3Mgbm8gbmVlZCB0bw0KPiBvdmVyY29tcGxpY2F0ZSB0aGluZ3MuDQo+DQo+IEVuY29kZSB0
aGlzIGluIE1BSU5UQUlORVJTIGFzIGZvbGxvd3M6DQo+DQo+ICogUmVmaW5lIHRoZSB3b3JkaW5n
IG9mIHJlcXVpcmVtZW50ICMyIGluIHRoZSBjaGVjay1pbiBwb2xpY3k7IHN1Y2gNCj4gdGhhdCAq
ZWFjaCBjaGFuZ2UqIG11c3QgaGF2ZSBhcHByb3ZhbCBmcm9tIHNvbWVvbmUgb3RoZXIgdGhhbiAq
dGhlDQo+IHBlcnNvbiB3aG8gd3JvdGUgaXQqLg0KPg0KPiAqIEFkZCBhIHBhcmFncmFwaCBleHBs
aWNpdGx5IHN0YXRpbmcgdGhhdCB0aGUgbXVsdGlwbGUtU29CLWFwcHJvdmFsDQo+ICAgc3lzdGVt
IHNhdGlzZmllcyB0aGUgcmVxdWlyZW1lbnRzLCBhbmQgd2h5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNsb3VkLmNvbT4NCg0KQWNrZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

