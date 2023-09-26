Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926037AE77F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 10:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608343.946765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql37s-0001p6-L3; Tue, 26 Sep 2023 08:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608343.946765; Tue, 26 Sep 2023 08:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql37s-0001m3-Hz; Tue, 26 Sep 2023 08:09:00 +0000
Received: by outflank-mailman (input) for mailman id 608343;
 Tue, 26 Sep 2023 08:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ql37q-0001lh-SC
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 08:08:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0b1b635-5c43-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 10:08:56 +0200 (CEST)
Received: from DU2P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::25)
 by GV1PR08MB9940.eurprd08.prod.outlook.com (2603:10a6:150:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Tue, 26 Sep
 2023 08:08:47 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::8d) by DU2P250CA0020.outlook.office365.com
 (2603:10a6:10:231::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 08:08:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 08:08:45 +0000
Received: ("Tessian outbound 1eb4e931b055:v175");
 Tue, 26 Sep 2023 08:08:45 +0000
Received: from 12cc27cd85a9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5116AEBE-416E-42C9-BF1F-FE913F127BC6.1; 
 Tue, 26 Sep 2023 08:08:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12cc27cd85a9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 08:08:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9910.eurprd08.prod.outlook.com (2603:10a6:10:402::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 08:08:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 08:08:27 +0000
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
X-Inumbo-ID: f0b1b635-5c43-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+adqwIIEImopxV9YlaUzOJHCn5uICq8OOeKnJn5yZ74=;
 b=nWPedxKgpiMYe4C4A1kvqFGuwBhVuMBXjAiIZv0En1TiY1MY9C36BDQ2/9L8VST7qDs/Gtwvyz2ytxi+CNlKw/JGYDW9HRTJgjotKB9nTP/Hvt0Nb1cNR14gsoHp5OOUHhCmOgiPd8NmPwIv0rLRgrjm7QdqG7GIJEgHcN5b2yA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4664ec34959661de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKqX94k6QNyICVlgP3J4dmABRAt5p0j9lbgPg55II/5xD2kgkHJ4Yig6+EVXgqdKm/kpraOeakWUrqk2BwiVLNoPT+VVVNsjMfXVxVMClP2RjLQhsptYsHGNJWfGuqyFZOHgH52excr1oz34Y57sh8YaOifMtEANMBKKYyRlGKfVKswnAyES0p68Wa+4YYxxD+fjnkX8okL3GYvsNNSgBiaac38qwebCi52+gVINPyCVG1RXsyqLfBSAz3Mbtuy56QfwMHE2rl42YM3LXhu4D+2U880I7GZZTdfN3oDVZ01gi4A7X1N7ybeW56rZZlSFhQNxcreLqkFEWkNikd2jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+adqwIIEImopxV9YlaUzOJHCn5uICq8OOeKnJn5yZ74=;
 b=TBplkc8MJApBYN36+Vr77K1R9MavVG0NZxY7qWJlqCLLdUvls68A2D1lJbS3IwPRwVrhwGTXWWWX+RHxXAOfB6/PS3cPBcYhcPqYuqlztjpPukKPSwN3r1w6G7of0f+7TVde4lg1DnbRFPzICW4o7KNL4LGFMozKTSYDKWkb4Pp+S4GUxGVCZAegLkPFlTtZFZY5zgd9jQEkvz2NdHKPUv/sf7z+pxv9Wk0pS7yFJN3l52/pGIDKN2FfQfV+YYAz1/Tgfb6CT6Ay3iJJhsG2W2FXsFaol5AwipEvgvjsGpeCIEd23UmGMm9+NeaEJh3SARcneligRO6u9r+fglj0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+adqwIIEImopxV9YlaUzOJHCn5uICq8OOeKnJn5yZ74=;
 b=nWPedxKgpiMYe4C4A1kvqFGuwBhVuMBXjAiIZv0En1TiY1MY9C36BDQ2/9L8VST7qDs/Gtwvyz2ytxi+CNlKw/JGYDW9HRTJgjotKB9nTP/Hvt0Nb1cNR14gsoHp5OOUHhCmOgiPd8NmPwIv0rLRgrjm7QdqG7GIJEgHcN5b2yA=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "jgross@suse.com"
	<jgross@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArJCcAgAGYfQCAAAMKgIAAAP4AgAAB7YA=
Date: Tue, 26 Sep 2023 08:08:27 +0000
Message-ID: <338CEC44-2393-4A62-975B-40F5716CEE18@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
 <0be1e32f-5600-7b3a-8d72-84297a1ebee0@suse.com>
 <DE6F0412-BF5A-4242-9D08-521034F509FE@arm.com>
 <729d4ed8-f33d-f7f4-ddd9-3d8e91671474@suse.com>
In-Reply-To: <729d4ed8-f33d-f7f4-ddd9-3d8e91671474@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9910:EE_|DBAEUR03FT018:EE_|GV1PR08MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f896279-5353-44a9-95a8-08dbbe67ce30
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8uDOjNZ+zeVEAPnFar7Lgb1JiVpRmvHkEua9NshqgE2zmSkSeX0MryNcejvOmtJa5P3/Sw3zbcg8sEvwb3uCajtI/OWTB97UmDjLotya9jJsfhdclbpDl+K2s3cKKY57FUcXWP8VYQi361Xd8brJOhOXIPMpKJ4hRsOwajzvWUBsVsLLOakEMKw2ogRWZscAH9XGr68rtO66yZK3yGk8BKepH60tQSz/5UcYmaD1Q895aK1IQsuH1/6vsF9JWkmCs/vh6lbxVwvrfI74YnfqDgUmnvSIHpAjyNxPJUD6eC0QpGUn3ZUfludvN7EqH/TM+uhN7BdFyk83LZ2uF/LuO0QuNXKMLUJV2lI+hPLxTD7KKhItVLmiDoFSrICOi91d7mBGxUEieQgtqwOGFffH34H3lUZW19gPeq8/99TZB542dAc2B/BTVOfUa7yQZ6CnOicFvtRnUuYFgq9tIevx7Kc8+B2UOP+9bj8wjq6rRRnHCtdqMr2hTwH1X5t/FLFpB1oGdCeUFGPotmxbqdWDZkpPwsE9KxLrJYkM5JuJyf91UclLgg0jKBKOHKC80VBiH+IGvEgx6CBK9JACnhlk9C/UTgpcZAaPVF5RVoiZgFYNctVYkpyz4FR7y/aBgg3JPb3OnIny3NXTaqaXWUgP9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(451199024)(6486002)(2906002)(38070700005)(122000001)(83380400001)(38100700002)(76116006)(66476007)(66446008)(64756008)(54906003)(91956017)(110136005)(6512007)(66946007)(66556008)(966005)(6506007)(71200400001)(53546011)(5660300002)(26005)(41300700001)(478600001)(8936002)(8676002)(4326008)(316002)(2616005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <924DFC99F5E3C240BC1FC005983C49EB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	559934d8-5fee-4b34-ffde-08dbbe67c399
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1tgzfp16Lqc1uILy1Tza1cm7Yl0Wr843N5MUqMQBEHzSTHb7baInF8QB6EEy90bkv6SYm4K2PMLPLW6OlK+1SpILRAi7iwbqoOqduX4hGDlVmK1hWZNHrLeTq6AFIbsiRl6upBikusYTLTt/kc6cRjO1H0iQUkVRSNyiP6d2lIz608/AlWKVbReUOCzLZvVTFnE6zgcMLeLU5Cao0xr86ml/mAZo8MOIkltmrsQ+lXrDJUYu2T7Ppvfjxo6+G7FjkAAC+y4/a/6n8UNl70N7NKZSafLwvXHasc/5LvLynGe2y5N8DaqalaLXJNMMAX3ZJYF719NLBMmsREZuQWgtejkP+xxEVPd0IIGky8DHUN6ttUgpE5KP+LQF4xABnp27ozDm64dMmwj4bgQ1I/+xs3QNjvmZZmQ1or0WHy7lIz1C2RRKi7AyFWjFtPxaAC9+i6xNNu1TnTh+c4sLkbSVSh6OLE3NyosJ3PxinCZzFNlIYtA39kmgI54xbGCOL4P7sTb5yFuh7QngJXyaa3ofsbp/R9Wd/IraevxIQNtISoS3MN8lvAx/FyF61Z24/BIQllrqonJ9fPqhO/E0Q0MENptRoP8OV4E3zqER84tznxD6/szPLxKUNXBD/06O6Z2LTtcFAOQVXJXxjB0DK/3x4sROnGybqI4ykWi0+txREqEVD4+8NVH1rN2LI484UmBly4C+j9ahL/oS3FMzldvuZwQX2gC38QNH+k0RH5uHNMI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(478600001)(40460700003)(36860700001)(966005)(26005)(2616005)(36756003)(356005)(336012)(83380400001)(82740400003)(86362001)(81166007)(47076005)(33656002)(5660300002)(53546011)(6506007)(6486002)(6512007)(70586007)(40480700001)(70206006)(316002)(54906003)(110136005)(2906002)(8936002)(8676002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 08:08:45.3256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f896279-5353-44a9-95a8-08dbbe67ce30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9940

SGkgSmFuLA0KDQo+IE9uIFNlcCAyNiwgMjAyMywgYXQgMTY6MDEsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNi4wOS4yMDIzIDA5OjU4LCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4+IE9uIFNlcCAyNiwgMjAyMywgYXQgMTU6NDYsIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gRnVydGhlcm1vcmUgbWF5IEkgYXNrIHRoYXQg
eW91IGtlZXAgYW4gZXllIG9uIHRoZSBwaHlzaWNhbCBDUFUgaG90cGx1Zw0KPj4+IHNpdHVhdGlv
bj8gSXQgY29udGludWVzIHRvIGJlIGRvY3VtZW50ZWQgYXMgZnVsbHkgc3VwcG9ydGVkLCBhbmQg
YXMgbG9uZyBhcw0KPj4+IHRoYXQncyB0aGUgY2FzZSA0NzM0MmQ4ZjQ5MGMgKCIgeDg2L0FDUEk6
IElnbm9yZSBlbnRyaWVzIHdpdGggaW52YWxpZCBBUElDIElEcw0KPj4+IHdoZW4gcGFyc2luZyBN
QURUIikgd291bGQgaW1vIG5lZWQgcmV2ZXJ0aW5nLiBXaGlsZSBJIGhhZCBpbmRpY2F0ZWQgdGhh
dCBJDQo+Pj4gd291bGQgZG8gdGhlIHJldmVydCwgYSBwYXRjaCB0byBTVVBQT1JULm1kIHdhcyBt
ZWFud2hpbGUgcHJvcG9zZWQgKHdoaWNoDQo+Pj4gd291bGQgb2YgY291cnNlIGZ1cnRoZXIgbmVl
ZCBhY2NvbXBhbnlpbmcgYnkgYSBDSEFOR0VMT0cubWQgZW50cnkpLCBidXQgZGlkbid0DQo+Pj4g
cmVhbGx5IG1ha2UgcHJvZ3Jlc3Mgc2luY2UgdGhlbi4gWWV0IEkgYWxzbyBkaWRuJ3Qgd2FudCB0
byAibmVlZGxlc3NseSIgZG8gdGhlDQo+Pj4gcmV2ZXJ0IC4uLg0KPj4gDQo+PiBJIHRoaW5rIHlv
dSBhcmUgcmVmZXJyaW5nIHRvIFsxXQ0KPiANCj4gWWVzLCB0aGF0J3MgdGhlIG9uZS4NCj4gDQo+
PiAoYW5kIGEgcHJvcGVyIENIQU5HRUxPRyksIEkgYWRkZWQgdGhpcyB0byBteSBsaXN0DQo+PiBp
ZiBhbGwgcGVvcGxlIGludm9sdmVkIGlzIGZpbmUgd2l0aCB0aGlzIHBhdGNoIGZyb20gU3RlZmFu
bywNCj4gDQo+IElpcmMgdGhlcmUgd2VyZSBjb21tZW50cyBvbiB0aGUgd29yZGluZyBhbHJlYWR5
LCBidXQgbm8gdXBkYXRlIHRvIHRoZSBwYXRjaC4NCg0KQXMgdGhpcyBpcyBzaW1wbHkgYSBkb2Mg
Y2hhbmdlLCBJIHRoaW5rIHdlIHN0aWxsIGhhdmUgdGltZSBmb3IgdGhlIGF1dGhvciAoU3RlZmFu
bykgdG8gcmVzcGluDQp0aGUgcGF0Y2guIEkgYW0gcmVwbHlpbmcgd2l0aCBoaXMgZW1haWwgYWRk
cmVzcyBzZXQgdG8g4oCcVG864oCdIHRvIGNhdGNoIGhpcyBhdHRlbnRpb24uIEFsc28sDQpJIHRo
aW5rIGlmIFN0ZWZhbm8gaXMgaGFwcHksIHByb2JhYmx5IGFueSB4ODYgbWFpbnRhaW5lciBvciBw
cm9iYWJseSBteXNlbGYgY2FuIHBpY2sNCnRoaXMgcGF0Y2ggdXAgYXMgdGhlIGZvbGxvdyB1cC4N
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkgIA0KDQo+IA0KPiBKYW4NCj4gDQo+PiB3ZSBjYW4gY29t
bWl0IHRoaXMgb25lIGZvcg0KPj4gU1VQUE9SVC5tZCBhbmQgSSBjYW4gcHJvYmFibHkgc2VuZCBh
IHBhdGNoIGZvciBDSEFOR0VMT0cuDQo+PiANCj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy94ZW4tZGV2ZWwvYWxwaW5lLkRFQi4yLjIyLjM5NC4yMzA5MTExNTM0MDMwLjE4NDc2NjBAdWJ1
bnR1LWxpbnV4LTIwLTA0LWRlc2t0b3AvDQo+PiANCj4+IEtpbmQgcmVnYXJkcywNCj4+IEhlbnJ5
DQo+PiANCj4+PiANCj4+PiBKYW4NCj4+IA0KPiANCg0K

