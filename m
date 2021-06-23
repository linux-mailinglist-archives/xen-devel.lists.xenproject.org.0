Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF73B1575
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jun 2021 10:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146159.268885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvxx3-0002l5-Lv; Wed, 23 Jun 2021 08:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146159.268885; Wed, 23 Jun 2021 08:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvxx3-0002j5-HX; Wed, 23 Jun 2021 08:09:37 +0000
Received: by outflank-mailman (input) for mailman id 146159;
 Wed, 23 Jun 2021 08:09:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G2Dd=LR=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lvxx2-0002iz-02
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 08:09:36 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7262ea8f-9761-455d-84c2-dcd21b127f8d;
 Wed, 23 Jun 2021 08:09:33 +0000 (UTC)
Received: from AM5PR0601CA0078.eurprd06.prod.outlook.com (2603:10a6:206::43)
 by PAXPR08MB6478.eurprd08.prod.outlook.com (2603:10a6:102:159::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 08:09:31 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::50) by AM5PR0601CA0078.outlook.office365.com
 (2603:10a6:206::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Wed, 23 Jun 2021 08:09:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 23 Jun 2021 08:09:30 +0000
Received: ("Tessian outbound 7f55dcc5b33a:v96");
 Wed, 23 Jun 2021 08:09:30 +0000
Received: from ff496ac8c364.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D72A3C70-DFA6-4B25-A139-15DC13766792.1; 
 Wed, 23 Jun 2021 08:09:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff496ac8c364.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Jun 2021 08:09:15 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6295.eurprd08.prod.outlook.com (2603:10a6:20b:295::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 08:09:14 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5%9]) with mapi id 15.20.4242.023; Wed, 23 Jun 2021
 08:09:14 +0000
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
X-Inumbo-ID: 7262ea8f-9761-455d-84c2-dcd21b127f8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgZB6MUWnCUSvUpM580yoqja+zml5jHOHpd9ePJWOBs=;
 b=E71RBzLLUwpdbnTPqO9B0eSRXNr0snqgpKLQqd1dZi8IgNBuiUu/40BTWAuQ+4PbfZPnBGZWHx7VpQuvB0Y67GKcSDIvRekibT8N4XZ+6R8/9uoTMhtX2bwy1K1m8SI94V20I8gRPPvIg86OkrdMuo1vEM2Dspb9/9oeo6hhrrQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 445d1896dc139d23
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoPPcjUUFnSmheuizRFBwcWVG/1OBbN0NJUkRUUOOgq52YPGoLFzJ7hQ83ENbm86oi3WqVRWjKfhTRQ62TvzZQMnO/OV1GfgRuneZXPALwyBqGk6mRrZulCE8q9tyjXRwjr0pen9brCx19t9F4wTEY4kZ5YVRnc3ke5DUrqlKUFk7um+rshK+YoxCM+Lu3i2weXM2Hrnd6B5ayYSVSouyx3Pa1R0ZudcAMzTwn72AsESTxjbQW8/9RVbVUjfAmDiJEB9MYRCDNW/JssAPP4wyiOAp6IQSxt+WwNiXt6DtrPLJRGDnpIyIgtsG+/rS1iF2LuCvskaO9T1Bl2wiqhMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgZB6MUWnCUSvUpM580yoqja+zml5jHOHpd9ePJWOBs=;
 b=DMze14FT5MmPa1uw6UzSDHn/8aTiTquMh2PDzQgdLRnjzyslPbUpopvNobAeIrT6nLw+0Sa88MZd9LjeJbN7CniIFarQfEc02jmWVlrFYNpwbajisrJ4QXU+DFgXYbdl8q7JtbtfAXeoP+Kp2CCbA4h8ml6oUISGSdPoQTLHAi/YwOoDHDO1sBEYenGBllFcApRw2OlOR9+K0bDv3nanPCkd4ngswR1LqW3/hmnWio3LCq8ytqPecNA5fvFRFBe22y1tJ94OIQoRTKntfmrNdPwHO6tCKKhz9BI4SnE9Te7g5YJgSL8BATVF/Npt1jBE169mceDoLeg0LohRYQPKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgZB6MUWnCUSvUpM580yoqja+zml5jHOHpd9ePJWOBs=;
 b=E71RBzLLUwpdbnTPqO9B0eSRXNr0snqgpKLQqd1dZi8IgNBuiUu/40BTWAuQ+4PbfZPnBGZWHx7VpQuvB0Y67GKcSDIvRekibT8N4XZ+6R8/9uoTMhtX2bwy1K1m8SI94V20I8gRPPvIg86OkrdMuo1vEM2Dspb9/9oeo6hhrrQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, "fnuv@xilinx.com"
	<fnuv@xilinx.com>
