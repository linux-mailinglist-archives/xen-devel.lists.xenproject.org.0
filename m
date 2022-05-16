Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3552841C
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 14:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329822.553087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqZko-000402-Ka; Mon, 16 May 2022 12:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329822.553087; Mon, 16 May 2022 12:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqZko-0003wz-GZ; Mon, 16 May 2022 12:23:14 +0000
Received: by outflank-mailman (input) for mailman id 329822;
 Mon, 16 May 2022 12:23:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cUsC=VY=citrix.com=prvs=128b2a1f8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nqZkm-0003wt-TM
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 12:23:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1cf7065-d512-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 14:23:10 +0200 (CEST)
Received: from mail-mw2nam08lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 08:22:46 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 CY4PR03MB2533.namprd03.prod.outlook.com (2603:10b6:903:43::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Mon, 16 May 2022 12:22:45 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::a932:ea60:fb82:12b7]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::a932:ea60:fb82:12b7%7]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 12:22:44 +0000
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
X-Inumbo-ID: f1cf7065-d512-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652703790;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wIAnczFkxUvcdgGB2qZTtqomp2OnmE37nOteaSXjqzQ=;
  b=f/IzkoNmkVDfYHgkDmcDBIDLJfzVS1hKlKgF05pH8UNVjonWASY5rCVT
   EanHPGvHnTZnUeLYa1NdB6qn71kzzxiBiAaDRoH08l+JRnBOTBMTJ+EVj
   4qv+/vHW50ktt3BYQxLjd/HWkWFzyYUCeOn4GGar+VX/qq+McSFy90Lzg
   Y=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 71794054
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UEYSqKDC4o66khVW/1riw5YqxClBgxIJ4kV8jS/XYbTApDwk1GcDy
 mJJUG2BP/aNa2T1Koskb4q+8k5XsZDUmtNlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhe2
 pZP9sHvRzx3Affzo78bXDJFHA1XaPguFL/veRBTsOS15mieLz7J/K8rC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l9B8mcGs0m5vcBtNs0ruJHG/uYQ
 sMdYD5mahnoaBxTIFYHTpk5mY9Eg1GgKmIJ9ArI+cLb5UDJkClg3+bvM+GNa9+WdcNvtECAq
 jrZqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsb5dw21pjiDpBF0ZjZLO+gz6QXIz7WO5Q+cXjgAVmQYN4Vgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo0yeEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:kohQ2qhCBMTZnMH6NDyRRDLWbXBQX3h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin+90a1wbx7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEXQI5tlluZEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.91,229,1647316800"; 
   d="scan'208";a="71794054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlbBPoH3vgymmT/cdeUmshMZ7PS/bkOu00vt4AeJ+hgkvxFJOi2WtYSWikunOf7bs24HZ4LicHlyigaGc2euJIHeBVhbVdYDTXqSMtyVEso0HN36BrX2hyvqK96h0CJlb5u5pAaH4rLKKgUWA7Rt1qEVYP+AejYX86eBOEqcgnE96vA6qghI2Ds8sl7d4fnapZCF4TW6uqeRe72HzZ3N9UR1v6L49G43CSu78UyX0k4IPtSTwwSoFlItKciJbTvZPilT0cDyF+rbVA9lzu3IxevtHdU4ASKfAo7+YUHDhcUE0j8YohIw0c89bCefn5ZeT9d8nd3iZnAIc0Nh/apfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIAnczFkxUvcdgGB2qZTtqomp2OnmE37nOteaSXjqzQ=;
 b=OgTpYseozli+ZFkFz5g9ZBn28L3aH2x1fDtWYsIkJ1YlJHICyqR5qGUpnVKIDhPWh7MBPxhTd+zdpVD3JYOahmZCzfJzOlj9Db4UxBFLP2zWsrLeQ6FdMCNVAPo5x717bITD6zRAPPtmX0Sf96N1EYYmqt8iWcg55HGVjfYGW3JgpTlrhlmdfuhENXcesKJMPZNg4sdZ5i7CiXGcLotH2ZHHcyX35Dm85p96jUBs4MuRwHFvfrRZdIIqfN47P6luBMN4FveA7pVPLzfl2U6WQa5CLCV763a920nABag7KYFhEzdANKee6IUNuSCeyxm3ppFDEAGCDFtgibev91rzQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIAnczFkxUvcdgGB2qZTtqomp2OnmE37nOteaSXjqzQ=;
 b=e15KQ2wtoO8XGzJtmQt3II3+6ZvzV3A58K5erNYcTiXOVPEuM4tUqOmmDACqF5d4pxUghtzaPv5KskWbWh13qvhGRQOekcPgg6UtILfNjZLyisG13BA6QA4uDUBgwArbUVMXzp4gCgrtBrJjy5LLq58wrDOmIf5ugV0J86v24iQ=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Thread-Topic: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Thread-Index: AQHYZUnyc7oF7QLoj0+gbrrX4WFU9K0c9NIAgAR/4IA=
