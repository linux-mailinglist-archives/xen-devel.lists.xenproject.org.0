Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D14525001
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327779.550662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9ql-0007ag-Ig; Thu, 12 May 2022 14:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327779.550662; Thu, 12 May 2022 14:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9ql-0007XZ-F0; Thu, 12 May 2022 14:31:31 +0000
Received: by outflank-mailman (input) for mailman id 327779;
 Thu, 12 May 2022 14:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wFL=VU=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1np9qj-0007XT-Ue
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:31:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e972c0b-d200-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 16:31:16 +0200 (CEST)
Received: from DB9PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:10:1db::28)
 by DB7PR08MB3417.eurprd08.prod.outlook.com (2603:10a6:10:44::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 14:31:25 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::2e) by DB9PR06CA0023.outlook.office365.com
 (2603:10a6:10:1db::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Thu, 12 May 2022 14:31:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 14:31:25 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Thu, 12 May 2022 14:31:25 +0000
Received: from 29e502b8cef8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E833AE8-286A-4953-B096-A85D6F103B24.1; 
 Thu, 12 May 2022 14:31:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29e502b8cef8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 May 2022 14:31:17 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.21; Thu, 12 May 2022 14:31:15 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 14:31:15 +0000
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
X-Inumbo-ID: 2e972c0b-d200-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RlOdcCloSCOjoOou6THH8zoA1iFs9Di3n9xSllMk8j+UkV9WVcDOAoDouqdqnlaitJcPngtECXrQhaagThDdiDCXpJ2v5RHl6EAtboo9b4cvtvSRKKMwaxFHDC60Y7pr+0tuBK95W2nBzhglVAVwO1VJWZaghsXH+QCOFdLFcINMLo9JpeldygJzbm4486CP2T4Eqms5tdKx7nOqgJaYYXrnhp1r0ndKEr5vOgu5SfSVOvIQqMD6qZZTeRonVbHmHuDhqSyJJpS4zByHjwL1HXwYNdJPlzf8BPMUx2LYMrUANR/p+ETqV4Yj5LZGR5tjhoeEJkGpOSeKYilYvqnIgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m5ulshnAG3BFpvQEkE8QBtmECw2l2HwJEVbueGS9zg=;
 b=Hqy3N/J3pxQjHDn9qPaw4iwPyJN7MBU2BzkqS/aIUwgwdyZiqe9A8PBNpPV4YiXiozfd1sKraGbdSOCkve3CdivWZhPcTGR4bW+I6p5RXZZEJ4sx+VGlajX/E2Fw/1w77SzjfNQOTrWW5OaDoezcIUQLkb7V2i5vfYlCxuWXCx7S1QkVeUOm3DEB1lg5QX14/0Mq7iTeDFAG6lk+ATLfL/6XcywHEBUHJD7uKIyGx67iQ6zBYdpQF2OR+rFZ8tD1AhwDw8G2CBM6BsXHciQYPcawQqW2W2r55A6ZTb8TC358RqvY9ZK4qx+ivutiQ4p3y2fKBihasOOJ5W6i5k5z8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m5ulshnAG3BFpvQEkE8QBtmECw2l2HwJEVbueGS9zg=;
 b=47LWurY/zdaUREBFIOzK349hy1h6gQj6PY19EKxj2fIX7sptx+z2AGlMrqBJltIlIkA3BYXuE+Zl86EwNBcW3zJp4HT8cHYG2URvWVeyTGi+DvO1LFUvsc/kfNlJokDefLgy41ExsguPcCjgPeXWLLXXWP25hpm1DaR2m/PAenE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 948d3076324b0f9b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHpZMFc4gim3KY3MJ7ANdd3MO4ayKCaxMfTNf0Afzt0uYURH4BLteqhR+Od/uPpYLtOhmbNDgOY2llxZhxCbDGGP8OfBAobwmY1byEl4ktYrO13xSaFqmfYZ38UVkaeMjB4XNykegrztPLjISpR9pTQGr2j7Iz7WjIHLIxkv74yzgjnHrk8R24MO5xstTs63uHrz/ILUA0Csu+a9mlKg/HPdPx/bkcsGuF0ZLy2ZlRWOEkI4WXZ/YMiGsXMKqSUF1NJwfi4ummM+UDcoNzhhFAOq9uuHh7QS+WEKsSEzXp2xbKT0wbZukZzhwH8r5jtQhzxdQ4ekl1dNvPjUhxPMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m5ulshnAG3BFpvQEkE8QBtmECw2l2HwJEVbueGS9zg=;
 b=GlyntnPpMfQfgD0qqWKRrzvC8kpNl4y06KZkSMNr/s1uo3oLBoeoTNQuwKbYoJBqdpYwUf3SHwRAXHKbwcyC0MGGpdNe4N4Q7f9yhVXxnhkmgB/Qhhx1sZldY5DDj8xpaGi05UrUhLyutCuO/zGRiss4klP3y3SH0NMIz6QGCWr3KIYmRqjKjSkRWkXp92mQdmKHjlR+grhnTnWk67wg5KGXRvaZDXqq4gkogpf3JJ1L/3hNGwim9ibwY7+pFkyavb0zpKmM5RcXY6YHU2iOKgYSsSO0OM5ObHujbICrstETzRlWFoguCKWgrtETDdbmuK3B276tsM3Z4PY1YXeLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7m5ulshnAG3BFpvQEkE8QBtmECw2l2HwJEVbueGS9zg=;
 b=47LWurY/zdaUREBFIOzK349hy1h6gQj6PY19EKxj2fIX7sptx+z2AGlMrqBJltIlIkA3BYXuE+Zl86EwNBcW3zJp4HT8cHYG2URvWVeyTGi+DvO1LFUvsc/kfNlJokDefLgy41ExsguPcCjgPeXWLLXXWP25hpm1DaR2m/PAenE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
Thread-Topic: [PATCH v2] xen/evtchn: Add design for static event channel
 signaling
Thread-Index: AQHYX91LOZcKc9ovCE+M72ipF+LMFK0YFGsAgAGzp4CAATSfgIAAXXOA
Date: Thu, 12 May 2022 14:31:15 +0000
Message-ID: <B82F2F0B-9C83-4180-A0A7-E05A1C85A2C1@arm.com>
References:
 <10d83478f116c923271a6c2f7d413f6ec117598d.1651685393.git.rahul.singh@arm.com>
 <cd402709-619f-7189-3d95-fea4ad6bf637@xen.org>
 <A06FC2FB-56CF-4DB6-BF59-7F2CECA0C9D9@arm.com>
 <c072bd96-eede-5c8b-49f4-302600829862@xen.org>
In-Reply-To: <c072bd96-eede-5c8b-49f4-302600829862@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1b48fa47-9862-4e47-7a33-08da34241801
x-ms-traffictypediagnostic:
	VE1PR08MB4846:EE_|DBAEUR03FT043:EE_|DB7PR08MB3417:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB341715BDF10675E44CE3D534FCCB9@DB7PR08MB3417.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dWnOfJb7uTcRiPVZBl5P85on6NJKGVME7HaEFI0EM9Pw5DlQIQp3wjrIZx4Q6K9Clr+lA0oY1jlEM+1jIO16KnUShUcIqCvsVkFv+hAskopQh4hzQCiIB18RnACAcOFzXrhrQIcrOWF40BMLCXSuXCY3DURy3URe1p/xZ7DzPF6l9/G3eO7g3dYkvQM4DI6Thrk4F7x1QxlIjF9N0/xNXldrZi2NxIUWx+wYVUUfMXfuqp3gN2BC67C19/By0Tiw7EEP1asZvM6WPhYx5yvdJLUzqs3JfjYnPy6nFxPSMBuICMjI7O2CMYT4ZJ2YkFbqZ62S3CSqvu8cLszdLxgtWJ0EtiGpQqgUojYBi6VL+fA9aR5q8M5UDV7aqjGWZuCqY7nITdKSp0tgbJz/KII/q8Vkb9yS94SkzcwdpRUDJmSpBIWm7YFGsCo+jtGaVg9Y2/fa2t61QqgWjUEA7iHTTHbxt2tDtBCI7XZ20e3SN6lAyIfMUSpq4/1eRb0leCpFyNpjy8ulbuyyooh26/eYfIz8Mgr3W/yq2bnWV6qal8+wSr3dsWlATq+f544wpD1CvzpKO03yUFgPEkIvThTq0QTggxLVPHJLh1MDyRYUZaCAIVpHZe1NBMZ+2M7jzIDOnrr+AwopsxPjvnYQGRv7WI1PJlqaOpRNhv2bKV48Jr5f3cu6C/acV8bu6pmP3jCVPDsFOpjNWAykZ9/r47Vo8T9AsqydkmLw5H2uCDV9YnHG0S5Uiwk1kj+Tj3NhLT1YjophDOs7yqf/5wL6FhRbc22+P4MwTUAuyGusmAnnotlNH3qdN2wEgLKguD97ZhXngOZ1d9Zd+WQ9DO4gUYUCiQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(86362001)(6506007)(6486002)(8936002)(71200400001)(53546011)(33656002)(2906002)(5660300002)(508600001)(83380400001)(38100700002)(6512007)(26005)(2616005)(38070700005)(122000001)(186003)(316002)(66476007)(66946007)(76116006)(91956017)(54906003)(66556008)(36756003)(6916009)(66446008)(4326008)(8676002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7A9BDEEEBC1E441A5E8576E39DEBAB2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4846
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	061dc5d2-72bf-4ae5-42c1-08da34241236
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I9Ti/A/ZbIUXaqeFSULniu23jb4taUlwspgAXf4RtVeG2QdUqjFDHtOqOAV6bg+XV1b7Vj1uyOHp7/dNKSocBe/UL2supRo9JjP2EgHZnvkiFoFAvCyxDEDxLZIvCRAb4AbvL9dSLqNMJIdKrYwUMfqQ6rQwzMDL/+p+L+lRFRtwMozZZwxiPwk/t7Hd+01BcHVMjxMTh0RiV3M6/ai7Gzpqx/MORRR8K9veceSrSoFu38ZRMVl1yUWY1U9pSOU4GkOcbYr9F+7KQVgFAGfNlnjDXnK9UJ6OxUzGOf1eRdw+cofvxufS5sorDX5cQk5qnO3670DrFZfi4YUDfQuDfcyNuvNLKqpgLHveS2e961Fv32U3GYHFfCB1IufELlBuEHBEOGcX6NRHBJc//M6YUTGtjJOJuGB9O2tFNaN/gnxGe04838mJxIiUxxKz29VGWGBgCWLsGEmMFdN2ExgrpbKDdPqmRkj0XeG0sdrmxqzNoyVWYlUHXhd6V9rWlwnJ3obX6dISa/9rcFa5G/sKxJT5nA23XLrV/Ry/8J2zlysyUN6EjSVY9HkZHX8IYyR0qFc1xVyWrzUh3WjSUBTk0d9ZC9c974QGJlxXBBl21Z4n1MimVoZx2visKLSKnDx+GjAs/fWapQwRQWJTJvlELwjKK8oeTriOtOEMFg1esNMt3XRZApmZEhb5dYqFDxvqQ7SRIuAaJQZgMMBr/wM60+24u4HC9piFaMltLWxwsSvB8EgEXD2e6k5k2dEYLGgNa+e9MfDyJ6gRzKa5ae2KFw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6862004)(4326008)(8676002)(70586007)(70206006)(6512007)(53546011)(6506007)(26005)(81166007)(86362001)(356005)(54906003)(40460700003)(36860700001)(508600001)(316002)(6486002)(966005)(2616005)(336012)(83380400001)(82310400005)(2906002)(47076005)(33656002)(186003)(36756003)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 14:31:25.2407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b48fa47-9862-4e47-7a33-08da34241801
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3417

SGkgSnVsaWVuLA0KDQo+IE9uIDEyIE1heSAyMDIyLCBhdCA5OjU2IGFtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMTEvMDUv
MjAyMiAxNTozMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gMTAgTWF5IDIwMjIsIGF0IDE6
MzIgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+PiArZG9tYWlu
IG1heSB0b2dnbGUgbWFza2VkIGJpdHMgaW4gdGhlIG1hc2tlZCBiaXQgZmllbGQgYW5kIHNob3Vs
ZCBjbGVhciB0aGUNCj4+Pj4gK3BlbmRpbmcgYml0IHdoZW4gYW4gZXZlbnQgaGFzIGJlZW4gcHJv
Y2Vzc2VkDQo+Pj4+ICsNCj4+Pj4gK0V2ZW50cyBhcmUgcmVjZWl2ZWQgYnkgYSBkb21haW4gdmlh
IGFuIGludGVycnVwdCBmcm9tIFhlbiB0byB0aGUgZG9tYWluLA0KPj4+PiAraW5kaWNhdGluZyB3
aGVuIGFuIGV2ZW50IGFycml2ZXMgKHNldHRpbmcgdGhlIGJpdCkuIEZ1cnRoZXIgbm90aWZpY2F0
aW9ucyBhcmUNCj4+Pj4gK2Jsb2NrZWQgdW50aWwgdGhlIGJpdCBpcyBjbGVhcmVkIGFnYWluLiBF
dmVudHMgYXJlIGRlbGl2ZXJlZCBhc3luY2hyb25vdXNseSB0bw0KPj4+PiArYSBkb21haW4gYW5k
IGFyZSBlbnF1ZXVlZCB3aGVuIHRoZSBkb21haW4gaXMgbm90IHJ1bm5pbmcuDQo+Pj4+ICtNb3Jl
IGluZm9ybWF0aW9uIGFib3V0IEZJRk8gYmFzZWQgZXZlbnQgY2hhbm5lbCBjYW4gYmUgZm91bmQg
YXQ6DQo+Pj4gDQo+Pj4gSSB0aGluayB0aGUgZXhwbGFuYXRpb24gaXMgZmluZSBmb3IgYSBkZXNp
Z24gcHJvcG9zYWwuIElmIHlvdSB3YW50IHRvIHVzZSBpdCBhcyBkb2N1bWVudGF0aW9uLCB0aGVu
IEkgd291bGQgc3VnZ2VzdCB0byBjbGFyaWZ5IHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IEFCSSBm
b3IgZXZlbnQgY2hhbm5lbDogRklGTyBhbmQgMkwuDQo+Pj4gDQo+Pj4gMkwgaXMgdGhlIGVhc2ll
c3Qgb25lIHRvIGltcGxlbWVudCBhbmQgZm9yIGVtYmVkZGVkIHdlIG1heSB3YW50IHRvIHN0ZWVy
IHRoZSB1c2VycyB0b3dhcmRzIGl0Lg0KPj4gSSB3aWxsIHJlcGhyYXNlIHRoZSBzZW50ZW5jZSBh
cyBiZWxvdzoNCj4+IFhlbiBzdXBwb3J0cyB0d28gZGlmZmVyZW50IEFCSSBmb3IgZXZlbnQgY2hh
bm5lbCBGSUZPIGFuZCAyTC4gTW9yZSBpbmZvcm1hdGlvbiBhYm91dCBGSUZPIGJhc2VkIGV2ZW50
IGNoYW5uZWwgY2FuIGJlIGZvdW5kIGF0Og0KPiANCj4gSSB0aGluayBpdCBpcyBhIGJpdCBzdHJh
bmdlIHRvIHBvaW50IHRvIHRoZSBGSUZPIGRvYyBidXQgbm90IHRoZSAyTCAodGhlIGV4cGxhbmFu
dGlvbiBhYm92ZSBpcyBub3QgcmVhbGx5IGZvciAyTCkuIElmIHRoZXJlIGFyZSBubyBkb2MgZm9y
IHRoZSBsYXR0ZXIsIHRoZW4gSSB3b3VsZCBwb3NzaWJseSBkcm9wIHRoZSBsaW5rLg0KDQpBY2su
DQoNCj4gDQo+Pj4+ICtUaGUgZXZlbnQgY2hhbm5lbCBzdWItbm9kZSBoYXMgdGhlIGZvbGxvd2lu
ZyBwcm9wZXJ0aWVzOg0KPj4+PiArDQo+Pj4+ICstIGNvbXBhdGlibGUNCj4+Pj4gKw0KPj4+PiAr
ICJ4ZW4sZXZ0Y2huIg0KPj4+PiArDQo+Pj4+ICstIHhlbixldnRjaG4NCj4+Pj4gKw0KPj4+PiAr
IFRoZSBwcm9wZXJ0eSBpcyB0dXBsZXMgb2YgdHdvIG51bWJlcnMNCj4+Pj4gKyAobG9jYWwtZXZ0
Y2huIGxpbmstdG8tZm9yZWlnbi1ldnRjaG4pIHdoZXJlOg0KPj4+PiArDQo+Pj4+ICsgbG9jYWwt
ZXZ0Y2huIGlzIGFuIGludGVnZXIgdmFsdWUgdGhhdCB3aWxsIGJlIHVzZWQgdG8gYWxsb2NhdGUg
bG9jYWwgcG9ydA0KPj4+PiArIGZvciBhIGRvbWFpbiB0byBzZW5kIGFuZCByZWNlaXZlIGV2ZW50
IG5vdGlmaWNhdGlvbnMgdG8vZnJvbSB0aGUgcmVtb3RlDQo+Pj4+ICsgZG9tYWluLg0KPj4+IFBv
cnQgMCBpcyByZXNlcnZlZCBhbmQgYm90aCBGSUZPLzJMIGhhdmUgbGltaXQgb24gdGhlIHBvcnQg
bnVtYmVycy4NCj4+PiANCj4+PiBJIHRoaW5rIHdlIHNob3VsZCBsZXQga25vdyB0aGUgdXNlcnMg
YWJvdXQgdGhvc2UgbGltaXRhdGlvbnMgYnV0IEkgYW0gbm90IHN1cmUgd2hldGhlciB0aGUgYmlu
ZGluZyBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIHRoYXQuDQo+PiBJZiB5b3UgYXJlIG9rYXkgSSBj
YW4gYWRkIHRoaXMgbGltaXRhdGlvbiBpbiB0aGlzIGRlc2lnbiBkb2MuDQo+IA0KPiBEZXNpZ24g
ZG9jcyBhcmUgZ2VuZXJhbGx5IGZvciBkZXZlbG9wcGVyIG9mIFhlbiByYXRoZXIgdGhhbiB0aGUg
ZW5kIHVzZXJzLiBJIGFtIE9LIGlmIHlvdSB3YW50IHRvIGFkZCB0aGUgbGltaXRhdGlvbnMgaW4g
dGhpcyBkZXNpZ24gZG9jIHNvIGxvbmcgd2UgaGF2ZSBhbm90aGVyIGVhc3kgd2F5IGZvciB0aGUg
dXNlciB0byBmaW5kIG91dCB0aGUgbGltaXRzLg0KPiANCj4gVGhpcyBjb3VsZCBiZSBlbmQgdXNl
cnMgZG9jdW1lbnRhdGlvbiBhbmQvb3IgbWVzc2FnZSBpbiBYZW4uIE5vdGUgdGhhdCAyTCBoYXMg
YSBsb3dlciBsaW1pdCBhbmQgd2UgZG9uJ3Qga25vdyBpbiBhZHZhbmNlIHdoYXQgdGhlIGd1ZXN0
IHdpbGwgdXNlLiBTbyB3ZSBtYXkgaGF2ZSB0byBhc3N1bWUgdGhlIGxvd2VyIGxpbWl0ICg0MDk2
KSB3aGljaCBzaG91bGQgYmUgcGxlbnR5IGZvciBlbWJlZGRlZCA6KQ0KDQpJIGFtIHBsYW5uaW5n
IHRvIGV4cGxhaW4gdGhlIHN0YXRpYyBldmVudC1jaGFubmVsIHN1Ym5vZGUgaW4gImRvY3MvbWlz
Yy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHTigJ0gWzFdLiBJIHdpbGwgaW5jbHVkZSB0aGUg
bGltaXRhdGlvbiBhbHNvIGF0IHRoZSBzYW1lIHRpbWUuDQoNCkBTdGVmYW5vOiAgSSBuZWVkIGNv
bmZpcm1hdGlvbiBmcm9tIHlvdSBhbHNvLCBpcyB0aGF0IG9rYXkgdG8gYWRkIG5ldyBwcm9wZXJ0
eSB2YWx1ZSAgInhlbixlbmhhbmNlZCA9IGV2dGNobuKAnSB0byBvbmx5IA0KZW5hYmxlIGV2ZW50
LWNoYW5uZWwgaW50ZXJmYWNlIGZvciBkb20wbGVzcyBkb21Vcy4gbWFrZV9oeXBlcnZpc29yX25v
ZGUoKSB3aWxsIHNldCB0aGUgZXZ0Y2huIFBQSSBpbnRlcnJ1cHRzICBwcm9wZXJ0eSBvbmx5IGlm
ICJ4ZW4sZW5oYW5jZWQgPSBldnRjaG7igJ0gaXMgc2V0Lg0KDQpJZiAieGVuLGVuaGFuY2VkIiB3
aXRoIGFuIGVtcHR5IHN0cmluZyAob3Igd2l0aCB0aGUgdmFsdWUgImVuYWJsZWTigJ0pIGlzIHNl
dCBtYWtlX2h5cGVydmlzb3Jfbm9kZSgpIHdpbGwgc2V0IHRoZSBncmFudCB0YWJsZSwgZXh0ZW5k
ZWQgcmVnaW9uIGFuZCBQUEkgaW50ZXJydXB0IHByb3BlcnR5Lg0KIA0KWzFdIGh0dHA6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9ZG9jcy9taXNjL2FybS9kZXZp
Y2UtdHJlZS9ib290aW5nLnR4dDtoPTdiNGEyOWEyYzI5M2QxNmU5MjgwYTI0Nzg5YmMzYjUyNjJh
MzY3ZjY7aGI9SEVBRCNsMjM4DQoNClJlZ2FyZHMsDQpSYWh1bA==