Subject: Re: smmuv1 breakage
Thread-Topic: smmuv1 breakage
Thread-Index: AQHXYY0v3XVdqEOvqESHjaQGLRWMRKsVQ9IAgACUkYCACrmTAIAAuQiA
Date: Wed, 23 Jun 2021 08:09:13 +0000
Message-ID: <55ACE88F-F72C-4715-B3B1-B7B7F1B4CFFB@arm.com>
References: <alpine.DEB.2.21.2106141840150.24906@sstabellini-ThinkPad-T480s>
 <791BFC00-6A50-48D2-A208-E529B887441F@arm.com>
 <alpine.DEB.2.21.2106151756190.24906@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2106221405220.24906@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2106221405220.24906@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce42053-5ad8-494a-192a-08d9361e3a69
x-ms-traffictypediagnostic: AS8PR08MB6295:|PAXPR08MB6478:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB64782BF7DE96FCC346C6713BFC089@PAXPR08MB6478.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pddmyaZCXHqkdi8za1pKbEru7dPQ94Z9szvQio4Pe2kCzov6sLFmxImJvFudGO8PttcElSifQjZ5H+zc4fNWcOZnNXim04ECOJ/v4ILbIPW34POjcpB+Q4zbOggE7H18VPJ2RsodCPMhg9osRuzWBrfB+tfaRyoTX0PD86VpjcSotV8ycs8+O2QxoqtLz2x8Vf5Ne0I/JyIrwBhn2GIR1WeuRJNWm8wUiKNOnuMG+GlXp5ww+fSFH076p3uo3wb9+XWCX0uTQ9ofQQt9dT6ASTSmgtd6dgVdNSizFzYAeK3KtOq0XLk6gOja/xq+jwoMp2oNR4rn2lDkfYdyKXgAek82f7F06u1TmXBjrh6VmcOGMrlWqp7ptXVvt4zQWyCX7v9FLxHo871uRsG7f6BI9WB7DAHHKg9tJJNmkKRC+8Z0rjyQYDJOE3+wlDrzTk4NhuE42mvMMOEo8KW44AlFMxc69XvZFgWT7TbCMFgF+D5fQccX/ZhA6JQ248FMm94jarkWHIJZ5d7VRXpkf7/ScO6BTEFE86rcJJdyiChNS8bY/NlHr8fFkbKnXtbjdBf0Iyr9jJsiLF88ppwjRm5FEDX6Mcdc/tvc45nLIy5Cmgs2xXkNRcixst6rV7sl4IfLpGdRIJbFRSH7NPigTRfBMhfzgRO7d53rptNvgkGad8FuieY+8u6wsfsJbIdWI+msYqs4OjumEVfNMWylKqc05QVbtcuBonQgw26Q0ccnZF/P/hyhsnSnN1YbBb3c45O9zGYwArMf6wQTsKfF0WNJZw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(136003)(396003)(376002)(366004)(86362001)(2616005)(6512007)(316002)(7116003)(5660300002)(4326008)(54906003)(33656002)(8936002)(71200400001)(2906002)(66476007)(6506007)(83380400001)(36756003)(26005)(186003)(64756008)(122000001)(66446008)(38100700002)(66556008)(6916009)(66946007)(76116006)(8676002)(91956017)(53546011)(966005)(478600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXUzRExJdFRUYmJaT2ZLdDh1NWNDcTFtZkxnRE5OSnFaMCs0L2dqZzVsYzVJ?=
 =?utf-8?B?YjBaZTg5cmoxa2FodVU0RlZZMVIxL3FERmVxM3dFSERYdk9GYjB4QzM1ZXdY?=
 =?utf-8?B?NFNvV0ZMdlhKZmNqWEFVd3lEdHZ5SVFzV1BiMVV5NjdUMkZBbzlpekVJdzFC?=
 =?utf-8?B?dUF6ZEdvOFBFTlkwaGd3NU1oYk5tNFVJSnJtT09JTHFiMzJXNjBxZFRsZ0d2?=
 =?utf-8?B?WDQ0Y1ovSjF6RXNwR3lFZ0lLSnhZWmJlK0NzRWQ5aDgvR0FiaW9TbjdMcGxH?=
 =?utf-8?B?cDd2TWFWMVJEY3VOcWRLbG90M25BN0hTSmt0MUU5R0w4ai8wcExEdzNiRWFl?=
 =?utf-8?B?OTZNZ0ZaMnZ5bUcra1VOVHJWeWh2THk0SEtNTFByV2t5S2lmY2xrRjJ6eW5B?=
 =?utf-8?B?b0EzUXJ0ektvaVBRVnJrR3UwNWw5OCtXbTVnZlRLTzBDRCsxQ2xnNnYxR0Nk?=
 =?utf-8?B?eWNDMXJrSU5sUXhVU3NxMVJLUDB3RG1uZXNBYnlXNmt3TjBtQmp3NGdtVDBD?=
 =?utf-8?B?OHhLeHY3U0t0VHV2czN6SmFoUGxtMjdpVk1ZQ3JES3dXQ2oyN0poRE5iYzZV?=
 =?utf-8?B?NDZEZEpBczlNa2NHWGM5VVBPUkZOcm1GSG5abXFpa2JEdEVqSksveEpDT1FB?=
 =?utf-8?B?clNCdjVIdmZPUkFFQmZOQVhlYmJlNzBFclVUZjZWem9hN2pVQ3JjUHNNeHNt?=
 =?utf-8?B?d1ViS0tOMUdYckhaVTdvMldaSE9zM3Y0MzVIMEJlend1b09CM3AySlNrVTcx?=
 =?utf-8?B?MVA0c05UVVMrR3RXZjkvL2lhbk9JMVdHUnUvaWpGc2VMZldSL2NtanlzTmNK?=
 =?utf-8?B?K1V0Vk82enlJVEV0bkZxRmJ5Y1RHQlFsYUFraXpZWmdaOU1heGZGTE5QRU5W?=
 =?utf-8?B?YjNWaCsrc0xTanhCVFAvMWFNTHF2SjFiK3diU2MzZlkrbTNoelRTdmdmWk5P?=
 =?utf-8?B?V0MwRjVQTVU5M0FkYndHdFM1Z1hOK3F3MUQrOXlyUU56c21UNDliaTVydHVr?=
 =?utf-8?B?SlNNeDl6Qi9Wd2NGOEdUNFFyeW5wYlljS3dmT0lvajV0WEZlWnZ0LzIreENT?=
 =?utf-8?B?L1RaM25MaGhEL3JxbVNoNDVGOHFBeXZBemlVaFV6ZDFzRTUzTnhoYmYybFRm?=
 =?utf-8?B?QUJJWnBNNjhPWGdERU5CVTZqVHFaUkdBZFNuSC9Cb3JEdDQwZXlQbmltaGVl?=
 =?utf-8?B?YzhTYno0TWQxdVcydlBsTnc4eC8zOVRKYzZBc0k2WW1KN2htY3hWYVlTUktQ?=
 =?utf-8?B?UENSdHJ1ODBRZUpxdkxxRE5lMmdHZ3VBM2VIeUVxUjM3bFFneTV4WFgvR2Fa?=
 =?utf-8?B?NGFZZWZnTVFWMyttNkVwRkdvQzZSZkFWQ05VanpHdU5oZzlxSWhSeG10bS9Z?=
 =?utf-8?B?dGR1ZlRnSTJDSlB6dTZvdE5CMy9vV25JZUJsQTB3M1ppcHdwWk5YRXZuM1Fs?=
 =?utf-8?B?UWVUdTdBbmZUV1BMV21sNUJzbnpwWkg5Rlp4Y3VvUjVVUm5UemlxUUtJOS9K?=
 =?utf-8?B?encycVdoYW9XTTlyS0pRQzBPSFBUendIZjh3a2lNZGp3aDVhNWMvWlVESzhC?=
 =?utf-8?B?MTl2VGtJUVVCZXFocW9RMzkxamNuSFl1RlRlZmF1UWN3NnZKYWpKcWx6djNK?=
 =?utf-8?B?aUd5KysxM29HcThRV2kvVS9mN24xT3ZUSlRMTGlmV0N6WWFyQmxJYXoxMzl0?=
 =?utf-8?B?cFpHdzlRR1YvNTVqdFhxaHZNSjVmZjU5NjdvUklOeE9ISWdiNHcxNnVnVlBp?=
 =?utf-8?Q?aPT4i/4aSAIWTfdfD+GNTFpNUkIrqOtoM8I7lnV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <157F9D603C4BE744AE1F926CFBFBD4BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6295
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29265d1f-995a-4a98-0aae-08d9361e3080
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PA7ZXIwcB9TnEs/fdJ1TG2NIgpQYP2U7urU3QOqfNH1CZtVVoXlZ76JEx9ahou9N8EruZP7R7gwD5BWJoL4a8RpfhMroMeR81HIApTWo4wreaz7h7Rq1h46QrAewYnskmHA42YhkiNuQuwhLgvbWGbWf0xwLnS8A1OVKoAMbjZgBw8QOx751qzmfgh+H5UX1nh3c+0Fq08CCw9aBmX8uQx16UBpg8Vjssb8tLCWvhAtNGm3EJfvlYMH1sKT/2y+e+9JYzdICzP+lXOFO1sibWGUw0UVyxEc/I2NmLqVNi4QgtlAKqOcYOfpGB+Iku9JwpB85BPpnkLbEtAjOX+iQZZuI4RFYq1LY4QbIW3nlJHl9ya5uw8GTcjbY73PABMmcOtHU1R5F7oVu2DcjwVEr9+ML9JOefyfxD3hoIRJ2hH0YZjOErmnWoKvqmlUgY9K+gzGoCG6iJb1get8Srw+OkUG03OIS+6WmymXVcgcE+MYTF9II7EduYLu/DNIFHnyVPyte5VZH/3v4o6b+Bu4Z+2wK7it3cXtgiqf4e0WyOBFJLHF0H8aheVkGSYxdG5rodiO7dd7ZJvw70DARLC9GJXb+7QZqdpO0Lt0BPWbhD72OyV/rAZ0J0bgRqM13sM79LXIn8VGSdZd/KtQkfKP+rfglErS8nCuHx8wvSxzwFr63dnRV7MzLQdoDaIROAgTpOelRl8cEYrlH28ShTEeNfjsfPC2+jdOiTQVRZ7yHHIRGBKm74is4a63xK4HkXI4wIWG9BxiGi3dnKsGRVSRNDw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39840400004)(346002)(136003)(46966006)(36840700001)(53546011)(6506007)(36860700001)(186003)(356005)(54906003)(70206006)(47076005)(5660300002)(81166007)(8936002)(70586007)(33656002)(4326008)(2616005)(83380400001)(966005)(107886003)(82310400003)(7116003)(6512007)(86362001)(478600001)(316002)(6862004)(6486002)(36756003)(26005)(2906002)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:09:30.5821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce42053-5ad8-494a-192a-08d9361e3a69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478

