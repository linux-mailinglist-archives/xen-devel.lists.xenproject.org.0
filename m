Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9520D5A9370
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396474.636625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgiV-0007Ay-Eu; Thu, 01 Sep 2022 09:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396474.636625; Thu, 01 Sep 2022 09:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgiV-00077w-CI; Thu, 01 Sep 2022 09:42:31 +0000
Received: by outflank-mailman (input) for mailman id 396474;
 Thu, 01 Sep 2022 09:42:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oTgiT-00077q-7g
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:42:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2077.outbound.protection.outlook.com [40.107.249.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63452bca-29da-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:42:26 +0200 (CEST)
Received: from AS8PR07CA0019.eurprd07.prod.outlook.com (2603:10a6:20b:451::22)
 by PAXPR08MB7600.eurprd08.prod.outlook.com (2603:10a6:102:23f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 09:42:25 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::f7) by AS8PR07CA0019.outlook.office365.com
 (2603:10a6:20b:451::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Thu, 1 Sep 2022 09:42:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 09:42:24 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 01 Sep 2022 09:42:24 +0000
Received: from 8b44bbbf7f09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B14819AC-857A-4A1A-B049-736249AF02D6.1; 
 Thu, 01 Sep 2022 09:42:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b44bbbf7f09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 09:42:18 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by AS8PR08MB7353.eurprd08.prod.outlook.com (2603:10a6:20b:444::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 09:42:16 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::d117:77a3:a165:3f55]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::d117:77a3:a165:3f55%6]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 09:42:16 +0000
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
X-Inumbo-ID: 63452bca-29da-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mLK1n+CkX5UHB8V5xtGetzNIGH/8uny58r8EwcP0UgI0GHoLP8OuFgJH0MbvYX93iPjpNb+NlfvlSOIJVVMKRMqCyyLu/UMUuzvfV4zGs3HetYypp/MOatxuhi+TCjuH+HNw91nY/86iI2/pymudQa+Ze1cBZ76jWH/++71cWKiXMyAPtjr1i2AjBo02Qkzab+i2XHcOPx5Tv6mKWeuQTKyVv4+OaluyzwjTh4KAdk4e4D2vt806EXWcqJz+2yX0CupRKhdvzwTFPEfLcJ+e7t29Vl2TNmdYDmnJZpW5qOWA6hbKikPfkntV0LJ4im08K6VTyBoeGE/HPBOpyyW2TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LLaCUrt0QG9kCv8fRk4i1lSMJzVY0LYIkNk2W+pauY=;
 b=Zy4W0j9i6kt0g3OcABPXyQht1SeI4ivSGJLHl/okfjlk9PHc/dtK6Uf/z/C5Jd9SadFV/gMiMFNJNph7Fk36d4BzdnPPoc11eVP1vdqX/kKYcJc6kZEC1Tum+DXx0GcciQMsi/FiCQHkk8bhvAdMXWTyr4Hn2axCer7G5htlnU+CLfYYhzXKQSBXtTCe9oc0dNhOCEyz1RR/FWI53zXS8lPpDPDWhiaZGtP3tzzqvMJAtDVkJ5klncals1s1lNqp+3alhFmokqdZCj5YX+EJ5eHhWK3XyWv0t90b3lRatD1Iv2hh/MoYzi6Uq+zfGv422geip0wE4UqafNvf/V4Mdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LLaCUrt0QG9kCv8fRk4i1lSMJzVY0LYIkNk2W+pauY=;
 b=GIqNfjPr920a0c9b+w8J43QDgnTmXTQB4psAVmiRDU/zQdObyx1nVfKBDSI6q2RNZNkUpqNH2b9MRHM6Fuv7HRczCoqtYqixCV22p5p02IZmQMvyg/jU6ry9ZuzyMAmOOXYA6JFKMnGEBQpHBRAzDkxmC8A+kb5HBoyDv8x6CC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a5a85b6019b9e741
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np1mCD87kkqY1fYeYRhK7OZm/H95Ae+UvK6eH+zwb2TCrNQ5NpJJZZALtKL3+upJ3Z+4TDWhaexYAeYgQ0+zS/wgHUWxWm0lU0BuuMdwpnYgwMBxp3H3lvKYjd6Oqr2Kqs9BUL5H2pGolcT5hG1REfULBGGG2hwakO5qgY8VHMIsaK2QcLVLrMTIiqSK/XKEMW6bN1ZLUd5UeUevvPstmmbGS7rWXadYavlcJYJSZXn5BJzgf6HCiBptj7MvyODEnRR+dN+XbVy7kobtVUE+geeAYnHvHHXsMTRNRfHW9OXna5Tt+giNtZlDjZ/QH25cTW+mdkGIcPFZbUm9okOdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LLaCUrt0QG9kCv8fRk4i1lSMJzVY0LYIkNk2W+pauY=;
 b=RMBRPUF+Tt7yOfv+3mti/ysdqu/E0Pgdz9WSyKRMJ5gzwG+GTHXmjg5BFmdY+y8s3FkJ5aJVwSytqC4LJ+2gDLUC/I3KCxZgIZdd3PDSRQ31PBGqJBu62Seub+k2Xe8hTqqqc+vVbw+ml3sOwOnoM+8u2h5jtQDVudd1lDrMTgYbDCmdTYjnU9kjqtFQkOfkMP3difVSYHkMqy/bsbaP3IF2zLKQR4J0XCASJjQFRfhSsQvNyoOJvziR39MgDhZMDDYtEVFp2/pM1g0GLS1nZxpjg/wgp46fxHN6ZQ+jgRhNY75VlEwcElAj9RkK2MhFC5JDPAwOU9GsoCz4CHxsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LLaCUrt0QG9kCv8fRk4i1lSMJzVY0LYIkNk2W+pauY=;
 b=GIqNfjPr920a0c9b+w8J43QDgnTmXTQB4psAVmiRDU/zQdObyx1nVfKBDSI6q2RNZNkUpqNH2b9MRHM6Fuv7HRczCoqtYqixCV22p5p02IZmQMvyg/jU6ry9ZuzyMAmOOXYA6JFKMnGEBQpHBRAzDkxmC8A+kb5HBoyDv8x6CC8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Stanislav
 Kinsburskii <staskins@amazon.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 2/7] xen/evtchn: Add an helper to reserve/allocate a
 port
