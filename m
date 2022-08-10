Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E958F2BD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383843.619047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLr3Y-0001Se-0y; Wed, 10 Aug 2022 19:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383843.619047; Wed, 10 Aug 2022 19:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLr3X-0001Pu-UQ; Wed, 10 Aug 2022 19:07:51 +0000
Received: by outflank-mailman (input) for mailman id 383843;
 Wed, 10 Aug 2022 19:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLr3W-0001Po-A4
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:07:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7c9d8fa-18df-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:07:47 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:07:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6106.namprd03.prod.outlook.com (2603:10b6:408:11b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 19:07:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 19:07:42 +0000
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
X-Inumbo-ID: b7c9d8fa-18df-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660158467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tOooJxy2bu8fw3Zgp5s5qca9HBaouVICyCWWjcLV4ug=;
  b=gP7D12p9XfL1H5KIKCuEn6NEypf0gHP/RYPP1lxjh7J2iVQpPJTY/49O
   NCe2iOeA80r+H+izJN1hdknkPKhaTMH9Ruj8EE5LiDrJ+dJUqopjmqhWF
   HVIo65hzyskIJnVO5V/P5FFBIhqm7hhbgEAZIX0G/0DRzmH7Ile7RP3Lf
   4=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 78252424
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HpFHRaIitmx06fzDFE+RyJQlxSXFcZb7ZxGr2PjKsXjdYENS1mAOz
 mMaUWvTb62JZ2egetFybojl/ENXvZPQzdcxS1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Es01BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE585HVkUEH4IhwP9uWERv5
 N0qOSITR0XW7w626OrTpuhEoO0GdZCuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H12T+mLGIwRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPPk2ffrijw7gPJtQrwdKUPRaWlz957mGeMnmojJR4qcnLu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9WopWm1876VqXa+PHYTJGpbPCscF1JavJ/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:OaPtTKPtgVZiX8BcT+n255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/+1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3vXklVavoLhiKr7zPI9
 MeSv00I8wmKG9yWkqp+lWHBubcBkjbUC32GXTq8fblrgS+1EoJs3fwgvZv3kvovahNNaWtrY
 7/Q9tVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjvwQrPMkcIIDduRCeo15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfHWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6NvPEQYQKZRqXSx+MBLEGBxZlj9GEkDPw+jiEFzVKk+8qMNTpO9qQrYU
 oWGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="78252424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS1c/ixhtigDSy+WYfxGS7IQCioDVwsMvOx8YlJeDYxjVYCbP8FWnFa2oCMeSFNh4vPp7HZdziLJgLTYsCCCavGjcFHukrms/mA4rabJA5F3cbEgUclfCAfAz4SaMX7FxcpHpsS+nZHG2Jm3OcHmaCztuwT1k+03qLYqhH5pM29yfBhyH8j4iZnbC3Ax6eSkMgk+5nPxgNJaMnbMOzx687842OcMjT3J1q8OhU3su+C4s3j19CJWCsSXh8umtQGofusNLQkgN6D2QmAqpwQzWyrerilqEBNZUceOTa36Z+ikHRIIXjX456DM84In6LbJwYUXYXo2b6Fc3Tc5ak3dkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOooJxy2bu8fw3Zgp5s5qca9HBaouVICyCWWjcLV4ug=;
 b=HBZnSvyUnPXq2T5zk9rQL4a8Iqgz6Yf5Ty0088i69stUhTUV0DtvDVg/vyAol4CtWPoVEirbiXPSGCiXzUy3qY9jl6QrJNF/MDAM+eK03s/MyBmG+5Qt2/jxwYuS9R+SJAojs6PmS0gz+UE1F4pcnVQQZWnNJMtWgBPcvFEWMui6DCL6j1jtiG7OD5paesQ7NqMHSa7r+7cWfp19TfLgC4TskbedGE/PJYGpSDzvX0AXVifGpRK063MhFbI7JsYduQsmHIPiwQqWoAJCwCRuEmEGYAurrhql2UPnK3WVFtlAXrJgUBrbMYiOwUfNKlslBNNvdsNN0GMLw3bPLTxRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOooJxy2bu8fw3Zgp5s5qca9HBaouVICyCWWjcLV4ug=;
 b=ulj5J57RQWUlm4Xemf1XVjunctpVYECR/fFmEO5qzA9IWjk65G+M6Q6nxHAQVrZlAubbgMTI7dLrYKNCjbhU0QsmArRSLv1pgYnmR/euJ+6y8RKlNXImpChl1D40Clbh46hytbwHGmzr9kg+KTLG2b9buDkUtaZqkiwmG+ofx3Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 09/11] x86emul: handle AVX512-FP16 floating point
 conversion insns