SGkgU3RlZmFubywNCg0KPiBPbiAyMiBKdW4gMjAyMSwgYXQgMTA6MDYgcG0sIFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwN
Cj4gDQo+IERvIHlvdSBoYXZlIGFuIG9waW5pb24gb24gaG93IHdlIHNob3VsZCBtb3ZlIGZvcndh
cmQgb24gdGhpcz8NCj4gDQo+IERvIHlvdSB0aGluayBpdCBpcyBPSyB0byBnbyBmb3IgYSBmdWxs
IHJldmVydCBvZiAieGVuL2FybTogc21tdXYxOg0KPiBJbnRlbGxpZ2VudCBTTVIgYWxsb2NhdGlv
biIgb3IgZG8geW91IHRoaW5rIGl0IGlzIGJlc3QgdG8gZ28gd2l0aCBhbg0KPiBhbHRlcm5hdGl2
ZSBmaXg/IElmIHNvLCBkbyB5b3UgaGF2ZSBzb21ldGhpbmcgaW4gbWluZD8NCj4gDQoNClNvcnJ5
IGZvciB0aGUgbGF0ZSByZXBseSBJIHdhcyB3b3JraW5nIG9uIGFub3RoZXIgaGlnaC1wcmlvcml0
eSB0YXNrLiANCkkgd2lsbCB3b3JrIG9uIHRoaXMgd2lsbCB0cnkgdG8gZml4IHRoZSBpc3N1ZS4g
SSB3aWxsIHVwZGF0ZSB5b3Ugd2l0aGluIDItMyBkYXlzLiANCg0KUmVnYXJkcywNClJhaHVsDQoN
Cj4gDQo+IA0KPiBPbiBUdWUsIDE1IEp1biAyMDIxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
DQo+PiBPbiBUdWUsIDE1IEp1biAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBIaSBTdGVm
YW5vDQo+Pj4gDQo+Pj4+IE9uIDE1IEp1biAyMDIxLCBhdCAzOjIxIGFtLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+PiANCj4+Pj4gSGkgUmFo
dWwsDQo+Pj4+IA0KPj4+PiBVbmZvcnR1bmF0ZWx5LCBhZnRlciBiaXNlY3RpbmcsIEkgZGlzY292
ZXJlZCBhIGZldyBtb3JlIGJyZWFrYWdlcyBkdWUgdG8NCj4+Pj4geW91ciBzbW11djEgc2VyaWVz
IChjb21taXRzIGU4ODk4MDliIC4uIDNlNjA0N2RkZikgb24gWGlsaW54IFp5bnFNUC4gSQ0KPj4+
PiBhdHRhY2hlZCB0aGUgRFRCIGFzIHJlZmVyZW5jZS4gUGxlYXNlIG5vdGUgdGhhdCBJIG1hZGUg
c3VyZSB0bw0KPj4+PiBjaGVycnktcGljayAieGVuL2FybTogc21tdXYxOiBSZXZlcnQgYXNzb2Np
YXRpbmcgdGhlIGdyb3VwIHBvaW50ZXIgd2l0aA0KPj4+PiB0aGUgUzJDUiIgZHVyaW5nIGJpc2Vj
dGlvbi4gU28gdGhlIGVycm9ycyBhcmUgcHJlc2VudCBhbHNvIG9uIHN0YWdpbmcuDQo+Pj4+IA0K
Pj4+PiBUaGUgZmlyc3QgYnJlYWthZ2UgaXMgYW4gZXJyb3IgYXQgYm9vdCB0aW1lIGluIHNtbXUu
YyNmaW5kX3NtbXVfbWFzdGVyLA0KPj4+PiBzZWUgbG9nMS4gSSB0aGluayBpdCBpcyBkdWUgdG8g
dGhlIGxhY2sgb2YgYWJpbGl0eSB0byBwYXJzZSB0aGUgbmV3IHNtbXUNCj4+Pj4gYmluZGluZ3Mg
aW4gdGhlIG9sZCBzbW11IGRyaXZlci4NCj4+Pj4gDQo+Pj4+IEFmdGVyIHJlbW92aW5nIGFsbCB0
aGUgInNtbXVzIiBhbmQgIiNzdHJlYW0taWQtY2VsbHMiIHByb3BlcnRpZXMgaW4NCj4+Pj4gZGV2
aWNlIHRyZWUsIEkgZ2V0IHBhc3QgdGhlIHByZXZpb3VzIGVycm9yLCBldmVyeXRoaW5nIHNlZW1z
IHRvIGJlIE9LIGF0DQo+Pj4+IGVhcmx5IGJvb3QsIGJ1dCBJIGFjdHVhbGx5IGdldCBTTU1VIGVy
cm9ycyBhcyBzb29uIGFzIGRvbTAgc3RhcnRpbmcNCj4+Pj4gdXNpbmcgZGV2aWNlczoNCj4+Pj4g
DQo+Pj4+IChYRU4pIHNtbXU6IC9zbW11QGZkODAwMDAwOiBVbmV4cGVjdGVkIGdsb2JhbCBmYXVs
dCwgdGhpcyBjb3VsZCBiZSBzZXJpb3VzDQo+Pj4+IChYRU4pIHNtbXU6IC9zbW11QGZkODAwMDAw
OiAgICAgR0ZTUiAweDgwMDAwMDAyLCBHRlNZTlIwIDB4MDAwMDAwMDAsIEdGU1lOUjEgMHgwMDAw
MDg3NywgR0ZTWU5SMiAweDAwMDAwMDAwDQo+Pj4gDQo+Pj4gVGhpcyBmYXVsdCBpcyAiVW5pZGVu
dGlmaWVkIHN0cmVhbSBmYXVsdOKAnSBmb3IgU3RyZWFtSUQg4oCcIDB4ODc34oCdIHRoYXQgbWVh
bnMgU01NVSBTTVIgaXMgbm90IGNvbmZpZ3VyZWQgZm9yIHN0cmVhbUlEIOKAnDB4ODc3Ig0KPj4+
IA0KPj4+IA0KPj4+PiBbICAgMTAuNDE5NjgxXSBtYWNiIGZmMGUwMDAwLmV0aGVybmV0IGV0aDA6
IERNQSBidXMgZXJyb3I6IEhSRVNQIG5vdCBPSw0KPj4+PiBbICAgMTAuNDI2NDUyXSBJUHY2OiBB
RERSQ09ORihORVRERVZfQ0hBTkdFKTogZXRoMDogbGluayBiZWNvbWVzIHJlYWR5DQo+Pj4+IA0K
Pj4+PiBEbyB5b3UgdGhpbmsgeW91J2xsIGJlIGFibGUgdG8gaGVscCBmaXggdGhlbT8NCj4+Pj4g
DQo+Pj4+IA0KPj4+PiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gcmVwcm9kdWNlIHRoZSB0d28gaXNz
dWVzIHVzaW5nIFhpbGlueCBRRU1VIChidXQgdG8NCj4+Pj4gYmUgaG9uZXN0IEkgaGF2ZW4ndCB0
ZXN0ZWQgaXQgb24gUUVNVSB5ZXQsIEkgd2FzIHRlc3Rpbmcgb24gcmVhbA0KPj4+PiBoYXJkd2Fy
ZSk6DQo+Pj4+IC0gY2xvbmUgYW5kIGNvbXBpbGUgeGlsaW54IFFFTVUgaHR0cHM6Ly9naXRodWIu
Y29tL1hpbGlueC9xZW11LmdpdA0KPj4+PiAuL2NvbmZpZ3VyZSAgLS10YXJnZXQtbGlzdD1hYXJj
aDY0LXNvZnRtbXUNCj4+Pj4gbWFrZQ0KPj4+PiAtIGNsb25lIGFuZCBidWlsZCBnaXQ6Ly9naXRo
dWIuY29tL1hpbGlueC9xZW11LWRldmljZXRyZWVzLmdpdA0KPj4+PiAtIHVzZSB0aGUgYXR0YWNo
ZWQgc2NyaXB0IHRvIHJ1biBpdA0KPj4+PiAgIC0ga2VybmVsIGNhbiBiZSB1cHN0cmVhbSBkZWZj
b25maWcgNS4xMA0KPj4+PiANCj4+PiANCj4+PiBJIHRyaWVkIHRvIHJlcHJvZHVjZSB0aGUgaXNz
dWUgb24gWGlsaW54IFFFTVUgYXMgcGVyIHRoZSBzdGVwcyBzaGFyZWQgYWJvdmUgDQo+Pj4gYnV0
IEkgYW0gbm90IG9ic2VydmluZyBhbnkgaXNzdWUgb24gWGlsaW54IFFFTVUuDQo+PiANCj4+IEkg
dHJpZWQgb24gUUVNVSBhbmQgaXQgZG9lc24ndCByZXByby4gSSBjYW5ub3QgZXhwbGFpbiB3aHkg
aXQgd29ya3Mgb24NCj4+IFFFTVUgYW5kIGl0IGZhaWxzIG9uIHJlYWwgaGFyZHdhcmUuDQo+PiAN
Cj4+IA0KPj4+IEkgYWxzbyB0ZXN0ZWQgYW5kIGNvbmZpcm1lZCBvbiBRRU1VIHRoYXQgU01NVSBp
cyBjb25maWd1cmVkIGNvcnJlY3RseSANCj4+PiBmb3Igc3BlY2lmaWNhbGx5IFN0cmVhbUlEIOKA
nCAweDg3N+KAnSBhbmQgZm9yIG90aGVyIHN0cmVhbUlEcy4NCj4+PiANCj4+PiBJIGNoZWNrIHRo
ZSB4ZW4uZHRiIHNoYXJlZCBieSB5b3UgYW5kIGZvdW5kIG91dCB0aGUgdGhlcmUgaXMgbm8gInN0
cmVhbS1pZC1jZWxsc+KAnQ0KPj4+IHByb3BlcnR5IGluIHRoZSBtYXN0ZXIgZGV2aWNlIGJ1dCB0
aGUgIm1tdS1tYXN0ZXJzIiBwcm9wZXJ0eSBpcyBwcmVzZW50IGluIHRoZQ0KPj4+IHNtbXUgbm9k
ZS4gRm9yIGxlZ2FjeSBzbW11IGJpbmRpbmcgd2UgbmVlZCBib3RoICJzdHJlYW0taWQtY2VsbHPi
gJ0gYW5kICJtbXUtbWFzdGVyc+KAnS4NCj4+PiBJZiB5b3UgbmVlZCB0byBhZGQgdGhlIG5ldyBz
bW11IGJpbmRpbmcgcGxlYXNlIGFkZCB0aGUgImlvbW11LWNlbGxz4oCdDQo+Pj4gcHJvcGVydHkg
aW4gdGhlIHNtbXUgbm9kZSBhbmQgdGhlIOKAnGlvbW11c+KAnSBwcm9wZXJ0eSBpbiB0aGUgbWFz
dGVyIGRldmljZS4NCj4+IA0KPj4gSW4gcmVnYXJkcyB0byB0aGUgbWlzc2luZyAic3RyZWFtLWlk
LWNlbGxzIiBwcm9wZXJ0eSwgSSBzaGFyZWQgdGhlIHdyb25nDQo+PiBkdGIgYmVmb3JlLCBzb3Jy
eS4gSSB3YXMgcnVubmluZyBhIG51bWJlciBvZiB0ZXN0cyBhbmQgSSBtaWdodCBoYXZlDQo+PiBw
aWNrZWQgdGhlIHdyb25nIGZpbGUuIFRoZSBwcm9wZXIgZHRiIGNvbWVzIHdpdGggInN0cmVhbS1p
ZC1jZWxscyIgZm9yDQo+PiB0aGUgMHg4NzcgZGV2aWNlLCBzZWUgYXR0YWNoZWQuDQo+PiANCj4+
IA0KPj4gDQo+Pj4gQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgdGhlIHhlbiBib290IGxvZ3Mgd2l0aCBt
ZSBzbyB0aGF0IEkgY2FuIGRlYnVnIGZ1cnRoZXIgd2h5IHRoZSBlcnJvciBpcyBvYnNlcnZlZD8g
DQo+PiANCj4+IFNlZSBhdHRhY2hlZC4gSSBkaWQgc29tZSBkZWJ1Z2dpbmcgYW5kIGRpc2NvdmVy
ZWQgdGhhdCBpdCBjcmFzaGVzIHdoaWxlDQo+PiBhY2Nlc3NpbmcgbWFzdGVyLT5vZl9ub2RlIGlu
IGZpbmRfc21tdV9tYXN0ZXIuIElmIEkgcmV2ZXJ0IHlvdXIgc2VyaWVzLA0KPj4gdGhlIGNyYXNo
IGdvZXMgYXdheS4gSXQgaXMgdmVyeSBzdHJhbmdlIGJlY2F1c2UgeW91ciBwYXRjaGVzIGRvbid0
IHRvdWNoDQo+PiBmaW5kX3NtbXVfbWFzdGVyIG9yIGluc2VydF9zbW11X21hc3RlciBkaXJlY3Rs
eS4NCj4+IA0KPj4gSSBkaWQgYSBnaXQgcmVzZXQgLS1oYXJkIG9uIHRoZSBjb21taXQgInhlbi9h
cm06IHNtbXV2MTogQWRkIGEgc3RyZWFtDQo+PiBtYXAgZW50cnkgaXRlcmF0b3IiIGFuZCBpdCB3
b3JrZWQsIHdoaWNoIHBvaW50cyB0byAieGVuL2FybTogc21tdXYxOg0KPj4gSW50ZWxsaWdlbnQg
U01SIGFsbG9jYXRpb24iIGJlaW5nIHRoZSBwcm9ibGVtLCBldmVuIGlmIEkgaGF2ZSB0aGUgcmV2
ZXJ0DQo+PiBjaGVycnktcGlja2VkIG9uIHRvcC4gTWF5YmUgdGhlIHJldmVydCBpcyBub3QgcmV2
ZXJ0aW5nIGVub3VnaD8NCj4+IA0KPj4gQWZ0ZXIgdGhpcyB0ZXN0LCBJIHN3aXRjaGVkIGJhY2sg
dG8gc3RhZ2luZyBhbmQgZGlkOg0KPj4gZ2l0IHJldmVydCA5ZjZjZDQ5ODM3MTVjYjMxZjBlYTU0
MGU2YmJiNjNmNzk5YTM1ZDhhDQo+PiBnaXQgcmV2ZXJ0IDA0MzU3ODRjYzc1ZGNmZWYzYjVmNTlj
MjlkZWIxZGJiODQyNjVkZGINCj4+IA0KPj4gQW5kIGl0IHdvcmtlZCEgU28gdGhlIGlzc3VlIHRy
dWx5IGlzIHRoYXQNCj4+IDlmNmNkNDk4MzcxNWNiMzFmMGVhNTQwZTZiYmI2M2Y3OTlhMzVkOGEg
ZG9lc24ndCByZXZlcnQgImVub3VnaCIuDQo+PiBTZWUgImZ1bGwtcmV2ZXJ0IiBmb3IgdGhlIHBh
dGNoIHJldmVydGluZyB0aGUgcmVtYWluaW5nIGNvZGUuIFRoYXQgb24NCj4+IHRvcCBvZiBzdGFn
aW5nIGZpeGVzIGJvb3QgZm9yIG1lLg0KDQo=