Thread-Topic: [PATCH v3 2/7] xen/evtchn: Add an helper to reserve/allocate a
 port
Thread-Index: AQHYveM0KXGt+cb4qkiLnrRR6/y4Sq3KTlcAgAAEH4A=
Date: Thu, 1 Sep 2022 09:42:16 +0000
Message-ID: <3FC2FD6E-3FC5-4311-B65E-9BA846F5B743@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <4f8f5abdb7d9dfb241794375d3705524b5b53490.1662023183.git.rahul.singh@arm.com>
 <bc5ac448-5666-c43f-be06-da9ba1a65336@xen.org>
In-Reply-To: <bc5ac448-5666-c43f-be06-da9ba1a65336@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a564eb11-c000-403e-fbb2-08da8bfe4697
x-ms-traffictypediagnostic:
	AS8PR08MB7353:EE_|VE1EUR03FT049:EE_|PAXPR08MB7600:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MKWNHyb9DBhNyIKqwHwVR7BCljP1RcVwYbvoQKTyq/3qJWOYSuHgNI33vm0MJHnEKkUr3hrKF8V88T9n/4ZQ22tSByoCF0KOHtOgdvjWNR4bhecu1adx30lJlSUDsOmx1SSuxvwNAgnh9/hZRfm776sSsv8ohXhvtqSbMp2YIw1HSc3F9r6z5FezMDdEBXEm4Ene15rJKfpz2MVx8R3TpfLwFimHQUsbZl9oBGMNSe6VR75aMl9ROgcuRCFgXylkFnI/kezhXiEKs0HW/VYcT9zqbXA9rpDJBuaXdNyIWkNR2U2i9a3Bn30UVQavERavAbu8JJ7YSq/KCUCr2s8z0bCDRk1pmFjcq05aig3C6sg9qMtpK5JWfYyvff/2SO38YXSiJkCf3xLM2WbfQFR3CWtJMH7Qn6jyRDAY2laVnIA6/jzUDZOXgPgKhDwUnqAOw7/wNdKWYwhJnuE0vLwFT7oFhdn8yOFakjKg7AySmIKsYnOjhuyXhldZEA7jvAJlCa8ykmpklHJ/Hfo6e79SVxMjQwKl+EH2vSMlmSQyqrWBK/iu9I+qD2aHJm4G/UpWF0/ni8NUbTBnsrPZL3zpkFh6DC2wvNLrtiyneKpUHQtCTqogPEQ4hn50q25k1Dgmxg/g5iZIokM58aM1CIcEBi1tmfmcdbigOvsabkfoz1gZG5Of+vQLAkBvzrGANYGPFfRh57w7LeyDoK6LZht+jahGN+xQGP9PxKj+Abqb/m7p5zPbSjqiQfNVYVb+oI2LFS5f3sZzsguxxvy2fZxGPvshL3UeE9A2Pcnw+3eiyhM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(2616005)(86362001)(186003)(4744005)(8936002)(5660300002)(41300700001)(33656002)(6512007)(2906002)(53546011)(6506007)(26005)(38070700005)(38100700002)(83380400001)(122000001)(36756003)(91956017)(54906003)(478600001)(76116006)(6916009)(6486002)(66556008)(66946007)(316002)(66476007)(8676002)(4326008)(66446008)(64756008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CABDB1DE7469BE449C832B6FDBFBDEB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7353
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	841fb04e-0bf5-46ed-d071-08da8bfe418f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z6o/P83a5pNtlFKG44tG0K/mhPQEOC4GyNhaYpWKbl8eKAjgzszRq350WmbCIZfM631cpxeAlmG8oxbEzFZuFZx+8a+dCnYkIgRgdQ+6Da4QFIDa5lteBItheV8DdlGJoiA4CQ1lrZfQTtmKlICb4UQCHG1nmZjLt/WzEu4uiGcyuFAyKHLXNFFP9+BOrg5anuxYCfjfJGc/vg/kOHSoINXNwUrw6007sMqwTUWgdP3m8sQJXiHH4cHsAkEUEUC93MaFhrrLi9aZ9AVKmL9j5gE59nqgzNbt3Oo8Zi3/6ASUV0fpg888yEoPvDCEPUZIQEQbG3g1XbccDDJUA7/+3eFBJUoZSbYLg7EyZBe6rR1awBACTDjYkm4zr5AJVlgIm0yBzyGj5p1LT0k9sbGOQDmFZbyxlCY94mULeIshIPpZ221GXVJFgoH1j9TYax/VVzstFNsX4vO3R0Hw46pcqUwUsR21d/HAM5EyMoeJEJ6fNuxteJJzjSNTAWHqFEoMmQrWRlIK5On14DUVre8eluLKrtxFZie+jB6U3nPS83oBHpFOuU1/C++YSRsAmcKeZ9BQZLKr4MNLtOQ0LOZAZrMCaqdzc+KzXGZJP5L4rJ5kc9EcICYbHkeQJZbr1t0b4YybgUiADaordpL+nwC0jDZnNiR56HzqpcCjqOvZENtxGbLuNSAYtCGtCu4TLYEG6+ZE8JjChe5zpTHDE0g+dZY0mMhPRNtxWPjsmkV4piUhBx2ejwtlW5sBwPF/OVFLkUEYOpVtiyUzt07w4s4KcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(36756003)(6486002)(86362001)(82740400003)(6862004)(4744005)(8936002)(54906003)(478600001)(41300700001)(5660300002)(70586007)(70206006)(316002)(8676002)(4326008)(33656002)(107886003)(81166007)(2616005)(40460700003)(40480700001)(356005)(82310400005)(47076005)(26005)(83380400001)(36860700001)(6512007)(53546011)(6506007)(2906002)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 09:42:24.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a564eb11-c000-403e-fbb2-08da8bfe4697
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7600

SGkgSnVsaWVuLA0KDQo+IE9uIDEgU2VwIDIwMjIsIGF0IDEwOjI3IGFtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMDEvMDkv
MjAyMiAxMDoxMywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBJbiBhIGZvbGxvdy11cCBwYXRjaCB3
ZSB3aWxsIHdhbnQgdG8gZWl0aGVyIHJlc2VydmUgb3IgYWxsb2NhdGUgYSBwb3J0DQo+PiBmb3Ig
dmFyaW91cyBldmVudCBjaGFubmVsIGhlbHBlcnMuDQo+PiBBIG5ldyB3cmFwcGVyIGlzIGludHJv
ZHVjZWQgdG8gZWl0aGVyIHJlc2VydmUgYSBnaXZlbiBwb3J0IG9yIGFsbG9jYXRlDQo+PiBhIGZy
ZXNoIG9uZSBpZiB6ZXJvLg0KPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVwbGFjZSB0aGUg
b3Blbi1jb2RlZCB2ZXJzaW9uIGluDQo+PiBldnRjaG5fYmluZF92aXJxKCkuDQo+PiBTaWduZWQt
b2ZmLWJ5OiBTdGFuaXNsYXYgS2luc2J1cnNraWkgPHN0YXNraW5zQGFtYXpvbi5jb20+DQo+IA0K
PiBVc3VhbGx5LCB0aGUgIkZyb206IiBtYXRjaCB0aGUgZmlyc3Qgc2lnbmVkLW9mZi1ieS4gVGhp
cyBpcyBub3QgdGhlIGNhc2UgaGVyZS4gQ2FuIHlvdSBjbGFyaWZ5IHdoZXRoZXIgeW91IGVmZmVj
dGl2ZWx5IHJld3JpdGUgdGhlIHBhdGNoIG9yIHNpbXBseSB0b29rIGl0Pw0KDQpJIGp1c3QgdG9v
ayB0aGUgcGF0Y2ggd2l0aCBzbWFsbCBjaGFuZ2VzLg0KPiANCj4gSWYgdGhlIGZvcm1lciwgdGhl
biBJIHdvdWxkIHN1Z2dlc3QgdG8gd3JpdGU6ICJCYXNlZCBvbiAuLi4iDQo+IElmIHRoZSBsYXR0
ZXIsIHRoZW4gcGxlYXNlIHVwZGF0ZSB0aGUgIkZyb206Ii4NCg0KT2suIEkgd2lsbCB1cGRhdGUg
dGhlIOKAnEZyb2064oCdDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

