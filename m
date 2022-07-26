Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAB25816AB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:43:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375467.607870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMhy-0007pw-Bs; Tue, 26 Jul 2022 15:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375467.607870; Tue, 26 Jul 2022 15:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMhy-0007o7-8e; Tue, 26 Jul 2022 15:42:54 +0000
Received: by outflank-mailman (input) for mailman id 375467;
 Tue, 26 Jul 2022 15:42:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB1L=X7=citrix.com=prvs=199b7977f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGMhw-0007o1-AD
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:42:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a08a47e-0cf9-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:42:50 +0200 (CEST)
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2022 11:42:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5293.namprd03.prod.outlook.com (2603:10b6:208:1ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 15:42:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 15:42:45 +0000
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
X-Inumbo-ID: 9a08a47e-0cf9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658850170;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RdOaLCovUqWBLqbLJOTx5EZ+Qx+Q+jv4/3hEm+KlMyU=;
  b=el0QjnOYAliOYng4TJB2sqqHu7DG1ZdaqeCxOipZTovAHoZ0BDGJPHls
   Tnagj617FBB5DJ4w+6OuZ0kZn9yhgaS63hiHclNZ8edLyGr1/uFUxcXLG
   rKz9iDJq1Q5kDpiO+KMGS6DJxTMndneHgiT7dyt080bQ/6ZnOionRpyf+
   Q=;
X-IronPort-RemoteIP: 104.47.73.46
X-IronPort-MID: 76659829
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A6SD3RaiVleHCAFPNvnt0IpK1X17brhtdHk7Pu?=
 =?us-ascii?q?qucsGbki+go9Ph2qTc8TtiQWGqXv2RR8IzxNKYuej64ZLRmY4KgerYD4pZG/?=
 =?us-ascii?q?vDzYglWbDVAgRz/mVc9ZRkDipJ/WiXDL1IR1e2HTi46tiZ58V2RglN52RoaU?=
 =?us-ascii?q?BYXl+26HI4lJuRcnLyAGv57FZXObsiRR68rqXoKWJzZ5Ibp9B0bFxrwD1mq/?=
 =?us-ascii?q?hCblt+K7tV/6qUF5i0d7wZ+2AwQuSdwvzLETrgbzgiAw1itq30WuvgeygubQ?=
 =?us-ascii?q?BzO0n0M4Hrm0Zts5d7MyZ4uM1bKP9mEYqX7ZCxVigIUolcd61i2U9/OQPfPs?=
 =?us-ascii?q?n/CVCA8eA+RBXQ3k6AnIwHdaCiANwK3Cc6VuXwTJaBhiCFHo9MNewf+xe3fs?=
 =?us-ascii?q?YU3BsAcqwonehsefVz52tL8kp95AB759TW/deSntBncbqWXJrUcaL+aGexRp?=
 =?us-ascii?q?zYnYmaIiy/LTvuVoQ1j3CR8lbTaFYUDrnGTm5Ya1wByiBVcq1QDmu8rWQoit?=
 =?us-ascii?q?we2Smf0Ar+mBdYz8OQZdTDee256YGN0Xac6FSIke/b2xBIohBXD0UJVMvgJ/?=
 =?us-ascii?q?kIaWp1i5Syjzl/nY+Sct0J5F0Q9k5vShdBx47ReC8s1s/G17AxHv5UAOhdtQ?=
 =?us-ascii?q?vbxo4+uePpDSTWl5ibSgElXigy1D5hPMnNXDlY71d7blPKJbT2DL6PIZPGuM?=
 =?us-ascii?q?mFnYZZ08CKMxsvab12MEhAuB23sNaJugw3aQfZJGwiL0eS+d4t2WB7Uup6oa?=
 =?us-ascii?q?Xg0pBpdkRTZ21PGsWzyVXW9bgX0lw8ogEXFInchlC87+k6LFV8fdd8NHc7FT?=
 =?us-ascii?q?AfeFQpXYhTIkDjdiiqqn9oDAZJg4+KrGxScVkPfxHBj1dlb//1q1gKDD188B?=
 =?us-ascii?q?QxWY05Yzpsi6uhkL97jtM7b+UlI3z8dw8gfOBE3rC6lX77LrBDiec4PW1355?=
 =?us-ascii?q?A1C+N0Wc9uAMuGAozWm3zvUIGdV/F2HYDh7+C3KCVJ7RJsOb6e3Drh6YHYVO?=
 =?us-ascii?q?s0tFXHjF6wo33u+zkmt2ZWFUOZdFIE5OO/4RbzBo6UEv8WwiKSU9WS5E6wLc?=
 =?us-ascii?q?iRJp3e92li0j8vrUMDJkIwM4E7JfUynOKkqVyWAvVDsnJQ6wfcmNJglCiadP?=
 =?us-ascii?q?T9HJJ2UjnxatRhmXYdHVgDSA5QkVBZ0UMZnFKvP0OPzHTBxoRMoO5r48ZnmX?=
 =?us-ascii?q?CPZni6UNjf/Z7pk7UqZTKYq0dOTG897x/byIPTgwKCLxSW0uLQccfp82XUzd?=
 =?us-ascii?q?SrFyck1NQtWWOqeQ/KZvolLFbWabDQS0zLmlBX0i+lHhKvs2MpE9vYcSKAic?=
 =?us-ascii?q?2YCiaBYnozCCDnPZUQWFOKC4ML9BPg04FKGGj4+z6sbRBPHkjnLbbKla6DSa?=
 =?us-ascii?q?qpx1MhoboT86Cb3u+h/89jEgzZOkxxLqadfoWo4a4aTl9VHsn304HVpsC/GV?=
 =?us-ascii?q?MwmCTsdR/OTJ1iNhDGe3INkpY5OckH3kTL9dzIh+rxUTF4f8v/mHVZyf47LI?=
 =?us-ascii?q?y4lJqmamvzX6tl0/jWcr2yTZwZuiklCLpg/ccpyB0Lvi4SMU4fpM9ZXBr3ta?=
 =?us-ascii?q?VEca6O9OYIEoCYQSPPVInuqXTWw8LAaHcB16F9BnZpFp+Twzrbn5WAbpmvIH?=
 =?us-ascii?q?cwx1MR7gA5CYpd+UNbSI0BIYJjsWHa/DMF/ZP1Os5OGUqEZhuPQJUO90BCqV?=
 =?us-ascii?q?nvGykX4qOMf44hhfkW6ZP0f+EkcO/QvYgI1pPP+ue1ychK/xGI8b9sVEKnn8?=
 =?us-ascii?q?XRrSB/TCbAUQQewdpVOUOPeUeQ2kzqTJfniPD7cG1KKlJrjKSKbv+yr2tWCi?=
 =?us-ascii?q?EbJE+fcXqdQjqNWKAenXATnsljgOmiPGG3izxelylRjMF10uk5u0aHvCtw6y?=
 =?us-ascii?q?pdreJDpMM2c8ML0ObL9qVKH9HkTwypFFgXMWncNoHPNWLCc8rTWcidMGzFUU?=
 =?us-ascii?q?gornoz1Qb5gOcrJ7zQ646pm9U0rDE/dzUWt5QA9ufZjOccNNEqbqTgRA2FJM?=
 =?us-ascii?q?Qk8LRld6v4GIrsvBpUTJkI3L26QkRK112H0ArVjoMbUYozsfZ8xDtBODPQQD?=
 =?us-ascii?q?pIZ76E7DYB66YZpRX9G0U3WoUgECxpcNt0tCQu7+GMOoG4VtsBPM+seiehK7?=
 =?us-ascii?q?S9GpKLi1k23p29sUjaz+4yJirNX9WRkLVvNRjwbA1t1pAOfguYAzPPhe7i4V?=
 =?us-ascii?q?lHr4fPPpIW0zTzB5zyizutln69UGu/DWl0zKn32WNPAh/4dKk2lh5CzDzdzp?=
 =?us-ascii?q?3ord4dHZw0eQqHX53nHb61VxpwGQgS5qO/MLS93j5cYRjj8GiNNEL/RFW1FH?=
 =?us-ascii?q?t6bJq+iasjBDOBeyHqrh/fDfBi4OVpovDlJfUnzkihe8xpDGTfRmzb0YgfIs?=
 =?us-ascii?q?GixHosInAUDbCJw0bJcSz8+H4sfTTvRGmKlzEMY2DvbQtua59ZQhiPBZzBHq?=
 =?us-ascii?q?UuQh94nlaeZiGD4qTRQjVhkYNnRm6jqmceIDFbID7+MC/z1TUHLiziZkAZUs?=
 =?us-ascii?q?fn/3pwxB5K/6Xoz5+FYRWaesUALRLj5HUzCVtrDMG9cu0zRt9yWYsoGJc9DK?=
 =?us-ascii?q?tC3o6L6sPx3GAZBexUaQ2knkn4JSK5BKuLieFiRJ2mJAqtaUQOkQNFivA=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="76659829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbslKTEGy5+4Ccc2kIb0fOeIVkX+RiwzX9LgK24qBh6petcde0tkNlgMUm+hZHdwa4cUQN41Ijxw+DGZrE/wR3QNQJaPbB19lT8cdcDj4l+Y3FvTxKL8hgHMFNDd8WYh1/mAwxt45EouVw24KGjWOUu2BFPkcPphtKlsdBdJhA35A+8k3n9tfmH3RDg1o2dctHtsHbuZ3GoCpooyCRITN6kXhA+wyNnyWYDQJnN1itDXQZdM5MEzYPviQYBVlvejQClRu91CjmwP226ScD9NWHSdv6060rUZXxczqWsMrL/LKXAD05cu49oAbLP4BDqeGG6uju2OWeKWy3rsL6elDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdOaLCovUqWBLqbLJOTx5EZ+Qx+Q+jv4/3hEm+KlMyU=;
 b=I/g8GkCtmi4mkiEQrGLoukvUEUUY2ogYVvCCfFAVzeTij8yrpqLGUD8CMQTc0KHJ44hMnr/KpkVziS1weD3HazC4g4AodrwbHruNOOmEKMfR42rHUCRmPafz6Rk5GkYqx9odeI3xWrdZ6aNLEaAdwStoCbKmjKtoja8Sh4Raul2WnnYrifyAI8qXxtXAiUCub32qCYz7f+imLlI2Pf9PIbfu+3fkIh/cia0E94M3j4yXL0i2sz0mh5eB4g2IQRw6NtWC6zcA/VWqmhxiLRIz8ZlUDjeolvTKNbNSMvAYWmtTQBj5A3HPOQbIqwa40pHDsYoOzcQkh52Lqfj4SLW7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdOaLCovUqWBLqbLJOTx5EZ+Qx+Q+jv4/3hEm+KlMyU=;
 b=es7PnxoPXutxxGFzffmmTPlCcwWGhsm9QHon6XB6fPBkAJbjpVsILNruM5AIMUOel7AgDp/yEtfiZ9/Gj88CCiWHzD13xJV460Nmg0XL33QQgTxZh9noIGtSz0Ex2d7E0lk9iPOBsb2uHt1TOKzuly6HCXvU5k0WQuFp/2etYm0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Edwin Torok <edvin.torok@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] x86/msr: fix X2APIC_LAST
