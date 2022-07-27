Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AF58230C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 11:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375989.608539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdIH-0000Il-Rk; Wed, 27 Jul 2022 09:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375989.608539; Wed, 27 Jul 2022 09:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdIH-0000GS-Ot; Wed, 27 Jul 2022 09:25:29 +0000
Received: by outflank-mailman (input) for mailman id 375989;
 Wed, 27 Jul 2022 09:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGdIG-0000GL-Kh
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 09:25:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b73eac2-0d8e-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 11:25:26 +0200 (CEST)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 05:25:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6106.namprd03.prod.outlook.com (2603:10b6:408:11b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 09:25:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 09:25:21 +0000
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
X-Inumbo-ID: 0b73eac2-0d8e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658913926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1Ghs9AO0+gGzUaPsy9UZGxgKzDe5BU0R3MyrsQB1VSk=;
  b=SOIJPDsOb/+0SKO7u/FeN68i/X248WaGPtzLuJttyzsjpf27yR+sWtH5
   /gTjx4SKUDyg05FAN3qLMMHIQmDhytQgGlJ4q+6U1wvNgyVLeAdVPOi26
   6JRceqaH8ypjSnmuhXXMwMlybjj4zikuvT9ji3UbtU7M7H5+txljgIYXe
   s=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 76720124
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A6+Gx56m9XGS2/OwoGW1tM3zo5mJPLRPZYqRN2?=
 =?us-ascii?q?KgSY23mBrAEGkRwzqurT4snDBXTOmeg7fBgWQLCS5ckCjuBDOdex8xwGmv+V?=
 =?us-ascii?q?29XL6G/tmIvGER1spMmSz4xVfEB7nonVNn5MgVOlYfhK+QZqYlBIE+gIC5l+?=
 =?us-ascii?q?F5ZSHNKJCbWSwj/uaQ4D4GHIGafWdo74Yy/mtwhxDoB8MufO+2rJ8l4AT8/V?=
 =?us-ascii?q?fixpta73PXBDsZPST2Rsz5LLqnfLqcJS1R+w9wVKsyBhPymz8mOdlEDknKU5?=
 =?us-ascii?q?cAmGVBZHXcH0eBv7ZkPc9Ruof6AxcOKgeqtS51nU+1PPnQEwabEJV2DUzPLK?=
 =?us-ascii?q?Qs32x5/d5XGq/kPzq0VSmk4HTuqUIizOKWZxYr7ZNYha7BMZXtGVBBTXfK17?=
 =?us-ascii?q?p8Dc1zRcbbJtZB9KyTd8PXMyCDKN9tkaqx8U9yxXD9sZaLDJUUUv8beJyy3O?=
 =?us-ascii?q?Y74dD2hP1mO5h6eIZuOeKDkeyb8vC9k2yUm7BsCoftaz0ot61C5UGLbEHc1C?=
 =?us-ascii?q?iB2ASLVIwAMfoZtVOhauJUUgxJh1cQ9eOU3MM76GjxUD1wtWaxp7hmFYtlBX?=
 =?us-ascii?q?2bYMPCtkVf4PBQdR+q6dhzJX9SYI3kms/0lIu9c0VXrDgU5VSReosgfap6Oi?=
 =?us-ascii?q?0w3CtvayzvT55vTYmNvJ0eOanvONyDpcPXSEqeR1ppzuOH7CQkTXcv39WPKa?=
 =?us-ascii?q?ar2E+/wWocKEUj6NGu8rYmkBBGo4BwUNtSQPs53Imv3EcWYuWnztxuY9lV/3?=
 =?us-ascii?q?BHIjzsCmfbqXyC+4A6L8FDD+sD7Pa1oHuccmu8k/JFf8kxtADNzKAXgaP/oG?=
 =?us-ascii?q?amI0ZPKPILavXW2gjkvGi+YvEsaPczxiY7MqVOK05eJXuK3TeJopiSx3uzFY?=
 =?us-ascii?q?OgbwyoWgNrawn8a3j/8wXrzcTX4FJniG42x/zjl1vJeFjbSkcHVy/V2tBtr9?=
 =?us-ascii?q?jEkZZ7xFap+TSIRsgURXWPVYKIR1hbzgLO+kNp6Oi90N9sN6xKJzOrV41+MG?=
 =?us-ascii?q?zMN8KEzQJE8032+ColdILWdbmlEt0SnCLXBBhcI+/wEZWsHkZU8udI7d6Exf?=
 =?us-ascii?q?eTH1UxFMkwoVvxeHUww1/5VXtz0R6NdEevEphpioPyp2mfoBRvHu+0JqU+Y5?=
 =?us-ascii?q?7p4TrC0fLQoJasqkfvxdTmNi4DtWwX0fTDJvFI/idkMVZP5AZLMoIoJU5xLk?=
 =?us-ascii?q?mfBA5btnnLUQSHS7GucOMgXNwRrMVRIYs6ldk70iuRfJ3Tsvl+l8sSkhX//N?=
 =?us-ascii?q?z1OMOEzSAO3nnSCgXYq1GD21hmDIt/CDdnmFCLBYzLatZPYP+d+8v6YIhDLr?=
 =?us-ascii?q?SX5QRCxXOVzjxTcHRTcP9wYb03VOgmIWzhRwQ1lT1EPKR5Bv/Bj3QDyFZTxa?=
 =?us-ascii?q?WG6Du2uEhUfUIsCb3iiLOet8jx3eDyY07whySGM547VEFzsQoyefmPCLs6/j?=
 =?us-ascii?q?7xIlbbtTRHoHTaP8IJFdVNKaJu1TltZiKzhO1Mkgo7aLHJYf+d8Y4TNHJg/F?=
 =?us-ascii?q?qUZDepgZTASmAijuWNerjOpuJqCoEwk1fZ+sHGtSpx4rIbErKOOrAXetX4pk?=
 =?us-ascii?q?LKQBsCX7JiFK3E7cq2kK9Sh/0AyPwXnBoDID5on7YhXxbcQ/Xaa4MTbVYloB?=
 =?us-ascii?q?EzQ5gWGwEZ565lc+yMydHWbfLpdP1o5RbIfnV8+sStYRyeaAcsVgMG47nlIH?=
 =?us-ascii?q?u5tQU8qqMeMMwz3TGBtvBUH0VHqEX2wvAvnW2P8uIySF4L39LjdlsQSp5zS6?=
 =?us-ascii?q?7Pt2AhjEWgVpBw83BGlMu+zzYqKT1SXo59L9wnxQIVa0MQ2rdVGQjmPrXYO7?=
 =?us-ascii?q?k/NpCFnxtB5au8q6kmWCOAl/NzvwasS1uUoiVtWFIsWvUDy6DwoN7iAF5So2?=
 =?us-ascii?q?/VMTvKAl/DAkjKCA4b2k3HNe/mcEYG4+Ftc0J8mJh7XiP8V5/omFEKc0qRfg?=
 =?us-ascii?q?5obcqnVcQ8Pn9AU8w1jsHtbHBJOvEn8XTWpvovPTyIYMkDsEzjKwIsyG1935?=
 =?us-ascii?q?dvQvEWdk/mCr9HqEtN/g6SASD5BB1T92mehAsna5rU+IbuxiLq4I5aTrX204?=
 =?us-ascii?q?ZwYa6NHDs+Dk/3ypv0jR1HeAaJv5CXkLNy7PxehLZsA+EqcHMEnDJxIyB/fG?=
 =?us-ascii?q?lwzqzNNEp5k4C5w1YwN4v6tqnVO9h6V61xZ8gn+xbKBG0jc8sal9IpkzzOH9?=
 =?us-ascii?q?d+1ODn0Sh40R6ZwM1DxpeY6/XYXzYqY9ycmJz1gBIqFemOdAICBhWDFpzMNa?=
 =?us-ascii?q?6aPwqgmxWJBSZ2yMxVHj1YJ/jc62SsqwmScdbjuSpcee3Rkn2HjseO+tnP7I?=
 =?us-ascii?q?gZbRdTOcSVgayu94atkjFI/onuEgUL7VnFkEshB1gaP/hq7IYjtBcrwJqppA?=
 =?us-ascii?q?wCDYePG7Gf2EInnPhbwzb0oOafeVARAufJZQk/oD0nLV9rgMLMnZzJ6mJ1A2?=
 =?us-ascii?q?oOo4Dp1StKuZZ792ISXuooaT4ju5HaX8/RRPYIUs/LPvLZcq9GG+YSNsxaox?=
 =?us-ascii?q?GuPGwX7u/Nsj3sIUAY0ZYRm?=
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76720124"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrcCCp/Ivh+mWoTAtcI0tuc9p/xmFkjJetxV8oKjmtgxHpmTBEDRQqHkcbSfnwmh3XzHPPWyBkwvle7iES8xxywnroPzXbCFAPCcxdPIMu98Seces8Mlqfiq0rFJugIOFOFCRVfm+Bou7TcJCw/ciWIkzFQTE4e11jHCu0ua9Y+OISnOyKJg0ALexHAUMChcZbUjDMSxnu90eAwm6aamb/lJVPxGt7LK0IR36qC3fFd6nUCLv8IHdPXVjJxhOLA2mqlUqz2AZoHlxTO/mcvVrZ0zgjs6RlQx2gE2m6lNCGx8+ud1YmaCVaO1NNLV7VjJxRIgiwuS2+5fi+RnUzsOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ghs9AO0+gGzUaPsy9UZGxgKzDe5BU0R3MyrsQB1VSk=;
 b=e7RiPTqSrxRJ2BhPstc+cLB7uReoCR/DELggTLEpqwiAWRHhmzsgiLZUgQADSJuRi2yPlxlkhSeWRKM+BCUEVmE008UTOIF7YutyYUvnDzcaMVRJpGJsZF8bjzcXwUjaYNMU6pe+rHaWI07AXSm5Uh+Eg+XGZnHk0LONsbO6OLnP4qXA7hGrBxyQ8iF1lS2jPbi+A/nH+u4D97QCnbJDjYCr1sMxX/Aqo9uOsAlVDH1UVux6UiaCiJripMEYTH5Xi36H2IDw+AKrErm/eAf+wa6BG4dotSBboQvfkU2HVNA6oa88cKt8XQLVVYPy26vwiF+mM6xkhIgemLqah4GFOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ghs9AO0+gGzUaPsy9UZGxgKzDe5BU0R3MyrsQB1VSk=;
 b=aeY2SNykzHSiqU4rVjreOyRCdw5xbmGATCi+fPDrjXnEQBUQPoAaoR64a4zZhxn2LE8r+97UOlu5JR+pHy627JxstHsFCBADDKT3Fw4z+CeAzHVgHdVTZ3qctTj2tRdgDAsM7/IOLwZLg7W0TErPgpQ+a5NYht24bYCTXB1GN1M=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 1/8] x86/shadow: drop shadow_prepare_page_type_change()'s
 3rd parameter