Thread-Topic: [PATCH 09/11] x86emul: handle AVX512-FP16 floating point
 conversion insns
Thread-Index: AQHYgKMB+x4t4y5oT0i9TUf8CXbhva2o16gA
Date: Wed, 10 Aug 2022 19:07:42 +0000
Message-ID: <02383505-c26c-913a-52ce-b5f14f7be041@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <4d9c76d3-763c-c1e6-f38b-9282f023a995@suse.com>
In-Reply-To: <4d9c76d3-763c-c1e6-f38b-9282f023a995@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae7689a1-a317-4b3c-7f52-08da7b039a1b
x-ms-traffictypediagnostic: BN9PR03MB6106:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 MYp0Ef3RBmOFvfdv1IDcEKOFiOhmvmijA9/lyYqEiwigA4q8El//43GIUmGSS5S5lwSDpNrooiGhJAx1wJ/OEAb5Q8v3iF5GMNzs8xG73CDS1PzO3Rkkl8lqZSSQTYGojJyo6mvqR/Eg+ZyI5N7yahatDoNcjncbLyAHHZNjZrNpNCO3oFGPHAc920U93UhRk7dKlytA1/6PbAg4yPJyxvoneAHQnryudhKuWaUS7DZ+4PA4Al5G0E6qoliZHMnB156QmBloOVjE0CZHlmpKbjg6tfnxsIpsLbr24x3oPLEFa3z04w6WaHvPgpXNxUY7GKmqcH5OBYa8oN36h139boYXn9DPgRB7sYqz2JAlTV2fLwdIxkvCoV3axIqEScod1TDQEdUDXMrxqig/ov9YMVlHHe+45J4TNXnMgQq2KIoaffRhjWnFA3qrBi7P8tTM6gKL9+QWPs9v73x+U7IG3T11cKYDGXm7MiuzynWuS2VGHGQ4ZgW2hMWitDhjG6VP81fEyM049+Dznt9nIJrdWVtNKc1A/0gC0L2KlADAHvjq0R5M9IoKyQyN/Gq5Pmu+3VIpx7hbbJoLao/fpxSCeNrX2t5AmJv2AWFX4zP3ozM7j+nEj+LVKtVvlsN/N1n+WHJVmb1upc4ovfa4WBRS3tWvG1TgaMaMUERrqTq/KxkNc1h+imdlqQYs9GG6JziOOEX8mj/cirosNcNVkvqFqDg9lJ1VCeMYoolZZLTXV1CzHF94nabzHKyRlb2xRfLZuW+7hB4o0RCULjYzEVQoqVLFsaW2Mj5lvZgwFqnYAgqvJOnUu7Z2Dj+35s/Ic0p4kWQMIlylRSGOj8M7I4kC5IcjMKOtCRyASm9iGzYYppFvKLlBHXZxGFPFNtUcl8DjvQL/KatDaDdsJ3bw2y1o9NTAuLLUBi75UC5jY1K7WWI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(110136005)(54906003)(316002)(31696002)(36756003)(71200400001)(91956017)(8936002)(478600001)(38070700005)(6486002)(86362001)(5660300002)(82960400001)(2906002)(122000001)(2616005)(38100700002)(41300700001)(53546011)(6506007)(558084003)(66946007)(66446008)(66476007)(76116006)(64756008)(8676002)(4326008)(31686004)(66556008)(107886003)(186003)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YytnTFZsZEMxVGNxUWxIS3BnSmFoalJpOTZPYXAwSDFQRzJCS0ZVMnpKaWtl?=
 =?utf-8?B?UVdFZHFLcUJuOHRSMzZHeUNSQ2QzQUxwNTZseHJJbmFDM285b3FyaUhhVXF3?=
 =?utf-8?B?a0d2QWVLUTFVMzZ3VEJzUjVyNWJreHIyRHVsTEhmTCtSbXVYQTh1YWlHWTNl?=
 =?utf-8?B?dlI5V05ucENnRUt3eFBXYUF4cEI3RmF5TzIxd2F1bWZHL05VRHJISjdXZWpO?=
 =?utf-8?B?dk56emNXdEtPUkhuMTlYQlo1eDl6cWo4dEliZHpnMjBDYkxrKzlDU3VzMVlr?=
 =?utf-8?B?MWZnZmc0TlRTN1ROb1E4d1lDaFFkMjNLSVFXVm5SdFhhUjZDdmk0WDFOOVB4?=
 =?utf-8?B?eUFETm4xVERWNEM0YmkwV2RjaGFLYzJzV2YvY3NWanJVQk9UVmU4Q1dKWWx4?=
 =?utf-8?B?RlVXTkNLUGoyY3NtVkk1ZG1JOENPMjRwUGl3eTRpN2VBM3JiRko0ZzJ0ZVJ3?=
 =?utf-8?B?TFNNZVdubU95aUxuRzA2VEhWOGNtbktCc0ZXS2xJdEEwQzFNTVJDTi9NOHFM?=
 =?utf-8?B?aFVBaUNPdnA5N2NPTTRGVTQrdlJ3OWNrbUZOWTI0ajJhdm1GNXhNRlA0RFk1?=
 =?utf-8?B?NHM5akl6M0lBNG94MDNrMUtjTEpVOHpMelllUEcvTFFuanFBMldCZ3ZwV09s?=
 =?utf-8?B?T3ozelBvQTZyZlNHY21yOUEvZWxlU3llR1VqWmVISExjVDIwOVFib0dib2Rv?=
 =?utf-8?B?OUhqNDlleWM1RlFjRDFzRnpKWHdNNTI1eDlkNnB4V2htODNxckxaK29VWkVN?=
 =?utf-8?B?Qzh1OUhpVWdaMWozbWRDVFpWZE9xNmltUkVkTXdQQmlXdlRaYWZoMFo1aDlO?=
 =?utf-8?B?ekZYRFZRK3VRbXdjQzhGQkFtaVBJZUVtUXNFUjlzSEtaQ0hsc3pzTDk2azdO?=
 =?utf-8?B?WCtzRk52OElvWGlLRTdnSlNlbUdWRUZ5R25keFl1Rmc3SUxJcDZPWkM2bk8z?=
 =?utf-8?B?Nms3WUs5QWlIaUxnSHhwYUR0NHdkbHMwbDFaN2tDWktUOThNaHhrbzk3bmNN?=
 =?utf-8?B?bHJFSUQvQ0FGTnJSL0FScHlsYmJwZkFMM2hGaGlFL2lRTHV3Ujg0dmJYSUJW?=
 =?utf-8?B?UUpjMGZDcWpjZTJJK2NUamRXekxSeE04QXEyVmZEelFDNjlTNkI0dVlNV2pm?=
 =?utf-8?B?R1QzSWpXUlNHWlBHWm9sREhZS2kvUzBqYTdOWFBhUE5VcGlJOUgwRkYzNTZs?=
 =?utf-8?B?VXgxeTZ5MXZ3ZmlKRlpnK01pSGZ1b0xSTTZlcDkxTk4yd0RvNUpFV20vaGJ1?=
 =?utf-8?B?M0FXQS8wdmxXNzhrdDZQYlVJSW05ZW92eWRuQ0dMSHJ4eFBSUnpHY2NlYndo?=
 =?utf-8?B?VjJpa0ZKQUREWnRTWHcyM1ZBaDR6d2daQTRkdTlPcC8rM0ZPKzhNM1JhZlhJ?=
 =?utf-8?B?TE9TMi9zajZoVnBreGEvY0FEa2kwUUs2V0x5K2p1QXpGcHZTMXhMcHU1Yk5z?=
 =?utf-8?B?M2ZkbjdwWFQ1MGRWTHp4elczZ0hXUkRxellMdE11M0IxK3k3UGVzY2tYdG9B?=
 =?utf-8?B?Wll1S2NFT0F2ZGRYQUlsRi9mL3M2T3lNWUllSmhrOFRvL2ZQNklxNDNmdXpt?=
 =?utf-8?B?Y3d2a2QydVVOaUIwaUo2cEhhelJzNmhTaHUySUhzY0F5YVZOTlJBelBPNFNx?=
 =?utf-8?B?aUtYanV6dmhzTlNmK2Q2cU5hclJmSlljYnpwSEd3Sm4ybjZzcFVxR21vSCtW?=
 =?utf-8?B?dmNvNFhNQjhFRXA2U21IMjRXbHNOMTJFNFBkajdzUTVZeEUwNkVvVmJQaTlh?=
 =?utf-8?B?WWpqMjZoeTRZMzBBNW9uUHBrMWtoM1BGQXZXMS82RjEyTEQ0UUtvcndsQ3du?=
 =?utf-8?B?MERJbWVlc0FwbmJmYXpXV1pzbG1pWjdqSjVTeXU4WHYyODNUL1k5cTExWU5K?=
 =?utf-8?B?YzBLRkhYYlRqMTNNZ29EMUI0NUVyQ3YyMkoyWWlvTDhQUXg1ZjV2MWtkNEFv?=
 =?utf-8?B?WlJEdmg2K3lwYm1MeHY5eDdUVEZ6aDkzc0NwNG5ZTnpJa2Y2Yy9oYWpCRDdR?=
 =?utf-8?B?UnQ2OFNEdWhYSTE0alRUZkVqWldoc0kwMUU2cCtRck5WY28vWmU1VFlrQklw?=
 =?utf-8?B?Y3ZJZUluYUwrUjMwV3FldVdreW5lZkpGQ0JNN2JEbEovcXN2ek9PNnk0M1Rk?=
 =?utf-8?B?OWhHWTB3c2IwSmEybzBjakVDQ2lad2dYdi9OOCsxaDdNbTZEci92MWhhUDYw?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66F12AD5B72DAB478D465183FBCB8A83@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	flRURK1WkWhFDsd4InSL2ja2ZFlB7MPstdhv3jCjjxASZh7BSJyDcl9vU7h14gr8rvEKLH7zYzzAA24C0hCUnfgpxKuVRA2kQ9sOPDHtb13mWDiPH6iWQIV45QOLq5D/tRwevm8RRpX3TcGuHqi3vQa1xdr/VAJ012BOdwtdrP0OZz34sES5ZYS8iCM4b2xj3vgUurwAwB3nVCrR5aX87R6vb+QA3SXYSeT2rotMHjWRZ+Qo3tnRvv19Nd+Tk0nmU27e4WJHRLEWEDFOmJOBZKaeZOjihiLtcsDNoYPxFREpTpTcoE9VPt/WxqlYVjoPdsWVNAn3ky4U2KjZ4GGG4oPNCsb27i9q94Q9MCekn6SfH5cFJEGPGFRuy4aJKJs6fvQs5cR8EUEMvcpjx2dCpkrNuvtbFhNgNGi6h1jbRYMvN4K3UTwVr77yE534XT4mOwGXt7mlg9Ip929j/xPSpRTCmaJYuBRDBZysIaSxyUtVVg1uVxL0F5OibbtBCHZvf7f6loQ6oHKeK2OuLOXSX8QqhfPibi0koyrUrZhM1wUFate5Nff5uRobFUyhH1YYUn4hGjHl7ZkjpB6IXgRoL51l5NNlDz++qJqfWhV8RaaIh+3d9+IwJfQsclgyA5zZxjoLGqUCF31ShF1DumgJ0Q96hjog3hzvz+gg7SrZOytYQUeb7qIMEM2UabochzYw8BgnLdxid+BMJA/FmCgZpheqOzg3vvbdfdW+e8Rh1JxVDbUYqSdKID0pxqNqDnKTvP9DO2ssDHggukRfSE7xc5JtHhgycXFI/ri5fTiB5u0lnD6g2JiyTIty0szmWU4Q
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7689a1-a317-4b3c-7f52-08da7b039a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:07:42.6801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KHqPIBUr1tH864bThWyUhWOlb3EpUut2Ty1Ldys6SjSiDda380ycQlu8RapiEuC7w7afZPVvW60+ZIF3hUWfo3rtEJZW2fBrO8MogIVTI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6106

T24gMTUvMDYvMjAyMiAxMTozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