Date: Mon, 16 May 2022 12:22:44 +0000
Message-ID: <d19b0370-3818-7cba-6bd2-18bdebf421aa@citrix.com>
References: <20220511151423.20241-1-jane.malalane@citrix.com>
 <Yn57zsIVGfM8s4Ld@Air-de-Roger>
In-Reply-To: <Yn57zsIVGfM8s4Ld@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bee6229f-a7c9-4c59-b8a1-08da3736c7f4
x-ms-traffictypediagnostic: CY4PR03MB2533:EE_
x-microsoft-antispam-prvs:
 <CY4PR03MB2533544464D0F6226B2D135F81CF9@CY4PR03MB2533.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6iigZyJ54ntNrWt/0d+w1ZDhZFlrdzQlEOQiVpKdKixzZlEDsBcEHtZ9aj8aNIKEv+M3gaqP8xVzIqBMwfqosqqz9f5ahiUoVn1tZMN+d6XI7lM+0TN4b8lXbW4Fa91IP7YaH8t0Te686NQAdEQYozPGs6d4WxxuDuzLrRKSzoJULbtqRH6njV20QPL0EySSRM49pnutIcVmBfg7+E2DJXCy3jEazCkFXWRCoF/a25+OOy10GHxgmeTgw/o08wfri9r1LmuwVEMcfz0MrK3g2EPu5fl+icb4KgqGFhHrYO0RpiAmaha3zMGaIZOPTVur5TJsggx0ia0jb8E426FUzxkMqwkc1FlFLKCUL65GP3Sv3EHarbCQQrdPUcOg2E5Pbuf1Z3qGoyR2XBHZzqhR8kN9Br6ZV8p8xyCW+GZAnu21KS8UAivtioIEv17qDvdADEwWognwLm3xCLYTriY7xfMTYaCdh44E2Oh8VxAo8g1DAhCdX/cD/dGV/6Kb7iGek0bAxmuScFwVpTPsx7imuszHGJbN+LZfO+K837vP8gtwTQuR1vIveCfqFmFJNbTSDBKCFadNcxo4DAQDAQqHNpfGz1Jb66HKzCZOe0377jFaZmGs2hdBKx0Vc/+4pyXqOpXFVrLy+QpS77kQIFYcYnaF3M4yvSuFo0KaUaCfqJdczXUvhh5t/+ua/zoa72MPvFJ6dcpkghQwwGULYhIWQVbtDjvlO0PtQCEsQbRlSkmXj2R2HALbYM3IHV/1wXPt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(91956017)(2616005)(316002)(82960400001)(6636002)(55236004)(2906002)(38100700002)(31686004)(66946007)(76116006)(8676002)(4326008)(6862004)(66556008)(66446008)(37006003)(64756008)(6486002)(83380400001)(186003)(54906003)(122000001)(66476007)(6512007)(86362001)(5660300002)(38070700005)(8936002)(31696002)(26005)(508600001)(36756003)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amdOWEhyYmlLbDdRV0xTeFBzblBhdDVmblU1RVdYWU5JVkRPZVBUY3VqNGhJ?=
 =?utf-8?B?Umc5Ui9aVWNIeTFpMEV1TDhVZVZ2RVVnV0taWlBCeEhKTlFyS3lFL2EyTjVu?=
 =?utf-8?B?MkhkeGlON1g5aTNhVFBXRXhGdlNuTVRHaEw0TjNaK01TRk5ZRmlMZUhTTzN6?=
 =?utf-8?B?cDZVdFNYeDNBT0E3Rkt4QlJjYkxHZ2E2dzQvaUdVM0RrLzRnS0RVNGxEcytX?=
 =?utf-8?B?TFNzZXZUZlZVZWcwQnZlYmhXalltZ1UwWHBhMURoeDd4eUZrV2l4bGhvNWxG?=
 =?utf-8?B?WTdTR3BlNzdsUVBQdmkxalE3REU3ZkRheG0xNENDZU5ZNGQrMTBacGNieXhI?=
 =?utf-8?B?STM3K1VyWEVadG4rMUc4Unl3MzNGcXJWUFdDbVd0ZlFKdGg1aWZpa1VZUXg2?=
 =?utf-8?B?MFJWR2RJemE3TnN4WC9tMU1iR29XK0VpRm9WcWJrdFMzMU1Vb0crNTYxRE5L?=
 =?utf-8?B?MFBLYU5LV2NzR0ZWbk5BV0Q3OWQ0ZVlmVmNRaE1rVzlhUVRoMU1lbEF6RGpT?=
 =?utf-8?B?aGhYWnJFYWNLLytJUlIxUjB4TjNWRThKNEJaSG55LzVQSUsvaEJmb2RHZGU2?=
 =?utf-8?B?djl0elFPTWpNRnBtZU0yQ3U4QlZ0KzhnVlVZNnpkaXorN2RFVkI3OWJBemRS?=
 =?utf-8?B?OXA0YVJxaUdxZlBYUmxiUHJhR1E3ZmhRYXIzNHhEakVtRFYxdnNEVmZzSkhV?=
 =?utf-8?B?OG9IZ0J4d3VVckMzSlJibzNVOUxCWGkreGQvOUZJdFVId3VUWWx6cjFoN2tU?=
 =?utf-8?B?YVJxNSs3bEhOcUZwNFo0SXpsU0g2cmNyeldzYUVXUjMvWkI1RHZHcmJFeGxw?=
 =?utf-8?B?UHhWYlZmVHFoM29heXJwVU9PSGE5K1JvRThiVDM5cTkyVmFpeHNxTnRhbU5R?=
 =?utf-8?B?Vmk2amRXdXFzSkNDaGRkbnp6QlJiQkdYcFhqTVByTDdvWlZNMzFNaXZBNkJa?=
 =?utf-8?B?ZlFKTWpCN1Y0WkE2K09RM2hEc1dFdUN0N3BKZ3pEVEhRSzNKSU55ZGlRdW1s?=
 =?utf-8?B?VXFwaklWd252Nm9SWXJNVStyWHpmT3dBK1g0d3RtamNaZlZCRklaRGUxTUM1?=
 =?utf-8?B?RXFiMkFMYXdhKy9ucnU2TjNRUEg5YnpYU0RWekc1WitxeHUyZTBGNkIreStE?=
 =?utf-8?B?RzZvL1pkVmg4dVkwZFhPdUhCOS9PSFBDY015MWxBTlZiSXZ2MmNoQXhZVUF4?=
 =?utf-8?B?MVUrMGhTSGpQbUtPSVpzVi9NK2JtMlFFWnpQN0FoU2JoQmxiOWFqUjFDbENU?=
 =?utf-8?B?aWUrVGlaWFhWakdCS045R2VYTytJM2tYa1JIZ1NkZWlqNGNnRTR0akErNmdu?=
 =?utf-8?B?czNnazVwN2tndkUxenVCakNjb0hPOXZVdmhUdzdiSUJuNHIzTXBYbEF3dFEy?=
 =?utf-8?B?NCtjdkNjaEpWa3FObjFEMDAwRXNhZkdmOEFwWWdGRVJoMXFDTXVodEh2KzRE?=
 =?utf-8?B?TjVxMnN6VitIZm5hWHVzUEp0b0tjZ1V1N2J1MXJMNkN2RXpPQ05OVUpGYlZS?=
 =?utf-8?B?b1EvOXd2cVJ2RzExUDYwZUVqbSs4cmZhMENaTjZrNXk4WWhxNWNQUldzNysw?=
 =?utf-8?B?dVIzRFJ6TVFKN1l4MFp3KytrRUpiK0c5bklpaVIrY3NDbC8vZ241Umlmdity?=
 =?utf-8?B?by9DdFN1K0x0OE9ZMDJaSVAyVWI5NE1pcU4zSUY4N3UyR2o2ck8rbkNKQXlV?=
 =?utf-8?B?eTBiTmdYVDU5YmdIQWIzTWhYazJiN3BSOEhUL0pNd2NuYmQyMkg3cmd5akxv?=
 =?utf-8?B?WEZMcVB6ZnNnc1VjbHM5UWorRnJQTmRHVGJaclcycFlhV2JENWVHRWU3c3hu?=
 =?utf-8?B?ZEdLdkFGUWVvd3FUTVBMaFI0T3AvS0FXdWF4YmZUVGl4bjZmZ2xkNER6alhC?=
 =?utf-8?B?R0xMVE1EZTVjS3c4SjRGakZKc042b0F3dzlxbTgxa3RsYmozZW1xQmMrZzc5?=
 =?utf-8?B?N2VsWVB5SjJDZS8wZUxFRUlnWkZBbEtmNnEyYVlRY2Q4b0dINFZESUQxZ21P?=
 =?utf-8?B?OUg5YU9KMmw5OGNnZjRlTlNHM2F3ZXBQQ1NPYVY2ckxSQzcvVTQ2R1R2YWR2?=
 =?utf-8?B?VHJLekkzRzFwNFB3S1E0aDYyU3BqemZqVnpzZFdDUW1zc2Jna2xhdW9SaDVU?=
 =?utf-8?B?WFExbGYwajZETjRYRVNuanN4ZldUSEkwYWlTTVN1UjBScUpIZUZpTndFdEJ4?=
 =?utf-8?B?TUczM3I5dXZJVXppWjR4K2o2M3RtYnZtMmxLV0oyaTV4S0JrLzBsbnFLSElZ?=
 =?utf-8?B?Ujd4YkhqSUhqa3hiOGMwZkg5WWdvNzhWQnNFSkF1cTZSNDlYNG5zVG5RbGtE?=
 =?utf-8?B?eHVySG0waEZCSGFvK3dLNXkvMlRJbXRISWtHSFJKdWwyS1pSTGZkQi9lVVVs?=
 =?utf-8?Q?OMonyP9fdU6i9c68=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F21009156BAB24697E1FE35D642389B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee6229f-a7c9-4c59-b8a1-08da3736c7f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 12:22:44.8655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yo62I7eL3pTWkfeS6/p5qY201+ASUYaHHHD2sGWmydBif9+y2LECMmLHnHtsHHDgsBfzhk3DmGJHdFRlgyf9dmw5SY7XEWuxGc7oAxgNfzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2533

T24gMTMvMDUvMjAyMiAxNjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBN
YXkgMTEsIDIwMjIgYXQgMDQ6MTQ6MjNQTSArMDEwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IEhhdmUgaXNfaHZtX3B2X2V2dGNobl92Y3B1KCkgcmV0dXJuIHRydWUgZm9yIHZlY3RvciBjYWxs
YmFja3MgZm9yDQo+PiBldnRjaG4gZGVsaXZlcnkgc2V0IHVwIG9uIGEgcGVyLXZDUFUgYmFzaXMg
dmlhDQo+PiBIVk1PUF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IuDQo+Pg0KPj4gaXNfaHZtX3B2
X2V2dGNobl92Y3B1KCkgcmV0dXJuaW5nIHRydWUgaXMgYSBjb25kaXRpb24gZm9yIHNldHRpbmcg
dXANCj4+IHBoeXNpY2FsIElSUSB0byBldmVudCBjaGFubmVsIG1hcHBpbmdzLg0KPiANCj4gSSB3
b3VsZCBhZGQgc29tZXRoaW5nIGxpa2U6DQo+IA0KPiBUaGUgbmFtaW5nIG9mIHRoZSBDUFVJRCBi
aXQgaXMgYSBiaXQgZ2VuZXJpYyBhYm91dCB1cGNhbGwgc3VwcG9ydA0KPiBiZWluZyBhdmFpbGFi
bGUuICBUaGF0J3MgZG9uZSBzbyB0aGF0IHRoZSBkZWZpbmUgbmFtZSBkb2Vzbid0IGdldA0KPiBv
dmVybHkgbG9uZyBsaWtlIFhFTl9IVk1fQ1BVSURfVVBDQUxMX1ZFQ1RPUl9TVVBQT1JUU19QSVJR
IG9yIHNvbWUNCj4gc3VjaC4NCj4gDQo+IEd1ZXN0cyB0aGF0IGRvbid0IGNhcmUgYWJvdXQgcGh5
c2ljYWwgaW50ZXJydXB0cyByb3V0ZWQgb3ZlciBldmVudA0KPiBjaGFubmVscyBjYW4ganVzdCB0
ZXN0IGZvciB0aGUgYXZhaWxhYmlsaXR5IG9mIHRoZSBoeXBlcmNhbGwgZGlyZWN0bHkNCj4gKEhW
TU9QX3NldF9ldnRjaG5fdXBjYWxsX3ZlY3Rvcikgd2l0aG91dCBjaGVja2luZyB0aGUgQ1BVSUQg
Yml0Lg0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFs
YW5lQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+DQo+PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cj4+IENDOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4gQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2RvbWFpbi5oICAgfCA4ICsrKysrKystDQo+PiAgIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAg
ICAgICAgICAgICAgIHwgMyArKysNCj4+ICAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2Nw
dWlkLmggfCAyICsrDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20v
ZG9tYWluLmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+IGluZGV4IDM1
ODk4ZDcyNWYuLmYwNDRlMGE0OTIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVk
ZS9hc20vZG9tYWluLmgNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kb21haW4u
aA0KPj4gQEAgLTE0LDggKzE0LDE0IEBADQo+PiAgIA0KPj4gICAjZGVmaW5lIGhhc18zMmJpdF9z
aGluZm8oZCkgICAgKChkKS0+YXJjaC5oYXNfMzJiaXRfc2hpbmZvKQ0KPj4gICANCj4+ICsvKg0K
Pj4gKyAqIFNldCB0byB0cnVlIGlmIGVpdGhlciB0aGUgZ2xvYmFsIHZlY3Rvci10eXBlIGNhbGxi
YWNrIG9yIHBlci12Q1BVDQo+PiArICogTEFQSUMgdmVjdG9ycyBhcmUgdXNlZC4gQXNzdW1lIGFs
bCB2Q1BVcyB3aWxsIHVzZQ0KPiANCj4gSSB0aGluayB5b3Ugc2hvdWxkIHJlbW92ZSBMQVBJQyBo
ZXJlLiAgVGhlcmUncyBubyBzdWNoIHRoaW5nIGFzICdMQVBJQw0KPiB2ZWN0b3JzJywgaXQncyBq
dXN0IHRoYXQgdGhlIG9sZCBtZWNoYW5pc20gd2FzIGJ5cGFzc2luZyB0aGUgbGFwaWMNCj4gRU9J
Lg0KPiANCj4+ICsgKiBIVk1PUF9zZXRfZXZ0Y2huX3VwY2FsbF92ZWN0b3IgYXMgbG9uZyBhcyB0
aGUgaW5pdGlhbCB2Q1BVIGRvZXMuDQo+PiArICovDQo+PiAgICNkZWZpbmUgaXNfaHZtX3B2X2V2
dGNobl9kb21haW4oZCkgKGlzX2h2bV9kb21haW4oZCkgJiYgXA0KPj4gLSAgICAgICAgKGQpLT5h
cmNoLmh2bS5pcnEtPmNhbGxiYWNrX3ZpYV90eXBlID09IEhWTUlSUV9jYWxsYmFja192ZWN0b3Ip
DQo+PiArICAgICAgICAoKGQpLT5hcmNoLmh2bS5pcnEtPmNhbGxiYWNrX3ZpYV90eXBlID09IEhW
TUlSUV9jYWxsYmFja192ZWN0b3IgfHwgXA0KPj4gKyAgICAgICAgIChkKS0+dmNwdVswXS0+YXJj
aC5odm0uZXZ0Y2huX3VwY2FsbF92ZWN0b3IpKQ0KPj4gICAjZGVmaW5lIGlzX2h2bV9wdl9ldnRj
aG5fdmNwdSh2KSAoaXNfaHZtX3B2X2V2dGNobl9kb21haW4odi0+ZG9tYWluKSkNCj4+ICAgI2Rl
ZmluZSBpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAoKHZvaWQpKGQpLCAwKQ0KPj4gICANCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5j
DQo+PiBpbmRleCAyNWJmZmU0N2Q3Li4yYzUxZmFhYjJjIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jDQo+PiBAQCAtMTE1
Miw2ICsxMTUyLDkgQEAgdm9pZCBjcHVpZF9oeXBlcnZpc29yX2xlYXZlcyhjb25zdCBzdHJ1Y3Qg
dmNwdSAqdiwgdWludDMyX3QgbGVhZiwNCj4+ICAgICAgICAgICByZXMtPmEgfD0gWEVOX0hWTV9D
UFVJRF9ET01JRF9QUkVTRU5UOw0KPj4gICAgICAgICAgIHJlcy0+YyA9IGQtPmRvbWFpbl9pZDsN
Cj4+ICAgDQo+PiArICAgICAgICAvKiBQZXItdkNQVSBldmVudCBjaGFubmVsIHVwY2FsbHMgYXJl
IGltcGxlbWVudGVkLiAqLw0KPiANCj4gLi4uIGFyZSBpbXBsZW1lbnRlZCBhbmQgd29yayBjb3Jy
ZWN0bHkgd2l0aCBQSVJRcyByb3V0ZWQgb3ZlciBldmVudA0KPiBjaGFubmVscy4NCj4gDQo+PiAr
ICAgICAgICByZXMtPmEgfD0gWEVOX0hWTV9DUFVJRF9VUENBTExfVkVDVE9SOw0KPj4gKw0KPj4g
ICAgICAgICAgIGJyZWFrOw0KPj4gICANCj4+ICAgICAgIGNhc2UgNTogLyogUFYtc3BlY2lmaWMg
cGFyYW1ldGVycyAqLw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4
Ni9jcHVpZC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWlkLmgNCj4+IGluZGV4
IGYyYjJiMzYzMmMuLjE3NjBlMmM0MDUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC14ODYvY3B1aWQuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2
L2NwdWlkLmgNCj4+IEBAIC0xMDksNiArMTA5LDggQEANCj4+ICAgICogZmllbGQgZnJvbSA4IHRv
IDE1IGJpdHMsIGFsbG93aW5nIHRvIHRhcmdldCBBUElDIElEcyB1cCAzMjc2OC4NCj4+ICAgICov
DQo+PiAgICNkZWZpbmUgWEVOX0hWTV9DUFVJRF9FWFRfREVTVF9JRCAgICAgICgxdSA8PCA1KQ0K
Pj4gKy8qIFBlci12Q1BVIGV2ZW50IGNoYW5uZWwgdXBjYWxscy4gKi8NCj4gDQo+IEkgd291bGQg
bWF5YmUgZXhwYW5kIHRoZSBtZXNzYWdlIHRvOg0KPiANCj4gIlBlci12Q1BVIGV2ZW50IGNoYW5u
ZWwgdXBjYWxscyB3b3JrIGNvcnJlY3RseSB3aXRoIHBoeXNpY2FsIElSUXMgYm91bmQNCj4gdG8g
ZXZlbnQgY2hhbm5lbHMuIg0KDQpUaGFua3MuIFllcywgaWYgb3RoZXJzIGFncmVlIHRoYXQgdGhl
IENQVUlEIGJpdCBjYW4gc3RpbGwgdGFrZSB0aGlzIG5hbWUgDQppZiBiZXR0ZXIgZXhwbGFpbmVk
LCBkZXNwaXRlIGl0IGJlaW5nLCBhcyB5b3Ugc2F5LCBxdWl0ZSBnZW5lcmljLCBJIHdpbGwgDQph
ZGQgdGhlc2UgY29tbWVudHMgaW4gYSB2Mi4NCg0KVGhhbmtzLA0KDQpKYW5lLg==