Thread-Topic: [PATCH 1/8] x86/shadow: drop shadow_prepare_page_type_change()'s
 3rd parameter
Thread-Index: AQHYoQlKUZG91kJy+0mCRkr+mGKzn62R84IA
Date: Wed, 27 Jul 2022 09:25:21 +0000
Message-ID: <2b1230fd-bd2f-6905-c99d-5ce7ba10af42@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <50abcb9b-8f69-0789-5f12-c422ff71c3ac@suse.com>
In-Reply-To: <50abcb9b-8f69-0789-5f12-c422ff71c3ac@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52d353e1-0af8-4425-cf66-08da6fb1edae
x-ms-traffictypediagnostic: BN9PR03MB6106:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 y6Rtop5V1vfTNgcxEOWtEMl0H9HKEJs0RG1EgO9cyw+AEGaW3+aG+0H0krCcKKd6Lo4kwmfUW+01HQCjY0yxZn73QFmf0SuGaM9lY/3LrXwb8+YE75FN1NP2/Mksov7MjPX5IIZ55QwUlOkQF5lkT6gU4PDBkVTzlxKUTCCDafgSFhNQW1gkXMU71MhxvHknfdC50/hjCIcHQXB33K+PSeRfe4jk6dxu5fLpbTo+LpHDJDEutHcb5deMSxwGOkhN9S1RWLTirMWk6DHvYvrxnmURHNGRwEB2IcUHsy30MNBNWqCW6kYa6qsXnFSQJA0wTivOtkMB8ehryMVt1EpFHXhIwwB1p6Md2VClvT4V8J44g8O1bVI+twbGnSsnXh/lrF2ZijjAchEo0O3uOlzXQ5h8v63Ob627I9/d7oT5OZV+K1H9VgzEqGL5s6bsiS/VzB62U2vb7Qs3xRLU9hbTKsArgJapLkAO+HDKlRm+gud/n7OjSMVxjm9X+1kdxVBumkzG9oRo/WSITiQ81km8mPuI3qJc9jooHgvQu+lwlxoICmmgfPplfmDXeAlgVsZ3QyIuvFf3u4NPB6Wv5TvQJu14l3xaoBlLFBHoPZ9bvRF9cug/adwpMA+XYfSXz7o4ed2+OfL5w8LLElv1l4bpi1r1ioNZwKhG3fHbMfcI+j2B2te9bbkDtUZm1/6n5/2RfY+NccTo4XJCHFO4PCLOBbYYUA7QTlRvGXrL7UN7YwiMEA7fdfAOVIU9u3Vg83vE480NxORNrKPp46jM8f92cUYOXmU8xguoVs/FyUDVz+pUExuMnwXgBB0EfG128FT5dqHnM+NZO51VQh3HnEBzIASvBdwF1cHtsCTp9AU20eGEX+Zs/r8HijX6OiGu2oqg9Hv2QD8SY5ARrLMFlIxppsRPRjrz0aKVkXD4KPiB8QY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(53546011)(66476007)(66946007)(76116006)(4744005)(66446008)(4326008)(66556008)(64756008)(6486002)(91956017)(8676002)(71200400001)(8936002)(478600001)(6512007)(26005)(5660300002)(82960400001)(31686004)(2616005)(122000001)(316002)(38070700005)(54906003)(38100700002)(6506007)(36756003)(86362001)(41300700001)(2906002)(186003)(31696002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3kzMHAvNGVQY0c5a2VEMmxFVG9rTnVHWnZZUGl6WG5udHZxcy9lSFRJWkFl?=
 =?utf-8?B?QWNQb0NkS09WaUY1amhCWjZtcEM2dHZVQ2pQZ21zTXJRME1NeTJabC9NaTlU?=
 =?utf-8?B?UXk2QkhsYzQvYTgrR29uM0FSM1hYUFVpb1JpY2ZhdWVFVkFIR2UyMmZVUGpS?=
 =?utf-8?B?NTY3R0gxbHFPaHpKRFRtNTBYK0VoRW9FVmdXd0djdTZNanQraGU0eFhFbmRQ?=
 =?utf-8?B?a21kdXpiS2hEMjQrQ3NKRnNZd0dWQ0prL3dPcUUzZ1d5N3RrWkNyRlBRNGVR?=
 =?utf-8?B?cDdZWGpQQXYzbGVlZVlhV0VRd2d0eDA2YThjWjBGU3lBNVVyZDF5UlBPakdp?=
 =?utf-8?B?MythZHpmcDVVYURJNERmeSt2L1RWcytHWVYwM25uWllUSTZyTzFDbGdRNTVi?=
 =?utf-8?B?alJTNTZIQ3dSdDlyQXlkQ2VOTXl1elpiWjI5YkFWVTdxdHE3alREVmpOR0Rq?=
 =?utf-8?B?bmowY0tUcW9zVHRZLzNyZEtDZjI4Qm51bSszWUcvWVBYM3pNbm53ckY1bXBB?=
 =?utf-8?B?bGs1QUdMTGRMMjNDRVdXRVVsQ1p5VTJ0SGhvNVlneTdCbm93SmFWYWs4UTM2?=
 =?utf-8?B?dEdacTZnZWtwaHlqanRuZ1M5azZVem5CaG5zYW81dDF1M09zSmlqeFNNMkpx?=
 =?utf-8?B?ZUdnNVJUeURURlhmNlJvcU1iL3N6TE5RcUdONDlvbGthM0JoZnRvNE4rWG5w?=
 =?utf-8?B?cTg0T1J2UUxLeVNyS05HVHoydTJPWlNyN3o2SHFGaUY3dHZkTWVCZ2RUak84?=
 =?utf-8?B?TlZYTzNyQ2Y4dTNKQk1tZkFvU1Q4S0tQcTlyclZYRWNEQ0V6N1JJZy9XcWQ5?=
 =?utf-8?B?djdUbjR4SlJiWkpNai81ZmE4clJIV1IzRCtUNmltUUZwR0JXbmpzV3FZMTFr?=
 =?utf-8?B?SzVBd0JzcTBpYTJTSHlwTnRyR1pPNG5LekkzSndoVzdBQW9qdHp0NnR2ajVo?=
 =?utf-8?B?MXZNNnBpUGlNTHRWNkRnYzRJSHVSeGE0ZnVnZW43cGFpNlFaR3RnQ3J6N0xs?=
 =?utf-8?B?TEQ4eU1qajczMTYwZlZtQ2lSeVJUcHJxeFVQc25yR0d4UzRzc1pDdjhQNFhP?=
 =?utf-8?B?VjgzZ3hSMUVGR3dUd1RDcXJ3aldqOXJ4SVRSK1prL3d5YnQycXozaktBUUV5?=
 =?utf-8?B?dEtRTThXWnc0VUU0a2V6Q1BscW04QlR2ODFDRDB1Sk5RSERsS3YyZHdnamFU?=
 =?utf-8?B?RjdZN0prK2Y0Y1FCMWdDU1hHS1E0STFycUxTOWJ1SEhkQzd4NGtUNHpvcXJ0?=
 =?utf-8?B?SGFVMVNiV0piRm9OS1dJNDE2bG1oblFRb2I2R1AxcFNLcXlQdjFRejdTSTNr?=
 =?utf-8?B?MEtmbnBJWTh4TWNHb0pCWEUyNlgzNE01N1NGRU45Y0ZHQ01tNC9TcEh6M0hU?=
 =?utf-8?B?cW84N29FdmRxdytGY2RJM1E2SXM5TGlDU0pNSTJMRkltM1laMlVLK0JZWWJ6?=
 =?utf-8?B?eGZCMGQ2Vnh6cjIvNlk2eWE1Z1RsWGVrRFR4RmU4Zm9PQTk1ME5oOXMwU29r?=
 =?utf-8?B?bFZRakVNVC9LL3NwYlRYV0JMYzNjRE1vRDl2cXM0TDB1NHMyQ1FqbkUwZjhN?=
 =?utf-8?B?VzNDWXptNHNDQnkxano1eTNyeFF5Nnk2alk2T05OV2NEUmRGWFpVZDZZTFd0?=
 =?utf-8?B?UWwzWENKY3ZYdEtORTYwOERUZkp4Tm0wM0V2dEZ3TFpScTl1R2hncE5JbVo5?=
 =?utf-8?B?K2hXbk9Ic3dNUzJQc1VlalZCZm5RVDRNY2VSZlhPakdKWHdTMmtCdGtRVjFZ?=
 =?utf-8?B?WTFNUSs2YWhIbmw1V1F6K1RDUERYOTVwc1BXOFZ4ZVNrRVc3QWIvZzBzR1Bj?=
 =?utf-8?B?MGtVcWdra0JESnFEbU9sbnRlQ0VPMlV4TlJhQ3lHQjNTTUdjbVFvdEc3enJ0?=
 =?utf-8?B?YlVSbUtQT2habUlsZEtrUVVmTWF2U1BrWFZkNGMrREdXZEZLSW8yNk9FNG0z?=
 =?utf-8?B?SkwyWkxBaUpzdE1mS0orOG5DNElTamdISVhsdmJZOElOSHV5STJiUC8vWU5Z?=
 =?utf-8?B?Tmk2NXpJZndDbUNyU3h0UVlrdlBjSi9IYmJHWHhtZ0FpcHVNaFd1N0ZsUE4v?=
 =?utf-8?B?VDZ1Zys0TUpMTFIrZWJLSnpoTHgrZnZhL0VXOXZYRFhCOHJUQVV2Wm5RcFph?=
 =?utf-8?Q?ADiePl4SFREM8RrX6+cg2w/Mg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA2598516989A54F9F8C2D78CF72FD0D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d353e1-0af8-4425-cf66-08da6fb1edae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 09:25:21.3272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQjrP/Nclidgfe8fRkY8wZn6pWKtEFxggQ7lWRwaPdTc7Eqdf3BCocvkZ6wc5wq638YbSmkfA+5W60ExQgVN618AJbRHO0m/HOrxdgyNrrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6106

T24gMjYvMDcvMjAyMiAxNzowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFzIG9mIDhjYzUwMzZi
YzM4NSAoIng4Ni9wdjogRml4IEFCQUMgY21weGNoZygpIHJhY2UgaW4NCj4gX2dldF9wYWdlX3R5
cGUoKSIpIHRoaXMgbm8gbG9uZ2VyIG5lZWRzIHBhc3Npbmcgc2VwYXJhdGVseSAtIHRoZSB0eXBl
DQo+IGNhbiBub3cgYmUgcmVhZCBmcm9tIHN0cnVjdCBwYWdlX2luZm8sIGFzIHRoZSBjYWxsIG5v
dyBoYXBwZW5zIGFmdGVyIGl0cw0KPiB3cml0aW5nLg0KPg0KPiBXaGlsZSB0aGVyZSBhbHNvIGNv
bnN0aWZ5IHRoZSAybmQgcGFyYW1ldGVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0K

