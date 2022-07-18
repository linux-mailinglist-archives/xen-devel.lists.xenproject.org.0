Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B98A578D7B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 00:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370177.601862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDZBU-0007rm-RD; Mon, 18 Jul 2022 22:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370177.601862; Mon, 18 Jul 2022 22:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDZBU-0007ol-NR; Mon, 18 Jul 2022 22:25:48 +0000
Received: by outflank-mailman (input) for mailman id 370177;
 Mon, 18 Jul 2022 22:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDZBT-0007od-58
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 22:25:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f6a5ee6-06e8-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 00:25:44 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 18:25:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6100.namprd03.prod.outlook.com (2603:10b6:610:bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 22:25:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 22:25:15 +0000
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
X-Inumbo-ID: 8f6a5ee6-06e8-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658183144;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=O8s/22epmSW0ROXxM5/s93Lxh4l/wC9Iu7I+xmdXSzA=;
  b=Pzvw9SxsZGj2ZpwIKjFvjA+hQycvFkVMz31mOjD5bE1EFH0KXhjY3Ifm
   B7ZiN82uvsDI2yz3pIS0cPMTT4XQGqKWlf51yT/QupErwQO9u07pxKWSd
   mYjPJFD00l3Ksukx3Vw9L/8IEthnHALDxdVTVe0LueTFgtwC2ZO9ryIxk
   0=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 75377829
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eDWjwaJ9pkXkn6FLFE+R6JQlxSXFcZb7ZxGr2PjKsXjdYENS0DBRn
 2QYUWrTOKncZmukcttybYrk9EtVuZCDm9VrT1NlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYjdJ5xYuajhOs/3a+Es11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEw9ZBNHMkLZQkpLhwHVlT5
 8c6Bw4AR0XW7w626OrTpuhEoO0GdZCuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H12T+mLGUwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPCkmXaoij97gPJtRjEUYRDKuCxzdNNoHnPwDU2MyM1UVTu9JFVjWb7AbqzM
 Xc88So0rLMa+EWvQ8LmXhr+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 l2Dks7tBDdvmKaIUn/b/bCRxRu3fyFTPGgfYyAsQRYf49Dm5og4yA/MJuuPC4awh9zxXD31n
 TaDqXFng61J1JFTkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshVZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:rHpnk6n6jRK2FHwrVC/4uXtvdFvpDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.92,282,1650945600"; 
   d="scan'208";a="75377829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPdppAFAdizetjHaAmWub+eM+LyQ8c2m7sTwJrRTD72hKnqbYy63j+qEZY89tNXzZUYGdZqh0t0grmLQOBTbJZg19QnbWURkcek4hFVyK/tCUIg3B4EPaUNeTo2LZUifut/vxGFYKljUZXt/KXWArx2UtezG++7fBD1ZOPbKjyNbqoeMxAvMdgRydfBAXYFNKYtu0sekPjZmv1TjcFutUWP7YCs4xT4IMFdve37rvD0zWmwyAOS/NhgynYQlyN9+SDKPt7POK98m0gvd/eMbekIRxjNIKH6boFZrgx9mww1Ziszsbcj6sMotyPNsONYUeu/eoAAmUALxu5TwqB7LqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8s/22epmSW0ROXxM5/s93Lxh4l/wC9Iu7I+xmdXSzA=;
 b=AdsXfP08HxH7bKXjw/N8yB/UoWS+VusrF4TQj6GkgRHLZK5d9Q1sSp8VtkFiNYoagU7l5+Lqn0dW7wZilUuQ92g59E1EmtmHLMOsmyv/KUgr3Z1FfdatTWl0WmTohSQ5CiVsR1CT22F/N4RK3RzB97zLmNxs7yB/1124+RoREQ+dVkAl5KnCSjCRXXVZr5yb2uu4WMNkis+/9HRcWGSyUSlKRiAQyJWKDR7JwBSO2QRBhAJzG1lrC9mPY0zoWFgIAIVkldfwk7Oi35WCElGVsFtNwqLyjzkep+oQ4EYV7XyRhaOBZnC+y+qMQT/2fqMIR3Ho2HNT/1aEJe6kmqXtCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8s/22epmSW0ROXxM5/s93Lxh4l/wC9Iu7I+xmdXSzA=;
 b=Qsdu+lU5TPpgNI0tUPVmPb7fvdyXagVXGUtZDR//wH5OddvY3F38kX5+JsK9CAg4S2k5edTsMfb7CIUL8ZpvvbOkiJDX4UTePYauduYkL5mhEhHLgPRwQNEwkdP+YxTyZca0M6A35Yoco9sg/fYdcn7vWJdNL/XftOWMIbpefpw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "chris@dalessio.org" <chris@dalessio.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Michael Young <m.a.young@durham.ac.uk>
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Thread-Topic: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Thread-Index: AQHYmvJAgpD4dPs1E0ycG7IdcXuLNK2EtJsA
Date: Mon, 18 Jul 2022 22:25:15 +0000
Message-ID: <c78ac716-ade3-5f0a-7fdd-27e48285bf1d@citrix.com>
References: <1658179896.l7m1s9efz6ok84g8@webmail.everyone.net>
In-Reply-To: <1658179896.l7m1s9efz6ok84g8@webmail.everyone.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d9bcb8d-0884-4ed0-86ac-08da690c6344
x-ms-traffictypediagnostic: CH0PR03MB6100:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wQoJaktqfsItUpzRMrerR3FxPWb4SXAlFQ/F0G+5+hlVJRaziySpwd7mMkZC+MiXuVGTz89BUmV4BRDOdx+d4WM37jOb8/F5u86oaRal/PPeeUroDwnCI7KALMxPiPjZwRdpjl7/L71Zm6yUHZkWgQEGoM4M2P4vi+FhL8UFHtuZHdBhKmTGt9iDCiOLwHm5G1z2Yqe/LVinVSb8Q2lCJBt0WihQ6JtW5uJPlgsIAYejfrJdcoEBb971O/mR9nngttxGanuRH7qQkRmDsGk7M2XKVigSHTpsBb+aUJ7mTbZLOAY1OeQ7z4Oopbj8BSWhNSeqb66HAQNyk8kVjG8xQR5/99x7S+fcMfaVwTJXp0b5GfLHZRe8mTuQgXIrHKtA1/9IBjkw1omSNaWdZZ5tyuAZ+gRRo4ymsQ5Yrd1RmyYFImkxUEAINtLe8jkob0WMiP0FxwUQIECeEJuv714L0FFuCZnKmhANHkv0plJzkxOL1vOHHCivrQF/r1zUMywxK16QSzAZQrgcXO02DTon6OSNOpjNUfBrrvbCuW/LqGdp+e/y7fUC1C8SkU2qgMV/c5g/Gzu4RnGFlPdSHSkUV6sfs9mq3Cmc+8shJDIT/NMBPvuL+LiyYd0Np09uwhMgQNluK5u0mnlIKRUXJYopAeX93y8stKCARJbGu9GXrFWnFPoUhGL4v8kM5oHvgQhv3NW4HaibyFcVwueK7EYgl1TIQZPevVWspHtUARyEby3Zm1c/Zdvkfw3NR7HJBXNxq9ePWscWCmrX2C6+QllZkWbIsFitgYLUL8mWBtbqXJATCyUdrGAGxZj45s8YwX1ixKVcxiweYIqD36NLkpy4S/dcZZsiDbRAFGj+MrIlXUY+uyBOzZfWBXI4hOPaxPSWxC2PV/6kUx4fjoQu5AwRCw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(5660300002)(86362001)(8936002)(2906002)(54906003)(110136005)(31686004)(91956017)(4326008)(66476007)(316002)(8676002)(64756008)(66446008)(66946007)(76116006)(66556008)(36756003)(53546011)(122000001)(38100700002)(6506007)(6512007)(82960400001)(71200400001)(31696002)(478600001)(966005)(6486002)(41300700001)(186003)(26005)(38070700005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3ZNWWQ2OTRua0o4M2duZ0djVFFJTDQvNGY5RTE3QUNMRXVCSEVGbDViSUNL?=
 =?utf-8?B?bjRFMCsva3VhSC8vZ1BnOGJkb3VKTHFVaXdMOGpiOGVDSXJ0OVI1MVU3Q0Ni?=
 =?utf-8?B?TFBFcFZ2YURMRVFBa0hidU8wNmw4YWw2OWNiZHFLbzB6c0RYZnZBcG50L2tB?=
 =?utf-8?B?NlNNMHhEbVVlUFRFUklQeUFQWHRqbmRCZFhETi9LQXdQUm5yWUl4MVFWYVhm?=
 =?utf-8?B?TDBiZWVDNXJWOEdjK2lsblpyWW9HRWhXc200cGQxZko5aGFUSno3b3VGcWFO?=
 =?utf-8?B?cTM4MVFDM096ZHNpVkljM1d3TXEyK2JnT1BUQ09KUUlKTVk0dzJuWlJWWUFR?=
 =?utf-8?B?aUsyU3IwSXpaTkdzdW5Bem5vU1E1SGIzME54eEVMbWRZWVJXei94ZzFRMnRT?=
 =?utf-8?B?TG1JMnl3SEdBZloxdjVtNTVKOXFTNmN1Rms5N3VRUkRBdmYvSU45S29ZOGNY?=
 =?utf-8?B?WFppMXBLbUZ0OGU1SmVXNjZmZWVxQ1lGblVteWFRbG5tUkVwOTBQbHBDYSt0?=
 =?utf-8?B?c1JpUE5TQzdRNXR5M0FnNlVqOVpVWWs4ZEZSZHlrYWMzVlVSYWNVUCtkQ0Fm?=
 =?utf-8?B?TUhLUUtPWFVvT0VTT2lOZGpGc29ONVNzckEyOEhhR1cyRHIxYkZnTzYxK3hE?=
 =?utf-8?B?TmE4WWhsZmxGajlZdERnQlFJRWVqd2xQSkU3cWkxeGhzRTNObGF2eG9CSnBh?=
 =?utf-8?B?bUlWRFVua0Z6UnFCRWZlMXZQUTVrRnlGVGJXZ044QjUza2NDWElQNlR2RzZ6?=
 =?utf-8?B?Zk1pSVVCT2h0SjlTWDk2ekxXc1htbHdDaXJkYkZ1eFpsS1c4V1ZKbEQvNU1z?=
 =?utf-8?B?R0lNUG5idVlWNnNEWDF1VFMyWEI0Kzdqc0VSR0ZtQnZDRW80UFVEMVNGcFBN?=
 =?utf-8?B?QTlyS3BKTmRYKytFb2NXdXkxcmZvNDVoYUo1T3Exd3l6b0E5cVhINnRFcGNN?=
 =?utf-8?B?Q2hxL3o5OFRvZTJFRVJnVnVwYStSbm05KzlxU2ZmWGdSckhhWnVkNnZHMTZ0?=
 =?utf-8?B?UHU2VmNtcWVCNkRvVmVRUUZLRFNqWjBiNTc1Qzg0M3dMYjFBdWkvYUNrUU16?=
 =?utf-8?B?MFZlS3V4ZHBCVlYvLzBRQ05PRzFTTHQyTThSMWFUaC8vT0w5d21yK2hqUkQw?=
 =?utf-8?B?NUMyMHhocHJjOVY1Qktkc2lzZUUrMTFqZVhKMFRFSCtLQmRPWG84RmxxYlhS?=
 =?utf-8?B?citaWlNlZ2k4YXM2Z1RyYXhCa3RzdTNNRFpwczZoNGhKczdoeEgvdWljaFlD?=
 =?utf-8?B?em5Ta2kxNmtCdXZadHdQb09lVlVkZVJHTUNJaDZxM0xaaG1qbUIrTGpuWVMy?=
 =?utf-8?B?eEJVRm1PRnhhWGJ0WU1lMTVRd2VUUnYxeitsV3cxbVllMWtUNXVqYk5ob0s3?=
 =?utf-8?B?bFFlUjBwM0hsb2Uzd2J0VUJUcEd1Q2U4RmxoYzRtWDVBanVCd1hCQlB5RkF6?=
 =?utf-8?B?Zk1kaWtqemVvV1ZTblE0a1U1TmJFUEtnVndkaFltd0liaXZjQ3NLdzRxcjhp?=
 =?utf-8?B?UlpaeHhueUhKWnJ4THA2VjdtSUVvOEFrc0RFNS9hZFhyQWpGTlprTWEzNWRN?=
 =?utf-8?B?Wkl0WXpSeXhnODdLYmZqcWxyYjJNdStzdCtPZVFmL2twZy85Z0NMZThGS1J2?=
 =?utf-8?B?eFpNSS84NjM5bXZldzg3WWNMeHlldFFva3hES3l5K0kzWDFWWFNQVlBQSmhK?=
 =?utf-8?B?aUx2bWtxbkd3ZVFIalBQTlliRkJGYWpkSWJRQWZ6dDRwaUFtc1dUcXB5RWRl?=
 =?utf-8?B?ZDFHeFBLV1pjNWlzUXYvWkJtU2IvL3R1L1c3dUprcWVndXlWUjJwZGo4OTAy?=
 =?utf-8?B?c29uT0xnUWgxM1RHKzVJUmlIS2xhbk5ELzcvd0w0ZUovZ2ZVU2s4aXFmRDFQ?=
 =?utf-8?B?dTVmR1lGNkJKZEJsaERFblhoTTY3bEJackZCQmJ0WmlUd1FIakJKWGFHc1Uv?=
 =?utf-8?B?Z2lwb2cxUm15MXhPa1NhM2tHeXdsekZwenAybnZHNHE2YWpWZEdIUjdaRnpE?=
 =?utf-8?B?RVk4bXlMdGxRdk1VYmhjeWNKWkZXejNTK3JMR09JVmJoemJpc0toZ054czZr?=
 =?utf-8?B?cEhFdzlUc2hOQ3NpYmxYTzc3RjI4SDdTNlQ1N0ZERzluSXNLNmluVWtHaXll?=
 =?utf-8?Q?QT8OYO8smPw21k4WNR278KAtC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BDF62F3BDC99841B1068B30DAFBF4EC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9bcb8d-0884-4ed0-86ac-08da690c6344
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 22:25:15.1680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CBBaWmmqkMjpYHtpFbSTNaou5LcpmPIoJrekML+nnxHEqpH0YdH859FRBM1I+prSi7RMEWguB7AE1RYUuZVPk42eZ4P1lcKi/G7IsLz79o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6100

T24gMTgvMDcvMjAyMiAyMjozMSwgY2hyaXNAZGFsZXNzaW8ub3JnIHdyb3RlOg0KPiBJIGFtIHRy
eWluZyB0byBydW4gWGVuLTQuMTYuMS00LmZjMzYgb24gRmVkb3JhIDM2IG9uIGEgYnJhbmQgbmV3
IExlbm92bw0KPiBUaGlua1N0YXRpb24gcDYyMCwgYnV0IEkga2VlcCBnZXR0aW5nIHRoZSBmb2xs
b3dpbmcgZXJyb3IgYm9vdGluZyB0aGUNCj4gWGVuIGtlcm5lbC4NCj4gDQo+IFBhbmljIG9uIENQ
VSAwOg0KPiBGQVRBTCBUUkFQOiB2ZWMgNywgI05NWzAwMDBdDQo+DQo+IFZlcnNpb24gaW5mbzoN
Cj4gTmFtZSDCoCDCoCDCoCDCoDogeGVuDQo+IFZlcnNpb24gwqAgwqAgOiA0LjE2LjENCj4gUmVs
ZWFzZSDCoCDCoCA6IDQuZmMzNg0KDQpTbyBodHRwczovL2tvamkuZmVkb3JhcHJvamVjdC5vcmcv
a29qaS9idWlsZGluZm8/YnVpbGRJRD0xOTkxMTgyIHNob3VsZA0KYmUgdGhlIGJpbmFyeSBidWls
ZCBpbiB1c2UsIGFuZCBsb29raW5nIGF0IHRoZSBkZWJ1ZyBzeW1zLCBpdCByZWFsbHkNCmRvZXMg
aGF2ZToNCg0KZmZmZjgyZDA0MDQzOWM4MCA8YW1kX2lvbW11X2luaXQ+Og0KLi4uDQpmZmZmODJk
MDQwNDNhMDBjOiAgICAgICAwZiA2ZSBjMiAgICAgICAgICAgICAgICBtb3ZkICAgJWVkeCwlbW0w
DQpmZmZmODJkMDQwNDNhMDBmOiAgICAgICAwZiA2MiBjMCAgICAgICAgICAgICAgICBwdW5wY2ts
ZHEgJW1tMCwlbW0wDQpmZmZmODJkMDQwNDNhMDEyOiAgICAgICA0OSA4OSA4NyBjMCAwMCAwMCAw
MCAgICBtb3YgICAgJXJheCwweGMwKCVyMTUpDQpmZmZmODJkMDQwNDNhMDE5OiAgICAgICA0MSAw
ZiA3ZiA4NyBkMCAwMCAwMCAgICBtb3ZxICAgJW1tMCwweGQwKCVyMTUpDQpmZmZmODJkMDQwNDNh
MDIwOiAgICAgICAwMA0KDQpTbyBoYXJkd2FyZSBpcyBjb3JyZWN0IC0gdGhpcyBidWlsZCBvZiBY
ZW4gaXMgbm9uc2Vuc2UuDQoNClRoZSBiaW5hcnkgaXMgYWxzbyBmdWxsIG9mIC5hbm5vYmluXyBz
dHVmZiB3aGljaCBhcHBlYXJzIHRvIGJlIHNvbWUga2luZA0Kb2YgR0NDIHBsdWdpbiBmb3Igd2F0
ZXJtYXJraW5nLg0KDQpNaWNoYWVsOiBBbnkgaWRlYSB3aGF0J3MgZ29pbmcgb24gaGVyZT8gIFNv
bWV0aGluZyBoYXMgY2F1c2VkIEdDQyB0bw0KZW1pdCBzb21lIE1NWCBsb2dpYyB3aGljaCBpcyB1
bHRpbWF0ZWx5IHdoeSB0aGluZ3MgZXhwbG9kZWQsIGJ1dCB0aGlzDQpwcm9iYWJseSBtZWFucyB0
aGF0IHNvbWUgb2YgdGhlIGJ1aWxkIENGTEFHUyBnb3QgZHJvcHBlZC4NCg0KVGhhbmtzLA0KDQp+
QW5kcmV3DQo=

