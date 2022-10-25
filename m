Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0753A60C9AC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429737.680932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGwU-0006GK-Jj; Tue, 25 Oct 2022 10:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429737.680932; Tue, 25 Oct 2022 10:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGwU-0006E8-GK; Tue, 25 Oct 2022 10:13:54 +0000
Received: by outflank-mailman (input) for mailman id 429737;
 Tue, 25 Oct 2022 10:13:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bl8Y=22=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1onGwT-0006E2-EU
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:13:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9379d5e-544d-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 12:13:52 +0200 (CEST)
Received: from DB9PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:10:1d9::12)
 by AS2PR08MB8877.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 10:13:48 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::2) by DB9PR02CA0007.outlook.office365.com
 (2603:10a6:10:1d9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Tue, 25 Oct 2022 10:13:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 25 Oct 2022 10:13:47 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Tue, 25 Oct 2022 10:13:47 +0000
Received: from 7972b6f66a26.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE100BB9-C422-4F3E-BC09-D5FFE78A7D21.1; 
 Tue, 25 Oct 2022 10:13:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7972b6f66a26.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 10:13:35 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB9478.eurprd08.prod.outlook.com (2603:10a6:20b:5ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 10:13:32 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 10:13:32 +0000
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
X-Inumbo-ID: b9379d5e-544d-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iIfYR4OWj7sLhtodbdVe4ABRHH0qcrz2aU2xpPLxI+yng6s6jzGq/0nghK8jTKnPYod9DfblqFT96EmlALXLRXbvgDpX+CoVFWSxgsu1QnkNxbkJ6RXnYmh6/aN6jeA4jHYd5RzmoXGiIr7i1veKmOD0R4Lzyr0ESaLy4uJa0cbyyuUCMAzPRPUBqAYFu/za/8a/usIio1LyTIyPqflRtknZZuEotk9A7k59X+cJBDDKK/722v6+eGjV8weUovgTcT7MDlURfH/UXj4MNL+NrT4d94pnk27AidQXu51Jf6lgAO/ilTbrGFBuegIHKKm58FXzG9J/n8zn+X2SC1Bs9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV0sSax2zUI3ikKKSJM07B1czfdYOo4pkIxA8fBQML8=;
 b=LRgdbTUe7GgY/Yqclg72rokh4vQcJa8ExS8LULQhSVOGk7AYaPoez2jM7F3aiEQPIWEzmRMBHDnpBflDlHGKJzO9DLDmc5oG22c12iqB5tw5KuBeIeMYermci2MCPkthJBmi2Vt/MzaCqG3AuksIvqB6lQkh+PiDyE3aCAJHcshtsKU4WLZBzErI4n/T22A2qWDnt6FKX42RTTRq8ZEXgkhSZPPahQoHUcd0yCk9go5t5GGVC2v0b7RjwdxsORST1quErkoYUUhmUw5qBacoZvCkeLJjTOAcUB0nuLGsw2ZjTNx84E3jR7ZkehgjsmPj2GVWjMFTSoNtvcgjqJVaBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV0sSax2zUI3ikKKSJM07B1czfdYOo4pkIxA8fBQML8=;
 b=wYMsBjR55MUZziYUsVqgpxeAb0GT5CGPhk7/LyFEShCNtOORNk9E0eMKzjMBGxjDXNOhgplAewAxaFPJzOPnQebc/n0SxRqkkHACm74RZnrFJLflzuBbpP8IMpAhCW88NVaH4gEitmqPSn7ubQh6pPkRWMx8m2ZF6HHPPH2BgZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fca29d9dddb64303
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+npQIWpKnoluMz6sqMUywKXU7YHhSFI6LIT0IM1unN9w8wvpE0ObWvwbEL4NMM7N/82KRncywgI/1GkeuIrOTBBYqyIF5AR8Gpq2AJ3EVHjJ81MYzs0cgw94K7LdtteAxLPfHI3PkO6HufuAtO/cU2C1hMVdAGyHSZOb1ePwJMXamrX82PyrRUT6oHM4ASPwcs6adiYtxV0f8WQukJ0DBajRdyRSBRFks4Le8Dj9jpDbS8E3qmrtqHOY5X5cUxOsPgaelMlLFnURd7pknOaGb1Imc5BQpBqHNFhzc7gRtug8TBEhr6hVn3UavkM3a5NC3JUt+dmdgBX5zMT1vkMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV0sSax2zUI3ikKKSJM07B1czfdYOo4pkIxA8fBQML8=;
 b=VFQha9um2BLcHIy+IO8GAbAflvicmR5lWP66vMzjHJFqX2riJCHUmLecp8Qz4w3nGY6IZBIIlCTiqsnmjIjbYsUd+DqNJFlgaiu5Ul+/GbztfvcmMTvvjubT9T+F6MIbgbZB6WI+zO9LKlTaSzghVLuMoEX/VpOZgGQ+lMH4pv+AdsxFa8Zc9WwEV2UbYmFgwZDvIla0RNSeLNz6Ge6SFjLpLupP0Og7V/gMsmYbUIR2LuAYrPfz8VFN6su0GjBc68OmVQcBG8i8Lm9oNR/+9+tTreNU1of2NRbPZlut3f9+/5mBvYFIBNQd+9NicDT8Yq6IG5cwI0HRX89V2aXM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV0sSax2zUI3ikKKSJM07B1czfdYOo4pkIxA8fBQML8=;
 b=wYMsBjR55MUZziYUsVqgpxeAb0GT5CGPhk7/LyFEShCNtOORNk9E0eMKzjMBGxjDXNOhgplAewAxaFPJzOPnQebc/n0SxRqkkHACm74RZnrFJLflzuBbpP8IMpAhCW88NVaH4gEitmqPSn7ubQh6pPkRWMx8m2ZF6HHPPH2BgZQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>
Subject: [v2] Proposal for deviations in static analyser findings
Thread-Topic: [v2] Proposal for deviations in static analyser findings
Thread-Index: AQHY6FpvIduyYvAcGUOy4Pq14Ntd1A==
Date: Tue, 25 Oct 2022 10:13:32 +0000
Message-ID: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB9478:EE_|DBAEUR03FT010:EE_|AS2PR08MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 62113d1b-a306-4dcd-fb02-08dab6719b31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ehplrCcgonZbeWWWzgWrKxJEJKqn8H7wzXARQ4IiWo72mwvwP/3zmo2H6wm9RGU9/7EGkkAwv+4BnAKPYCO8feV5r3clqCe9M6+PFXAqF4Ex4THEl7LcNbaPjnoHv8C+dDTMAAV+es8MjYjbj076h0RbsYwLVhaQATOhiuDmOsM4P9aTtGsk9EVr37EK0c6tbJX6dMBkwga1VvXQ9cwKb6l9W3VSuk1moE83/0T1g26N1hMq386CUzwV8g6q9+wt0SSuNlGipg9VWh5cL6xXSsDz/1Ziz9C9gaQDW7OJQsZRq95JEOkAXxbJXgavDus2s1i0n3yObMEvyQxxhK5NuQMacgR4YBojhKkMOTQ/76otEzbHUK1FCzuw0bA/RU50Xce1g2k32c+ltIhqpt/yNX+zpTi8KLq5jnY1bZ8vSE/q7o90vrg9/oO7YHmZVCAp50I02qGuMcRmo19wi+Eprq+p/mlyt5aonZk/4cWXudId5wm3CkAWx8gkKa+SBgMTu17R0NovoRlB+/y47DgXGSr0KcS4rPh6BZPVjsAowLKfiURvVFMjxWQrFslgoisU6zlFO0aYLnNB0JrG3BPAb5DGUD8pXhVa6Dw4MF1vsEIQRdZhuEaKvr+mK783i1jic77Z4CehVMqXEOB6VX6jyPu89yng41e+thbjL6bf5FU9LYiIMLhMxaec8Tib06iZoZTFZrbATrY2SusVvMXTay3lKw6T1r9EG70sgaCFlF8x4txsHPXg6TUySm/2FixCJCtlSb4pNLnNsItWIiV+X1fVEXSdZQOlMu/MFz9ZblMC9ql9QmO+B1+PupM+lkh7LV/eiXocidbsC4wLSywz9JlCyWMWfq52kOFSlys8NXFM+9SZGFKrC71qwwm+AeE3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(41300700001)(8936002)(2906002)(5660300002)(54906003)(71200400001)(64756008)(316002)(36756003)(76116006)(66446008)(6486002)(66476007)(66556008)(91956017)(66946007)(4326008)(8676002)(6916009)(86362001)(33656002)(966005)(2616005)(478600001)(186003)(38070700005)(6506007)(122000001)(38100700002)(26005)(83380400001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <51F12D386EEC784D905507384D503834@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9478
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc4a07b8-6c15-4aef-e031-08dab6719207
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iJErACIEAN4e4yGqG1zCrVo5KGQQxZPMuI5GfVe8X1GqgLQU6AQoPiNwuR5xSRCWCAY4M7l0qhrC8iz0MoeDxzD0LjMwWNz61B6Czlu58PZSG9aGV78Ju5Y3Zmr4exOnvj/pZLLLCud0E1TT5yuJDzlrOElBrjTAHarL98QW3qXP3cu2SkQCfudTRRLHAi0x4O+FxmP+g/1/nzLFyCYEaorKOMyEh8qcLT78Mk0skwUKWAAHJ1kCYAS+i7R4BvIkKONqT2pF1VELTbXpk3IGrhahzR+O2q523gzB1KFc6sMsfL+DqArJmpPevvh3t6ICEDI2H8DpmGUVXgranvmby973Rx5m7ZGKgIcDntptxIYkr8uW61kCZQ8BK808GDG+ajYvjGKs2tSRHmSh8o3+OqN+qFuX43x8kJHSlXWhSLPwic60Kf2Gom7xb3nr68RR3O5/lb6KlT4iC8YBUBLj+hwpKffw7GD9WmyCym/oxPLXhrBBy7woc9y4t2mQoVRCxTNvXpRy6ODxjr8NVwylO1EP8TxezDxYKEW0AlsYKed8EWYU9WTASVrP8LXGJN30hvej9A3iBYroqaG9iY/btHZ/balVlLYuGgH45UPnWStGTB9YMYQChBw9Zc5rN+qdm7BS0D+1mEqE75E7ZbP/igrOT6bwO4HPphGGN6cotlN7UiW5ACMNlxhCyvbL3ljVRy2cnQxXnq3T62UJM2bVw8upgFEyfuGvs4GJyfwLW0Dw0D3H7blNVuMffi5P/QD+vwopkH/LoK3hGfzBW4V1BbfkQW7xNNVxgr8mHU5u0Cy4cRvV8L1a6R3ATorNU9aX/VANkc/Hu+VvG8rf4Vj9qw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(40480700001)(33656002)(47076005)(54906003)(6916009)(5660300002)(41300700001)(36756003)(107886003)(40460700003)(26005)(8936002)(6512007)(336012)(316002)(36860700001)(70206006)(2906002)(4326008)(8676002)(186003)(6506007)(82310400005)(70586007)(2616005)(81166007)(356005)(966005)(6486002)(83380400001)(86362001)(82740400003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 10:13:47.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62113d1b-a306-4dcd-fb02-08dab6719b31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8877

SGkgYWxsLA0KDQpUaGlzIGlzIHRoZSBWMiBvZiB0aGUgcHJvcG9zYWwgZm9yIGRldmlhdGlvbnMg
dGFnZ2luZyBpbiB0aGUgWGVuIGNvZGViYXNlLCB0aGlzIGluY2x1ZGVzDQphbGwgdGhlIGZlZWRi
YWNrcyBmcm9tIHRoZSBGdVNhIHNlc3Npb24gaGVsZCBhdCB0aGUgWGVuIFN1bW1pdCAyMDIyIGFu
ZCBhbGwgdGhlDQpmZWVkYmFja3MgcmVjZWl2ZWQgaW4gdGhlIHByZXZpb3VzIHByb3Bvc2FsIHNl
bnQgb24gdGhlIG1haWxpbmcgbGlzdC4NCg0KSGVyZSBhIGxpbmsgdG8gdGhlIHByZXZpb3VzIHRo
cmVhZDogDQpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMjItMTAvbXNnMDA1NDEuaHRtbA0KDQpEb2N1bWVudGluZyB2aW9sYXRpb25zDQo9PT09
PT09PT09PT09PT09PT09PT09DQoNClN0YXRpYyBhbmFseXNlcnMgYXJlIHVzZWQgb24gdGhlIFhl
biBjb2RlYmFzZSBmb3IgYm90aCBzdGF0aWMgYW5hbHlzaXMgYW5kIE1JU1JBDQpjb21wbGlhbmNl
Lg0KVGhlcmUgbWlnaHQgYmUgdGhlIG5lZWQgdG8gc3VwcHJlc3Mgc29tZSBmaW5kaW5ncyBpbnN0
ZWFkIG9mIGZpeGluZyB0aGVtIGFuZA0KbWFueSB0b29scyBwZXJtaXQgdGhlIHVzYWdlIG9mIGlu
LWNvZGUgY29tbWVudHMgdGhhdCBzdXBwcmVzcyBmaW5kaW5ncyBzbyB0aGF0DQp0aGV5IGFyZSBu
b3Qgc2hvd24gaW4gdGhlIGZpbmFsIHJlcG9ydC4NCg0KWGVuIHdpbGwgaW5jbHVkZSBhIHRvb2wg
Y2FwYWJsZSBvZiB0cmFuc2xhdGluZyBhIHNwZWNpZmljIGNvbW1lbnQgdXNlZCBpbiBpdHMNCmNv
ZGViYXNlIHRvIHRoZSByaWdodCBwcm9wcmlldGFyeSBpbi1jb2RlIGNvbW1lbnQgdW5kZXJzdGFu
ZGFibGUgYnkgdGhlIHNlbGVjdGVkDQphbmFseXNlciB0aGF0IHN1cHByZXNzIGl0cyBmaW5kaW5n
Lg0KDQpJbiB0aGUgWGVuIGNvZGViYXNlLCB0aGVzZSB0YWdzIHdpbGwgYmUgdXNlZCB0byBkb2N1
bWVudCBhbmQgc3VwcHJlc3MgZmluZGluZ3M6DQoNCi0gU0FGLVgtc2FmZTogVGhpcyB0YWcgbWVh
bnMgdGhhdCB0aGUgbmV4dCBsaW5lIG9mIGNvZGUgY29udGFpbnMgYSBmaW5kaW5nLCBidXQNCiB0
aGUgbm9uIGNvbXBsaWFuY2UgdG8gdGhlIGNoZWNrZXIgaXMgYW5hbHlzZWQgYW5kIGRlbW9uc3Ry
YXRlZCB0byBiZSBzYWZlLg0KLSBTQUYtWC1mYWxzZS1wb3NpdGl2ZS08dG9vbD46IFRoaXMgdGFn
IG1lYW5zIHRoYXQgdGhlIG5leHQgbGluZSBvZiBjb2RlIGNvbnRhaW5zIGENCiBmaW5kaW5nLCBi
dXQgdGhlIGZpbmRpbmcgaXMgYSBidWcgb2YgdGhlIHRvb2wuDQoNClNBRiBzdGFuZHMgZm9yIFN0
YXRpYyBBbmFseXNlciBGaW5kaW5nLCB0aGUgWCBpcyBhIHBsYWNlaG9sZGVyIGZvciBhIHBvc2l0
aXZlDQpudW1iZXIsIHRoZSBudW1iZXIgYWZ0ZXIgU0FGLSBzaGFsbCBiZSBpbmNyZW1lbnRhbCBh
bmQgdW5pcXVlLCBiYXNlIHRlbg0Kbm90YXRpb24gYW5kIHdpdGhvdXQgbGVhZGluZyB6ZXJvcy4N
Cg0KRW50cmllcyBpbiB0aGUgZGF0YWJhc2Ugc2hvdWxkIG5ldmVyIGJlIHJlbW92ZWQsIGV2ZW4g
aWYgdGhleSBhcmUgbm90IHVzZWQNCmFueW1vcmUgaW4gdGhlIGNvZGUgKGlmIGEgcGF0Y2ggaXMg
cmVtb3Zpbmcgb3IgbW9kaWZ5aW5nIHRoZSBmYXVsdHkgbGluZSkuDQpUaGlzIGlzIHRvIG1ha2Ug
c3VyZSB0aGF0IG51bWJlcnMgYXJlIG5vdCByZXVzZWQgd2hpY2ggY291bGQgbGVhZCB0byBjb25m
bGljdHMNCndpdGggb2xkIGJyYW5jaGVzIG9yIG1pc2xlYWRpbmcganVzdGlmaWNhdGlvbnMuDQoN
CkFuIGVudHJ5IGNhbiBiZSByZXVzZWQgaW4gbXVsdGlwbGUgcGxhY2VzIGluIHRoZSBjb2RlIHRv
IHN1cHByZXNzIGEgZmluZGluZyBpZg0KYW5kIG9ubHkgaWYgdGhlIGp1c3RpZmljYXRpb24gaG9s
ZHMgZm9yIHRoZSBzYW1lIG5vbi1jb21wbGlhbmNlIHRvIHRoZSBjb2RpbmcNCnN0YW5kYXJkLg0K
DQpBbiBvcnBoYW4gZW50cnksIHRoYXQgaXMgYW4gZW50cnkgd2hvIHdhcyBqdXN0aWZ5aW5nIGEg
ZmluZGluZyBpbiB0aGUgY29kZSwgYnV0IGxhdGVyDQp0aGF0IGNvZGUgd2FzIHJlbW92ZWQgYW5k
IHRoZXJlIGlzIG5vIG90aGVyIHVzZSBvZiB0aGF0IGVudHJ5IGluIHRoZSBjb2RlLCBjYW4gYmUN
CnJldXNlZCBhcyBsb25nIGFzIHRoZSBqdXN0aWZpY2F0aW9uIGZvciB0aGUgZmluZGluZyBob2xk
cy4gVGhpcyBpcyBkb25lIHRvIGF2b2lkIHRoZQ0KYWxsb2NhdGlvbiBvZiBhIG5ldyBlbnRyeSB3
aXRoIGV4YWN0bHkgdGhlIHNhbWUganVzdGlmaWNhdGlvbiwgdGhhdCB3b3VsZCBsZWFkIHRvIHdh
c3RlDQpvZiBzcGFjZSBhbmQgbWFpbnRlbmFuY2UgaXNzdWVzIG9mIHRoZSBkYXRhYmFzZS4NCg0K
VGhlIGZpbGVzIHdoZXJlIHRvIHN0b3JlIGFsbCB0aGUganVzdGlmaWNhdGlvbnMgYXJlIGluIHhl
bi9kb2NzL21pc3JhLyBhbmQgYXJlDQpuYW1lZCBhcyBzYWZlLmpzb24gYW5kIGZhbHNlLXBvc2l0
aXZlLTx0b29sPi5qc29uLCB0aGV5IGhhdmUgSlNPTiBmb3JtYXQsIGVudHJpZXMNCm9mIHRoZXNl
IGZpbGVzIGhhdmUgaW5kZXBlbmRlbnQgSUQgbnVtYmVyaW5nLg0KDQpIZXJlIGlzIGFuIGV4YW1w
bGUgdG8gYWRkIGEgbmV3IGp1c3RpZmljYXRpb24gaW4gc2FmZS5qc29uOjoNCg0KfHsNCnwgICAg
InZlcnNpb24iOiAiMS4wIiwNCnwgICAgImNvbnRlbnQiOiBbDQp8ICAgICAgICB7DQp8ICAgICAg
ICAgICAgImlkIjoiU0FGLTAtc2FmZSIsDQp8ICAgICAgICAgICAgImFuYWx5c2VyIjogew0KfCAg
ICAgICAgICAgICAgICAiY3BwY2hlY2siOiAibWlzcmEtYzIwMTItMjAuNyIsDQp8ICAgICAgICAg
ICAgICAgICJjb3Zlcml0eSI6ICJtaXNyYV9jXzIwMTJfcnVsZV8yMF83X3Zpb2xhdGlvbiIsDQp8
ICAgICAgICAgICAgICAgICJlY2xhaXIiOiAiTUMzUjEuUjIwLjciDQp8ICAgICAgICAgICAgfSwN
CnwgICAgICAgICAgICAibmFtZSI6IOKAnFIyMC43IEMgbWFjcm8gcGFyYW1ldGVycyBub3QgdXNl
ZCBhcyBleHByZXNzaW9uIiwNCnwgICAgICAgICAgICAidGV4dCI6ICJUaGUgbWFjcm8gcGFyYW1l
dGVycyB1c2VkIGluIHRoaXMgW+KApl0iDQp8ICAgICAgICB9LA0KfCAgICAgICAgew0KfCAgICAg
ICAgICAgICJpZCI64oCdU0FGLTEtc2FmZSIsDQp8ICAgICAgICAgICAgImFuYWx5c2VyIjogew0K
fCAgICAgICAgICAgICAgICAiY3BwY2hlY2siOiAidW5yZWFkVmFyaWFibGUiLA0KfCAgICAgICAg
ICAgICAgICAiY292ZXJpdHkiOiAiVU5VU0VEX1ZBTFVFIg0KfCAgICAgICAgICAgIH0sDQp8ICAg
ICAgICAgICAgIm5hbWUiOiDigJxWYXJpYWJsZSBzZXQgYnV0IG5vdCB1c2VkIiwNCnwgICAgICAg
ICAgICAidGV4dCI6IOKAnEl0IGlzIHNhZmUgYmVjYXVzZSBb4oCmXSINCnwgICAgICAgIH0sDQp8
ICAgICAgICB7DQp8ICAgICAgICAgICAgImlkIjrigJ1TQUYtMi1zYWZlIiwNCnwgICAgICAgICAg
ICAiYW5hbHlzZXIiOiB7fSwNCnwgICAgICAgICAgICAibmFtZSI6ICJTZW50aW5lbCIsDQp8ICAg
ICAgICAgICAgInRleHQiOiAiIg0KfCAgICAgICAgfQ0KfCAgICBdDQp8fQ0KDQpIZXJlIGlzIGFu
IGV4YW1wbGUgdG8gYWRkIGEgbmV3IGp1c3RpZmljYXRpb24gaW4gZmFsc2UtcG9zaXRpdmUtY3Bw
Y2hlY2suanNvbjo6DQoNCnx7DQp8ICAgICJ2ZXJzaW9uIjogIjEuMCIsDQp8ICAgICJjb250ZW50
IjogWw0KfCAgICAgICAgew0KfCAgICAgICAgICAgICJpZCI6IlNBRi0wLWZhbHNlLXBvc2l0aXZl
LWNwcGNoZWNrIiwNCnwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQp8ICAgICAgICAgICAgICAg
ICJjcHBjaGVjayI6ICJtaXNyYS1jMjAxMi0yMC43Ig0KfCAgICAgICAgICAgIH0sDQp8ICAgICAg
ICAgICAg4oCcdG9vbC12ZXJzaW9u4oCdOiDigJwyLjciLA0KfCAgICAgICAgICAgICJuYW1lIjog
4oCcUjIwLjcgc2Vjb25kIG9wZXJhbmQgb2YgbWVtYmVyLWFjY2VzcyBvcGVyYXRvciIsDQp8ICAg
ICAgICAgICAgInRleHQiOiAiVGhlIHNlY29uZCBvcGVyYW5kIG9mIGEgbWVtYmVyIGFjY2VzcyBv
cGVyYXRvciBzaGFsbCBiZSBhIG5hbWUgb2YgYSBtZW1iZXIgb2YgdGhlIHR5cGUgcG9pbnRlZCB0
bywgc28gaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgaXQgaXMgd3JvbmcgdG8gdXNlIHBhcmVudGhl
c2VzIG9uIHRoZSBtYWNybyBwYXJhbWV0ZXIuIg0KfCAgICAgICAgfSwNCnwgICAgICAgIHsNCnwg
ICAgICAgICAgICAiaWQiOuKAnVNBRi0xLWZhbHNlLXBvc2l0aXZlLWNwcGNoZWNrIiwNCnwgICAg
ICAgICAgICAiYW5hbHlzZXIiOiB7fSwNCnwgICAgICAgICAgICDigJx0b29sLXZlcnNpb27igJ06
IOKAnCIsDQp8ICAgICAgICAgICAgIm5hbWUiOiAiU2VudGluZWwiLA0KfCAgICAgICAgICAgICJ0
ZXh0IjogIiINCnwgICAgICAgIH0NCnwgICAgXQ0KfH0NCg0KVG8gZG9jdW1lbnQgYSBmaW5kaW5n
LCBqdXN0IGFkZCBhbm90aGVyIGJsb2NrIHtbLi4uXX0gYmVmb3JlIHRoZSBzZW50aW5lbCBibG9j
aywNCnVzaW5nIHRoZSBpZCBjb250YWluZWQgaW4gdGhlIHNlbnRpbmVsIGJsb2NrIGFuZCBpbmNy
ZW1lbnQgYnkgb25lIHRoZSBudW1iZXINCmNvbnRhaW5lZCBpbiB0aGUgaWQgb2YgdGhlIHNlbnRp
bmVsIGJsb2NrLg0KDQpIZXJlIGEgYnJpZWYgZXhwbGFuYXRpb24gb2YgdGhlIGZpZWxkIGluc2lk
ZSBhbiBvYmplY3Qgb2YgdGhlICJjb250ZW50IiBhcnJheToNCi0gaWQ6IGl0IGlzIGEgdW5pcXVl
IHN0cmluZyB0aGF0IGlzIHVzZWQgdG8gcmVmZXIgdG8gdGhlIGZpbmRpbmcsIG1hbnkgZmluZGlu
Zw0KIGNhbiBiZSB0YWdnZWQgd2l0aCB0aGUgc2FtZSBpZCwgaWYgdGhlIGp1c3RpZmljYXRpb24g
aG9sZHMgZm9yIGFueSBhcHBsaWVkDQogY2FzZS4NCiBJdCB0ZWxscyB0aGUgdG9vbCB0byBzdWJz
dGl0dXRlIGEgWGVuIGluLWNvZGUgY29tbWVudCBoYXZpbmcgdGhpcyBzdHJ1Y3R1cmU6DQogLyog
U0FGLTAtc2FmZSBbLi4uXSBcKi8NCi0gYW5hbHlzZXI6IGl0IGlzIGFuIG9iamVjdCBjb250YWlu
aW5nIHBhaXIgb2Yga2V5LXZhbHVlIHN0cmluZ3MsIHRoZSBrZXkgaXMNCiB0aGUgYW5hbHlzZXIs
IHNvIGl0IGNhbiBiZSBjcHBjaGVjaywgY292ZXJpdHkgb3IgZWNsYWlyLiBUaGUgdmFsdWUgaXMg
dGhlDQogcHJvcHJpZXRhcnkgaWQgY29ycmVzcG9uZGluZyBvbiB0aGUgZmluZGluZywgZm9yIGV4
YW1wbGUgd2hlbiBjb3Zlcml0eSBpcw0KIHVzZWQgYXMgYW5hbHlzZXIsIHRoZSB0b29sIHdpbGwg
dHJhbnNsYXRlIHRoZSBYZW4gaW4tY29kZSBjb21lbnQgaW4gdGhpcyB3YXk6DQogLyogU0FGLTAt
c2FmZSBbLi4uXSBcKi8gLT4gLyogY292ZXJpdHlbY292ZXJpdHktaWRdIFwqLw0KIGlmIHRoZSBv
YmplY3QgZG9lc24ndCBoYXZlIGEga2V5LXZhbHVlLCB0aGVuIHRoZSBjb3JyZXNwb25kaW5nIGlu
LWNvZGUNCiBjb21tZW50IHdvbid0IGJlIHRyYW5zbGF0ZWQuDQotIG5hbWU6IGEgc2ltcGxlIG5h
bWUgZm9yIHRoZSBmaW5kaW5nDQotIHRleHQ6IGEgcHJvcGVyIGp1c3RpZmljYXRpb24gdG8gdHVy
biBvZmYgdGhlIGZpbmRpbmcuDQoNCg0KDQpIZXJlIGFuIGV4YW1wbGUgb2YgdGhlIHVzYWdlIG9m
IHRoZSBpbi1jb2RlIGNvbW1lbnQgdGFncyB0byBzdXBwcmVzcyBhIGZpbmRpbmcgZm9yIHRoZSBS
dWxlIDguNjoNCg0KRWNsYWlyIHJlcG9ydHMgaXQgaGVyZToNCmh0dHBzOi8vZWNsYWlyaXQuY29t
OjM3ODcvZnMvdmFyL2xpYi9qZW5raW5zL2pvYnMvWEVOL2NvbmZpZ3VyYXRpb25zL2F4aXMtVGFy
Z2V0L0FSTTY0L2F4aXMtYWdlbnQvcHVibGljL2J1aWxkcy81NDkvYXJjaGl2ZS9FQ0xBSVIvb3V0
L1BST0pFQ1QuZWNkOy9zb3VyY2VzL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaC5odG1sI1I1MDc0
M18xDQoNCkFsc28gY292ZXJpdHkgcmVwb3J0cyBpdCwgaGVyZSBhbiBleHRyYWN0IG9mIHRoZSBm
aW5kaW5nOg0KDQp4ZW4vaW5jbHVkZS94ZW4va2VybmVsLmg6Njg6DQogMS4gbWlzcmFfY18yMDEy
X3J1bGVfOF82X3Zpb2xhdGlvbjogRnVuY3Rpb24gIl9zdGFydCIgaXMgZGVjbGFyZWQgYnV0IG5l
dmVyIGRlZmluZWQuDQoNClRoZSBhbmFseXNlcnMgYXJlIGNvbXBsYWluaW5nIGJlY2F1c2Ugd2Ug
aGF2ZSB0aGlzIGluIHhlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaCBhdCBsaW5lIDY4Og0KDQpleHRl
cm4gY2hhciBfc3RhcnRbXSwgX2VuZFtdLCBzdGFydFtdOw0KDQpUaG9zZSBhcmUgc3ltYm9scyBl
eHBvcnRlZCBieSB0aGUgbGlua2VyLCBoZW5jZSB3ZSB3aWxsIG5lZWQgdG8gaGF2ZSBhIHByb3Bl
ciBkZXZpYXRpb24gZm9yIHRoaXMgZmluZGluZy4NCg0KV2Ugd2lsbCBwcmVwYXJlIG91ciBlbnRy
eSBpbiB0aGUgZGF0YWJhc2U6DQoNCnx7DQp8ICAgICJ2ZXJzaW9uIjogIjEuMCIsDQp8ICAgICJj
b250ZW50IjogWw0KfCAgICAgICAgew0KfCAgICAgICAgW+KApl0NCnwgICAgICAgIH0sDQp8ICAg
ICAgICB7DQp8ICAgICAgICAgICAgImlkIjrigJ1TQUYtMS1zYWZlIiwNCnwgICAgICAgICAgICAi
YW5hbHlzZXIiOiB7DQp8ICAgICAgICAgICAgICAgIOKAnGVjbGFpciI6ICJNQzNSMS5SOC42IiwN
CnwgICAgICAgICAgICAgICAgImNvdmVyaXR5IjogIm1pc3JhX2NfMjAxMl9ydWxlXzhfNl92aW9s
YXRpb24iDQp8ICAgICAgICAgICAgfSwNCnwgICAgICAgICAgICAibmFtZSI6IOKAnFJ1bGUgOC42
OiBsaW5rZXIgZGVmaW5lZCBzeW1ib2xzIiwNCnwgICAgICAgICAgICAidGV4dCI6IOKAnEl0IGlz
IHNhZmUgdG8gZGVjbGFyZSB0aGlzIHN5bWJvbCBiZWNhdXNlIGl0IGlzIGRlZmluZWQgaW4gdGhl
IGxpbmtlciBzY3JpcHQuIg0KfCAgICAgICAgfSwNCnwgICAgICAgIHsNCnwgICAgICAgICAgICAi
aWQiOuKAnVNBRi0yLXNhZmUiLA0KfCAgICAgICAgICAgICJhbmFseXNlciI6IHt9LA0KfCAgICAg
ICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCnwgICAgICAgICAgICAidGV4dCI6ICIiDQp8ICAg
ICAgICB9DQp8ICAgIF0NCnx9DQoNCkFuZCB3ZSB3aWxsIHVzZSB0aGUgcHJvcGVyIHRhZyBhYm92
ZSB0aGUgdmlvbGF0aW9uIGxpbmU6DQoNCi8qIFNBRi0xLXNhZmUgW29wdGlvbmFsIHRleHRdICov
DQpleHRlcm4gY2hhciBfc3RhcnRbXSwgX2VuZFtdLCBzdGFydFtdOw0KDQpUaGlzIGVudHJ5IHdp
bGwgZml4IGFsc28gdGhlIHZpb2xhdGlvbiBvbiBfZW5kIGFuZCBzdGFydCwgYmVjYXVzZSB0aGV5
IGFyZSBvbiB0aGUgc2FtZSBsaW5lIGFuZCB0aGUNCnNhbWUg4oCcdmlvbGF0aW9uIElE4oCdLg0K
DQpBbHNvLCB0aGUgc2FtZSB0YWcgY2FuIGJlIHVzZWQgb24gb3RoZXIgc3ltYm9scyBmcm9tIHRo
ZSBsaW5rZXIgdGhhdCBhcmUgZGVjbGFyZWQgaW4gdGhlIGNvZGViYXNlLA0KYmVjYXVzZSB0aGUg
anVzdGlmaWNhdGlvbiBob2xkcyBmb3IgdGhlbSB0b28uDQoNCkNoZWVycywNCkx1Y2E=