Thread-Topic: [PATCH v2] x86/msr: fix X2APIC_LAST
Thread-Index: AQHYoQRqcpYxNv8GZ0++T/cX45qn262Qx/AAgAACuoA=
Date: Tue, 26 Jul 2022 15:42:45 +0000
Message-ID: <3b23d5a1-4b49-6c12-2539-dcd1bb2de735@citrix.com>
References:
 <f22ea4c14d8be5672c036076ecd5818c6ca1d06a.1658849010.git.edvin.torok@citrix.com>
 <3e5ceee7-533b-1cae-262e-b05b5b22692b@suse.com>
In-Reply-To: <3e5ceee7-533b-1cae-262e-b05b5b22692b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 367e389f-e5eb-4e33-4820-08da6f1d7c28
x-ms-traffictypediagnostic: MN2PR03MB5293:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tsWedfHEX0lhfkiozWIEcC4YAlxogKbkNFwm4Axg5G/zcwE9KsfGYhYUk+kWMRa8TZnbbWCKiNIjLVhR3oC+7SmDk3j2NZtJsvCtYXTIRXNWdHbGGgDeY5dt9nWHj+0RxZQbo7Xed4zQf+WTqXVyHtvV8pf3X9a9G9ACcspFqM13L2fwB/OAINWGEY92nHom8qF5wgzYzj3VqbHczUC17Bp0m7LuGJUha7wxRKP//cz1UVnYLH20mlo0dLAx1QpBpBxMob2igP5tZteNzmwq19qnfFRt3YLHOHeSS7YjV/ZXweLrTIM+cVDH9Xu+5Uh7CG3Tgo1q4g20CSGZmItq9HQdw7RNFJyIIR/zHyLhiTjcqswSxaLIIgQNaS9u4ayq3yBRUDfrg04JLYUSZ3aBIwTvulEEWq8i2Fss7+UjF6pJiOlkzktn1Ar/ZThlWXYbC3ridzcI+vDg5YMxQrkS0UrtTPlf17m5Ggcgi783pS/UvrVr2G4D+GKLlZyhzAi7hkhuYaL+Cu7bH0CnNdM+sctipq/eyIHi5Z6IbOb/9AyWDCnmvscruJ8KMovzinE5Ouw5jr+DH9JWztNL1hORBV2gHfh2lHsp6IjaxvXiMz4f8FplZkkfd/N5z8C7FwsZzQ/VNkpFDW11jNvMQLwniz3k0PsFTFyN5ZuxQVAmCeiey+7o9eZLCcLVotFyc3fJYe6FVz5COEfOGN0yqbZpJ93IVbrdoIot71iF7J+sT0XCGC3TgRupEWep0tVB2C0z7lGoCAG80H1F+cFIyT02Ry1EzMnueEIFDWSUdW/q4I6m0SIWrjx7Y8VO7M6DJtFxjF+fk769WHHQ90/hZTkEdyGjdBLlEVpZj3XEtK4qqEQ0UInAJH05BXc1OzUb6bbZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(122000001)(6636002)(110136005)(38100700002)(54906003)(36756003)(316002)(8936002)(82960400001)(66556008)(8676002)(4326008)(91956017)(76116006)(66476007)(66446008)(64756008)(38070700005)(66946007)(26005)(6512007)(186003)(2616005)(6486002)(478600001)(6506007)(53546011)(71200400001)(86362001)(31696002)(31686004)(4744005)(2906002)(5660300002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUI1TE9BL0pzNndVR3FWeGtIQ0VJUFlsRjMrVTdpQWRWRjhVUkFXM3Y2MzBl?=
 =?utf-8?B?UWpWeDJ3M09XQzc2RkU4cndCUUlRaGFlWmVwamc2NHdaSWMxamU1RFEvMGNo?=
 =?utf-8?B?NVBLYWQwMU5YOXVhR29MOVUyN3RRdlIwTTRTYlV2dzhBVGV1WkJ4dTQxNTBk?=
 =?utf-8?B?aHJCSTA1d1I3azNMZGdRNGtiREFHeUFJN20zOTdIa21xYVhiTDBKcVhhZ0pq?=
 =?utf-8?B?QzVVNmhUN0NXeVlkT0NNbXcwbm00Q3RPR0FOcHlFdXNwckdCSks5aWNBOEtU?=
 =?utf-8?B?Mk52NDlTaytuTlZUNXp0UHcvUHMyU1ZrTFNjdUUySzVRdk9GVXNFZW44a3lC?=
 =?utf-8?B?dG1RRCtXbGlOR2hBcHByOVN5aVhvblBMTXhlVVBlWDZYbytrdnJ1ak5VMGhL?=
 =?utf-8?B?T01SNVBrTHh2MXlNdXNyK0ZjU1h0S1lLbFZpSjQwcU5KTE14RzRFV21iMklV?=
 =?utf-8?B?Wm5OYXVVVkNydlIzNkZ5Skg5MDlGZGVTL2xhMTFpeWs0K3dPamdXenRJZXBn?=
 =?utf-8?B?Lys1RkFTZXhIV3pGa2J2RXhySTJWSzdwRE9MRmZJZ2ZUOUoxT2NVT2JTOTE0?=
 =?utf-8?B?Q2ROMlNyU0FPeC81R2cvNGJuN0J1OFhDTVpjcXN5MlJ5U3k3ajZCOFd0a2o0?=
 =?utf-8?B?TXJib1loZ3NQY1pnS0VsUTZPMU4rZ0JrZWhEbHR4ck9GaDZqYnZRNG5hZHlm?=
 =?utf-8?B?NWM4Q3hKZHpRVEZtYm5mUXlIU1RONTVLcnZCdU1XNzN1OGNTUDlZNTdzdks5?=
 =?utf-8?B?TnIxeXE3VloxTVVHa2pXL2V1YmtnVForTVBObkVlbGZuc2NIYkpsWmFmV1N1?=
 =?utf-8?B?RHZrUVZrYjdlZGhsMG9XZk5BZkdUMXZkMnhIM1c0U0ovVDYrcHd5ZklhUS9H?=
 =?utf-8?B?Sk45NHRuYjh5dVlVRmFvZjB4WWFvUUIyMW9Td051ZG93QUhzVXdMM3RoS1hE?=
 =?utf-8?B?SkpKdEU0NGR6R2JvY05TR0JLeDlzaU15RHlJNXpWRWo2blUyaGtGYjdnazJa?=
 =?utf-8?B?TG9td3crWncyR0pLZjNIRk1xd0xEUHd2UXRQN1VYMFdvcjcwa1V2Z254TkpD?=
 =?utf-8?B?S2FSZVh0ckVOSGJkd3JxNVc4cm1aNmdLeFk0aW5kSzhlUTc0UWhtNFhhdnJ5?=
 =?utf-8?B?M3VjdDVSR0VCc251MndsZWNaOWc0cnJtUEZWUjdYYkVCQjNqQkJaejZhelZG?=
 =?utf-8?B?WFh5aFp4L2xnTHRZY0RaemM2RkhmbFJWZnRjcjNtdm5LWXAwYk0zK0hONkVT?=
 =?utf-8?B?bVZFRHVZMFpnblo0ZFFuOFBSNENNaE5jTmtwdDhhNUNxTDlBaXdtZS9rOGd1?=
 =?utf-8?B?S2dHOTR3WWo0blJGV3FGUDBmRC9WRWFpUmV6RngrWmdrZEVlaDh5WnB0M1pE?=
 =?utf-8?B?SzI1OEgwdStLRDhUU1lVczZhYkh0MUhvL2FXM2M0a1ZwMVlwbGVBZjdQUXly?=
 =?utf-8?B?SEFGRDcyOW5GZ21FQnUxTU9kcDNhVVE2ZnNEeU1haFZGK1hWcDJaWVlxT0Jt?=
 =?utf-8?B?N0traGpmQk5oaFdPMkdQMnpaOVdFdFRhQ3FiaURzV2FXQzlRdTY4Q000QTJM?=
 =?utf-8?B?c2QyOWd5OFpRYWt5SW45cUhzL1RTRlR5NVdwRS9tSnJQeW1VVFl4S2h3d3VF?=
 =?utf-8?B?c0hqSjJtdFB0VENiQmJrRk05YXBSOFVMekRXZXBlRXcrZ28zOUlTYnNLWE1H?=
 =?utf-8?B?MDZjU0pSQVBYdXY2b3ZQeGRVRjlWc2crK1VRUUo3R1gwM2M5eXJKNWk5c1JQ?=
 =?utf-8?B?U2JJT3F0cUxOdExBcUVHeVprbWd5RGsrck5ycS9RVkZpMStHcm5MczlKTlRl?=
 =?utf-8?B?MThRdGYzdUozYldkck9KS3pyLzFxZlV2YXVxaVY4NnRQNVp2NVpkZFMxYnJm?=
 =?utf-8?B?TUp3SGNWMkRnZ1lsS1NTclZQK2hneEZ2bjJWU1BNNnhlUUJZOEVVaUtiSjVD?=
 =?utf-8?B?WTI5aFFZTDUxUmRTaDk0dDE5LzNmYnNwVlRKK2FCVnpCeXBxNUNUaXdGSEpK?=
 =?utf-8?B?YzBqZXBOMkhpNXZpNXVuV2lPZHcrQUVMN2cySE1FZjlBeGg5RmdlODF5d0tQ?=
 =?utf-8?B?ME9kaDQyQS81SnNMQ1kwcGowSEdaUXpxb2VYRzlNVUVhRVJseU1iVWhLNUFz?=
 =?utf-8?Q?G0Ce31XDgREZPT/l+/RSZoBBe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E82570BD148CD4CBAF14E14E1A41DA2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367e389f-e5eb-4e33-4820-08da6f1d7c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 15:42:45.3939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7ujVJkhVLgsmpFnpiWfq6ay7Td9th96aIc4jgr74TiN7rSvpJGsd5DJDTUOQbXU478y+LTK9tbTgJIMm2iQg/sbs17HIg5iQZSqwSYtN9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5293

