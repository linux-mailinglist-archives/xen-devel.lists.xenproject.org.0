Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C262C59B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 17:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444361.699480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovLiW-0002bT-6i; Wed, 16 Nov 2022 16:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444361.699480; Wed, 16 Nov 2022 16:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovLiW-0002Yl-3O; Wed, 16 Nov 2022 16:56:52 +0000
Received: by outflank-mailman (input) for mailman id 444361;
 Wed, 16 Nov 2022 16:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovLiU-0002Yf-85
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 16:56:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a781e36f-65cf-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 17:56:48 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 11:56:44 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SA2PR03MB5882.namprd03.prod.outlook.com (2603:10b6:806:118::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 16:56:41 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 16:56:41 +0000
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
X-Inumbo-ID: a781e36f-65cf-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668617808;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JdrdXiH1ABEZhHd7nlJNLMPNFakmbMyUruAfXnFfDlY=;
  b=HY9X1Olo911FOMqGwp67Ww0gXMPuKTQHamVbiJXTAVikFzLof/K7K9qN
   AHh/K0m0TVOVxx4ow2mkxdQOYDSpARa19kY9CcjwP0SIUmtdqrcKsRey5
   6cdF+bwcAT94JBd6Bpk8SkoqADE+YTCUe6TEKc9x/uPzyqhv4zH5SbZrO
   8=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 85383849
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JMwIZKsT9sPOcuE0Q0WOVA6G8ufnVHRfMUV32f8akzHdYApBsoF/q
 tZmKWqPb/fZYWb2KdsgYNy28kJU656An9FkS1M5+H08F3wU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKHMSNE6onPKK6YmmEfNGv54yNJPOFdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIq9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPO3lra4x0AHCroAVIAwbd0XrpdSEtnKVR4gcK
 X4PpnoynadnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+8sjeaKSUTa2gYakc5oRAt5tDipMQ2kUjJR9M6SKqt1IStSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:RilM8ay2DX/4/v/sGw84KrPxBOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MJ40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH5AJlO+1GkUKp
 goMCju3ocRTbpcVQGBgoBb+q3pYp30JGbffqFNgL3P79EcpgEF86JR/r1iop5HzuN8d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqYndydvaD6Dg9qFC7q
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXDoxttF75Z0t7XgTP6zWBfzA2wGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIkeu8o9WViJvsXXQ7ea/tDzYbLWPv7gADwkUmTwDj
 8KWyXyPtxJ6gSxVnrxkHHqKgfQk4zEjOdN+YThjpsuIdI2R/xxWyAu+CSEz9DOLyFeuaore0
 Y7KK/7k8qA1BuLwVo=
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="85383849"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKpx6zG9f1FsLEbjTDhc5FmxSCec03qMek85z1vcqvhoiwdS2pzVrlIEWEAHrYrwZDeSo8KP/qp5l2sb3QFXY+qWBjFhj1Nb7jSdIHtLMWrc+39W7QnVCQjT6ZIQv1O3mjc7fxtqcvZokjMVchBIzXm68topbAd8nsDkTG/rU9eMNjp3Vcq1ZDabqntccRrayolV6havVOe/c+v2UHlol3JWe+3YMyKwdAaUShRF2ynaBX94lchr0blcM3fFp12e+8tBGFaf8UsD0OvGC7M+4718f0WHX5tuLwb37HVNyDekW2e6mCJshXF5ILmF6I1hnmV080EyLZoRan8RtTiTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdrdXiH1ABEZhHd7nlJNLMPNFakmbMyUruAfXnFfDlY=;
 b=N1h8em5vAIZTSFSShKwWg0uxPYdP14ADiZsYUqT1yJHLUWKZWfBq49yGljQUL9X8en75Hga3scDv4v7PFHJdogxRuW4wxAG6Zb5iFJaTf//n0hGSIh6dtFykXjRSmTcV7NT9FL9CTBEAlyEB5DTcOhAHlx94TpfLBj4fQNiRxg4cqYVs3UzurgAn5dkUvUfkQ878ff06+FGIXL777HdjJdcfTQR4gdlaWdqc0uisCz5DUYgsgYN9miKp0s3zcKzziXK0xss7Lzm+1DZJY7C4EABu+C5gpHNxoAf+27PYD/4WJJLyn6mZYa94Dik6bj7mMS+Ng+7r4STVo9Rn5Db9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdrdXiH1ABEZhHd7nlJNLMPNFakmbMyUruAfXnFfDlY=;
 b=Mk7+t5N0z/z/o5DBnGdzKkKwFhFixRq4hoHtP6UrLmu/OYvfVis8ajkFLVJnva/8JiHAMkpwzyObJo50r42aKcsXnzk6qmYR883KfshlZGvrUOn/KETqQs396sL4hZu7/EIWsqQaKIldxl2Hgt2Fu91U42+orL3SAI2bZmqMdIU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures to
 dom0
Thread-Topic: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures
 to dom0
Thread-Index: AQHY+dppI/YDqtuG9Eua4T+BrggU9K5BxRYA
Date: Wed, 16 Nov 2022 16:56:41 +0000
Message-ID: <e1ba1a77-e449-beb0-cd49-1e6df6b6eeb0@citrix.com>
References: <20221116164216.7220-1-roger.pau@citrix.com>
In-Reply-To: <20221116164216.7220-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SA2PR03MB5882:EE_
x-ms-office365-filtering-correlation-id: e0164719-7ee0-410b-5f9c-08dac7f388c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Kt17SaLRg/1y2zZM1WfBozWjCxcUnny8A2SIWubXbWcI226efnOOuR/Aj93P7FMb8IG3vy0F3WfNY4+MlMKvj8SyEbdRcaZpBqi3dBkT06w88GgObwN9bljQiThwtv3y0kt6gezKjr5Qz9RJyQrwzveC48AVJSpP9gO6z+ptSRakzvQGXVuD0I23iGMWXt4G/c77nsmnwW0enhtSQZJHArmk0mvua801fTMfr5Xj01hqh5svJJrfeWogb0hMVaV3CoL9acypFy5AxbcGvVYfoGpbi0waPnan7zBx32yjuNbqCCXxUMXMHa32SQhUlNUDMQOuGIMwYtC1AVBNveTGNjHyw2W5XKdxOzwG1G1oOuoieyGedVNPLXOcYzO7TEQQNrJcAhTpHh7B7Xix2bkDkKYT8d+wuF+SEwhEnWfGKzwEtJt4rRxUPAXM+QKshSp4KhhrhQhigQXShnfcauy57NCfdgNGpbOyVDDVFE+htdjvcNCsWZXuSF87l4zBsV6GZ3neRIIdOhPqua5X8JruBEz9e9Hh86lmxdG+z3dYv1/7MmTmSC9A/wDSH4ju6bFcVcXYK8rY0Rz/Gr7RFmruUIegPUE2JML+5kc22FbmT2QW5W53sbNt3HGmhhUUS9kGcvAtp0DH1Ou3qr+70gBAQgwX4weZIBIcjKBSPru6uzEM4EQgDIaWx7hhqT33MDdAKHCW0t/ZUMWqd0Q+qS9dq5CFAL18I3inWrVqUmqdaPquPSxbgqnxCGUPue0j9wyjDn8VVZ7BdYMtaTzQHLjAXIR1830dSo/t6l3emZN5Do2KO8JbI7Fzkc9OQ82uao8lg+rHVDU4A1q1FeO6fVrNIg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(6506007)(186003)(26005)(6512007)(36756003)(71200400001)(86362001)(2616005)(41300700001)(66946007)(66556008)(4326008)(91956017)(66446008)(66476007)(64756008)(53546011)(8676002)(83380400001)(6486002)(31696002)(110136005)(316002)(478600001)(54906003)(82960400001)(38100700002)(31686004)(2906002)(38070700005)(76116006)(5660300002)(122000001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFhrQ21iRTdKRmdKRW1LR2NZREVaVDBHaFFNa2toK3pjV2UrMnhOdG00RkEz?=
 =?utf-8?B?Tmg3RzNUSHRiakt0UDNYMHk3THFJWkxDQlBRakU4K01qL0RmY3NrdUE5anl4?=
 =?utf-8?B?b3dYOGorZHdjVWxTZWhBcm9zSUZ4QW1zNGExWHlXQUM1K2diTmdBS3hVRUtz?=
 =?utf-8?B?K3RyOW1UK2pxYS9NeXoyaW8xOEErdzUxSzkycDAvM2pwNUcyelJWdnpKL0ZC?=
 =?utf-8?B?ckNXWUF6R3VOWEYwaVRkVXloMzcreFY5RXA1L3M0ME1EcXJ1YXA2N1N0Mmk3?=
 =?utf-8?B?dDVMQnR4WXczTnlIay9aQU9QRW9WeUdHWmNXcGw2WC95em9rWFR0dWZQOGdt?=
 =?utf-8?B?K0RtU3R0K29tSjNvQzBEdzdTYmxUTnJHdmNmT3NUTXd1VE5QdjlvTFBqWWdL?=
 =?utf-8?B?NFZjZ1lkTE5XZHNrREtrUW9EYU02QzQ5a0RGQmN3U0RBaUFSR0pod1o4ZmhY?=
 =?utf-8?B?eHIzR294YTE1K2hQbmlDS3dJTGRJTFZRWDNJSEp6cW1iL0Q1QTlIRGZWMXl2?=
 =?utf-8?B?eGpEYlk2dnlxalZyQ0VaV01rdXdtQ2s5emF6V2ttcXR2MDBWOVVMcHdiN0VF?=
 =?utf-8?B?dTVsendGVGFDVk9xMjVvNFdkSmtBa2tmVEY1dmpGZ0o5UjE2aEg3eVVPT2ZO?=
 =?utf-8?B?YWd1VFF4c3ZldlYyZzVndHhxMFl4bEVHZmJ2SU9rZWJFUmRtZE0wS0o1Nlg4?=
 =?utf-8?B?VldnK2FzU0JrWmVKdHpKdU5WN1pkRzcxc3BsdVdocHhsbjB0bklhUlJ0ZUM0?=
 =?utf-8?B?U3gxRTk2UDJZa0RWMVYzQjdUUVIwczhNbmc4WlF2RzNyRGl2UGoyNDMwdTZL?=
 =?utf-8?B?czZ0QStKM1U5NXZtb2p4NVByTEZuZE9pbWh0ckQrRUtkRm9ZMzFRa0xKT01k?=
 =?utf-8?B?d0g0SjNrd3pGN1M0Z3J3ZnNzRTlaQzhyR1Bub3RiSXBpZDhQN1ZaUWZRa3Na?=
 =?utf-8?B?cXNVVWJUcG8wSEt3dTh6b3VwMGJYYUxwZFFjcUM1OEJDVUJ0N3FOWFV1NGJY?=
 =?utf-8?B?QjBoZmVXRDVQWU13QlhjWnBZNlJxUWxqTytmTUtBQ0h4YlBXNnc4S2E2cXZG?=
 =?utf-8?B?S1Q5UkdQK0FzbXgxbE9YTFNTWXVoWnhMZ0xEY2p2dFFVUEFXQUYvdUFwaFBC?=
 =?utf-8?B?eHlmZkRmTnlVU0lDa2gwNmpiUFY0UnBLc0xjNG40WVdzMDhSTUs4cUZoWWQ3?=
 =?utf-8?B?Yy91NExiRXFGOW5BSUROZTg0d2FVcERBOHFya1FOWU8vN1RKZHhpYkdxeXc3?=
 =?utf-8?B?VXZwY1oxSHJwOWozcGV4QXZocjJmYWpiMXNVeGh0TWFRT0t6VmJNc0dzSXBQ?=
 =?utf-8?B?elkwK0FiQTBScmJKWk9HT25yUzdaMERUOVlFNDY0ZnJiTGl4R3RjbGtZT2Jy?=
 =?utf-8?B?d3RaRExYRE55R28vekk0VHZyRUpNUGlNOUkwamxtRHExaC80c2I2bW1RMUVx?=
 =?utf-8?B?RUV2Rkpmbk9NTTlCRHZaUlFDYnc1RFc0YStYM0VXc3p6Uy8yZ3BRNURGbU5H?=
 =?utf-8?B?Rk1jSDFvdWl0QzR4akRhU2pxNENGNEtUY0J6dk5KT0wwNFhqaDVQcDh4M2k2?=
 =?utf-8?B?SmV0UnZMb1VwSzRvS3dWTVhtSWNyZ3RTQ01WSmZ0OVdhMEJ2UVJPTHRQWnNU?=
 =?utf-8?B?K1hqSm90M2k3bWRXSEY1Snl3QkZSMWN4Rk9uL1p2aFF0QnE0Z2xhRmN0UGtt?=
 =?utf-8?B?UjRYUFpTMUxGeVRwVkh0RjJWbVFaVlVuV0tYaHBaWjJ6a1RCcGRCQnR6aW8r?=
 =?utf-8?B?Qm9DY3I1Q1BhejNxR2N2UXlQVUloSmROWkhTOTJSWGhXbGxwUGRLWHQ1RGZH?=
 =?utf-8?B?MFpjOUZuY2V6VlVDcFVWRzdxYnFiMmRoYlBRSWo4eU9jcUVoaGNDNXpUY1Ft?=
 =?utf-8?B?UEZTZzQwa29zZHdWTDJXS1pWQnI5cE1Pd0dSWDBQOG9CeUxJWWhoUWpiSHlq?=
 =?utf-8?B?RUxiQTY4bmJNUVA3anpnSEk0VHZKWU5CT2hzMUduckdncHhrNXI5bzdsSkhw?=
 =?utf-8?B?S3VMSHBlN3hsYzJvRy9PVmN2OW5ZV0RpSll2STRXM0NaT2xxUDQ3cmc3NlFQ?=
 =?utf-8?B?K0VWUEEwWEtkYUJCUDUvN0pVdU5Db0hNSi8xQlNKY294b3NnbEhBRFQxd3Rp?=
 =?utf-8?Q?7YuYiAVpMdyhJHDnNwT3Ijwew?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D50B08B7DCB5804A88245B5912A6433B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/kg+tNb5zyivXyoF9sajohgSJzdxUVvy7eJHOq6TV/Hs4xQxe/LACHPtlb/M0i6Lzg7eQxB0Z3qDLfN3kUAUYcbXVIr/ieX2vK39DRSj4UA6FfCkKwRgVmxzjpyR+seZ3avWtARStX+dEy19QH+e2/Xc5zb8Vub8DewMQZG/SZdqBOB4uo6hKiNSMnb16MM0tcUj/hEW4g52iUVshzfFXDAg1w9l/oLfSWucXiW3mtk96rF7Ms7TF5/jxJlOxCpHxQcLWguoCC5/4+Dr+jgQCc4t1whser1nSK6ao8vnDxEr/TOUrOGEvAVwW9wvpYlHLhtmY2cWidRafPpZTfb5lf0BDNzqIfrCypvGQ4Pff2avipPfmP/6WIUZbihm9ByddoKKNdgn9oZ3Jsu2h5cdY3sZ9ghO/Avw/vQCqI4T9GCg5zppkGZfGpdmAhTd32RJUH6ZCzkprOoPuPZSrmcQnLGY0Vl+nJI5/1pBlBhByb+tifKBtk7DCi7Xs6NfIUcmxwvXMntwauhG9XHGqoJKf9jVTbDO2S3entQmmrbqPGoB2aDqA9LiguUlRqzgYQqkzD/CcXrFGOlgkbqRm8e7ZfNEZTVqfBIGWpaGV/LyFEETTrnQz2w/Lb6r+Tczb4S4ycyftvU/eWSHwjhxZDU4MhktnmfV5dBZtQ8hcLhXYkGlka6wdp5XghD/kWqf1OtXhCf29qzApv0Zjd2rEB+gs4pu5LMyyFm3ysX3Y+EuGQPpyDH6MfKFOPlK0s/M+cAoMd5egoD51sbLPIzIqWROipZhWEr+IrZSxk28/wN7IeuZft5YPGR1l/y2mPiVbcLw6h8DoSMAIDqgdSf4SgMK5w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0164719-7ee0-410b-5f9c-08dac7f388c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 16:56:41.1166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDU7dUH8wa3ieGQOVt8V7I4kIWRsFKFRPwA0IUk4n9Ed4HJsNrR5CYu9o0gTmfzJ3mE6ak9Kxag6c9JiXCgQjPe5tibihDbjIFgf0fAKfAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5882

T24gMTYvMTEvMjAyMiAxNjo0MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDdXJyZW50bHkg
WGVuIHdpbGwgcGFzc3Rocm91Z2ggYW55IExvY2FsIEFQSUMgTk1JIFN0cnVjdHVyZSBmb3VuZCBp
bg0KPiB0aGUgbmF0aXZlIEFDUEkgTUFEVCB0YWJsZSB0byBhIFBWSCBkb20wLiAgVGhpcyBpcyB3
cm9uZyBiZWNhdXNlIFBWSA0KPiBkb2Vzbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBwaHlzaWNhbCBs
b2NhbCBBUElDLCBhbmQgaW5zdGVhZCBnZXRzIGFuDQo+IGVtdWxhdGVkIGxvY2FsIEFQSUMgYnkg
WGVuLCB0aGF0IGRvZXNuJ3QgaGF2ZSB0aGUgTElOVDAgb3IgTElOVDENCj4gcGlucyB3aXJlZCB0
byBhbnl0aGluZy4gIEZ1cnRoZXJtb3JlIHRoZSBBQ1BJIFByb2Nlc3NvciBVSURzIHVzZWQgaW4N
Cj4gdGhlIEFQSUMgTk1JIFN0cnVjdHVyZXMgYXJlIGxpa2VseSB0byBub3QgbWF0Y2ggdGhlIG9u
ZXMgZ2VuZXJhdGVkIGJ5DQo+IFhlbiBmb3IgdGhlIExvY2FsIHgyQVBJQyBTdHJ1Y3R1cmVzLCBj
cmVhdGluZyBjb25mdXNpb24gdG8gZG9tMC4NCj4NCj4gRml4IHRoaXMgYnkgcmVtb3ZpbmcgdGhl
IGxvZ2ljIHRvIHBhc3N0aHJvdWdoIHRoZSBMb2NhbCBBUElDIE5NSQ0KPiBTdHJ1Y3R1cmUgZm9y
IFBWSCBkb20wLg0KPg0KPiBGaXhlczogMWQ3NDI4MmM0NSAoJ3g4Njogc2V0dXAgUFZIdjIgRG9t
MCBBQ1BJIHRhYmxlcycpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KDQpZZWFoLCB0aGF0IHdhcyBuZXZlciBnb2luZyB0byB3b3JrIGNv
cnJlY3RseS4NCg0KVGhhdCBzYWlkLCBJJ20gbm90IGNlcnRhaW4gd2UgY2FuIGdldCBhd2F5IHdp
dGggZGlzY2FyZGluZyB0aGVtIGVpdGhlci7CoA0KU29tZSBzeXN0ZW1zIHJlYWxseSBkbyB1c2Ug
RXh0SU5UIGluIElPLUFQSUMgZW50cmllcywgYW5kIGRvbTAgaXMNCmNhcGFibGUgb2YgY29uZmln
dXJpbmcgdGhpcyBpZiBpdCB0aGlua3MgaXQgd2FudHMgdmlydHVhbCB3aXJlIG1vZGUuDQoNCklz
IGRvbTAgbGlrZWx5IHRvIGdldCBtb3JlIG9yIGxlc3MgY29uZnVzZWQgd2l0aCB0aGUgTEFQSUMg
bm90DQpkZWZhdWx0aW5nIHRvIHJlZ3VsYXIgeDg2IG5vcm1zP8KgIChUaGUgYW5zd2VyIHRvIHRo
aXMgcXVlc3Rpb24gaXMNCndoZXRoZXIgd2Ugc2hvdWxkIGZha2UgdXAgdXAgYW4gTk1JIHN0cnVj
dHVyZSBmb3IgZWFjaCB2Q1BVLikNCg0KfkFuZHJldw0K