T24gMjYvMDcvMjAyMiAxNjozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjA3LjIwMjIg
MTc6MjgsIEVkd2luIFTDtnLDtmsgd3JvdGU6DQo+PiBUaGUgbGF0ZXN0IEludGVsIG1hbnVhbCBu
b3cgc2F5cyB0aGUgWDJBUElDIHJlc2VydmVkIHJhbmdlIGlzIG9ubHkNCj4+IDB4ODAwIHRvIDB4
OGZmIChOT1QgMHhiZmYpLg0KPj4gVGhpcyBjaGFuZ2VkIGJldHdlZW4gU0RNIDY4IChOb3YgMjAx
OCkgYW5kIFNETSA2OSAoSmFuIDIwMTkpLg0KPj4gVGhlIEFNRCBtYW51YWwgZG9jdW1lbnRzIDB4
ODAwLTB4OGZmIHRvby4NCj4+DQo+PiBUaGVyZSBhcmUgbm9uLVgyQVBJQyBNU1JzIGluIHRoZSAw
eDkwMC0weGJmZiByYW5nZSBub3c6DQo+PiBlLmcuIDB4OTgxIGlzIElBMzJfVE1FX0NBUEFCSUxJ
VFksIGFuIGFyY2hpdGVjdHVyYWwgTVNSLg0KPj4NCj4+IFRoZSBuZXcgTVNSIGluIHRoaXMgcmFu
Z2UgYXBwZWFycyB0byBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJY2VsYWtlLA0KPj4gc28gdGhp
cyBjb21taXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gWGVuIHZlcnNpb25zIHN1cHBvcnRpbmcg
SWNlbGFrZS4NCj4+DQo+PiBCYWNrcG9ydDogNC4xMysNCj4gRkFPRCBuZXZlcnRoZWxlc3MgaXQn
bGwgYmUgYXBwbGllZCBvbmx5IGJhY2sgdG8gNC4xNS4NCg0KSXQgc2hvdWxkbid0IGdvIGJhY2sg
YmVmb3JlIDQuMTYsIGJlY2F1c2Ugb3RoZXJ3aXNlIHdlIHN0YXJ0IGV4cG9zaW5nIGENCmJ1bmNo
IG9mIE1TUnMgKGluY2x1ZGluZyB1bmRvY3VtZW50ZWQgb25lcyBvbiBIYXN3ZWxsL0Jyb2Fkd2Vs
bCkgd2hpY2gNCndlcmUgcHJldmlvdXNseSBkaXNhbGxvd2VkLg0KDQp+QW5kcmV3DQo=

