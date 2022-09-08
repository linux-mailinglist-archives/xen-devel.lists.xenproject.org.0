Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7B5B23B5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 18:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403505.645648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKYU-0005Hw-FT; Thu, 08 Sep 2022 16:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403505.645648; Thu, 08 Sep 2022 16:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWKYU-0005G7-CA; Thu, 08 Sep 2022 16:39:06 +0000
Received: by outflank-mailman (input) for mailman id 403505;
 Thu, 08 Sep 2022 16:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5itv=ZL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oWKSo-0002V6-Ow
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 16:33:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eef12ba0-2f85-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 16:53:00 +0200 (CEST)
Received: from AS8P250CA0027.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::32)
 by PAXPR08MB6511.eurprd08.prod.outlook.com (2603:10a6:102:12d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 14:52:58 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::cf) by AS8P250CA0027.outlook.office365.com
 (2603:10a6:20b:330::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18 via Frontend
 Transport; Thu, 8 Sep 2022 14:52:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 14:52:58 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 08 Sep 2022 14:52:58 +0000
Received: from 7aa89cf395bb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB36405E-FF62-4DDF-9DC1-B49315BCFF3C.1; 
 Thu, 08 Sep 2022 14:52:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7aa89cf395bb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 14:52:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB6313.eurprd08.prod.outlook.com (2603:10a6:10:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 14:52:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 14:52:48 +0000
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
X-Inumbo-ID: eef12ba0-2f85-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K7IDXYl2M1Cruu98GmZi1ZhJ0Qy68u8VZmcpIDoppdtvEk+/mJ7Xf92MI6oehWd9lp4BTFM4BGpdnYjnQbhGK7bN6IS/ur6xrvIdE12qabloGNMy+t/FesTIBZXryqYrG/0lvAq5kB/PwPzwv1yhhQbuRgogiq7DOzSJW6eqUU6p2k8jSSUkQ0vb7v3PRGVYeBYP/g/XdRFxFQ03C8P4k9AI/Ebblky3qLyMvOnlNiwDTEnmgBnw0kRBVwWOP1N26A+/oEwFYjTgEli1PwV1KUogSmvNAO6o2QClUd+cltULKGh0/r7c1l/ZmMhZo8xVccJeGWOkXrDpnaY/4Q8+7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYwq38ij0WcLT7MnjaCpNaXYlUNRMMsOg1q+J7cC/Xk=;
 b=P0URd0EmomavJzOYyDOVS1sTbgkOjNTt4Q+GAa66CWG0qTcwARqKGN7k6O5bKPB8AMOUSvmv8a622n2hvE/GS8n8ahJ0DdktiFf/dui9JNUQwIzflro26LxFCnJnwLFdFsolqQsnBqLa7fJ9fzaAM2uc+fnh+4o0z7zor1gebkrQGSNAC8rzv3yHnYQooGVxo44r2BYxLK1znk7oatgNGDpGS5eGSeFDENrLeago2l2RS8yu6D66inc4CXoCXVCR4F5FbVGCLUdhAHM1E8IMoWGuQPF8ONFDrHkjT0lqT0YL7t9VC4fDqk1qFQU2B8q+3XtT4pjRXhLtBCKJCWilkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYwq38ij0WcLT7MnjaCpNaXYlUNRMMsOg1q+J7cC/Xk=;
 b=RkvWLHM018rp8epqvW/uP4ReZMbu4S1NpskTGScjik0wS8vGevgkM1zvXemcb1OQqOiyewHLPNVAjWfPCsuepAhiLEF5MZwOAdch7GE8jtzyAESGQm9dBHxnoijI6kWrPLCQDFWUnyjSZJEPcoPl0gvCjvLWMw1VixODhFc5IqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbh6TVkjthrRpGfHNoZOc48QQauRyGBiKpRyEY+Ql+qt72TBLks7eKWspU3BFk0irmPqOvxWFx+r+K0qUaVkX+3VxhV7dExsaEG/CtE9JA/rq3VkMXnMN8xNVsnvwOi2Ng4jSYQCX9PwT6w9N7zPeCM8/aRD/qznkptl2ui7WTZJYUo7iTp2/dQKzma4OovCBQNGAVkgwDBZKUxH3lF3pPXXpIWM43Z0/6Kdf5nbVh9tTzOtOZIAUD5goP1jaAMsWQ/28tHckoiiqCMeGouHiR4rgMET3fZzu3NgC0PZp+hZOzcF8rd2Nnxt9lu3LG5F5x9ObTeEImXc9PwNWHcygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYwq38ij0WcLT7MnjaCpNaXYlUNRMMsOg1q+J7cC/Xk=;
 b=Rdeg89KEQIFCyHUVy601H8UtwcTJi7i+yO6zeLBxycpBVmf8SkM/wSYQ6wynED1Bf+HitC/VLAZolev7rDOZl0jfuFFT2Y7RbQcPTneD8u5/VMR33UjUCftFt9xdxde2GH/WvEy4khKnAnftmiXmex7A5g4ojHkmJGz/9mqKN+rNpfTL1Mp+WYnRhSNhxXme5xG90193Jj+Sduda9gMlqzLwBEfQiJTXzasFu7fsEkRXKUaZhMzCrz84CrxTbRX74RmK+oTykGuAoVjyJ31JeetU6nkzuk8bGBFJcOII+7164OKz+JZQilbu4VAY+qACV4uXu5cap7k/eveM0r6aZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYwq38ij0WcLT7MnjaCpNaXYlUNRMMsOg1q+J7cC/Xk=;
 b=RkvWLHM018rp8epqvW/uP4ReZMbu4S1NpskTGScjik0wS8vGevgkM1zvXemcb1OQqOiyewHLPNVAjWfPCsuepAhiLEF5MZwOAdch7GE8jtzyAESGQm9dBHxnoijI6kWrPLCQDFWUnyjSZJEPcoPl0gvCjvLWMw1VixODhFc5IqU=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v4 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHYvnyKHl6xJ/9ji0S8MAXJnXBUfq3VSGGAgACdXwD//41NgIAANFtg
Date: Thu, 8 Sep 2022 14:52:47 +0000
Message-ID:
 <PAXPR08MB7420FE4FAF9B6C35020D88AA9E409@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-3-wei.chen@arm.com>
 <f775642b-7b44-86b2-70df-540069bc6674@suse.com>
 <a5df9b8e-4925-30e0-e0de-4062ac4cf9f2@arm.com>
 <085c4903-dab9-2d0e-2e25-d7e0d9479aa6@suse.com>
In-Reply-To: <085c4903-dab9-2d0e-2e25-d7e0d9479aa6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E83659737D3F424B8B5E2EE19F91359F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DBBPR08MB6313:EE_|AM7EUR03FT065:EE_|PAXPR08MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 75361c28-74d9-4e75-8965-08da91a9d1dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sUuNy6gnyVxY02z3ZSHlJUqSMNJkfgijzK8ivnZUy5fkrnB6RvOjgLggIDQTjVTBgrvV5ULdP9V+/XoPSpTQmeKz8eK4Y3n3Cl7AIg8mBt1q7uEL1mOzpAbJ/pxJMUaMw16hpOyWCMEEu6FZX98Nh8bUd2LZrUElXb9zb3VFU83xEXpC3GcLQGB+AoXOQ32DJ3ktJrnfJ4cC5W+qVRCruqDT3hJoN7dtX+uix+YNeyW8NRoejkh9v/12UjGkwubMqtIE1PgcHxArdmPmRfSCXmqrJV0WADyR+mEPCKe3u9vqb7V0k4WCDmlWAZUcfyuY47YpFTxqnQ6bCVjQJM7DxTXr88hBq9F5a3I2AV2P9sa/YwEU8Unn2L75TiVJNnLQo2ETB5XcZy7MEJzfFyc3R5miyKHYyhg98nY8eCv1A9fPn+A4X1tjdlabHwZGgaIe7cl3fx0+qJ3BY4Yrdv5ojVH5ZVpOA67KZEGnR5pnkjkXc+j+smlCF5ah5keYPcUT1C77ku0D06Yg1StLhAQYT/KLMxIKvcQV7xdvQ9t7di63JRlsoIHWxxkRlMZUEdQTsLKsSkKd/o65BtaJXkTU5vCrY579BEy35FmT5gTmI8OgUcbXP+hHmXetqO1VW/ZeYA2cjz71V6bcfJs9CM5RVUnEjE3zT6zCyNxKMKqnpKPDWdpdrZExG4goI8YzA6UJ+5OMV6nUkCwK2Jqeeu0zdpmKXO9XbYpYD9mi8gv02bJ2Umkq2/ZPLQQ5VT7H4o4U+8vjVZbGNwSZ81TL9eQ7UA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(186003)(52536014)(83380400001)(2906002)(53546011)(55016003)(5660300002)(6506007)(7696005)(86362001)(33656002)(9686003)(8936002)(71200400001)(41300700001)(478600001)(38070700005)(66476007)(76116006)(64756008)(4326008)(66446008)(54906003)(6916009)(66556008)(38100700002)(316002)(66946007)(8676002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6313
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbd2d985-5d98-4fd3-eb42-08da91a9cbc5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ku/W2zgx8mMqRsUOeJkWdqwcahCRVl1QXCLnwyXvwJDo+Kliz0JHw6tAw0E7jii56EE0mpNnKXaVpjqRgZUR9Kc3QmwBgHWRbXjKQ+PEI0UOKg9qVci1p5/m3LGcmpK6fVUQVLu1WUNZSkted2dhHoqZX34mHVwmYpGcZlnfEKPg2qn6BM2TREA5EWSwJphCgzk3CrAkKbF7HJriciMHTsK+QVJnakLc5i0eLNlVkm/GWE8p23ib0c5wtQRoSxRn6m+3YLfh1YkDkX/QOav8Lbmbj7LWo2EuqTy4RtXKwOMbE8vZ8+uve9AXU+bxtpudM7qde5FL0AmIRABMYjgx3DiaRfJUcINZT/MynH7zJxPEwDhshogXvjVE/4R8JWQPoGH315Y9236upw4naOjpcsAmnmwUPi4MnYsLxzZB7B//TuFjrL3NgbwlwgrqwMrcbKc8KzSyv9pFRTkM4LyO22U5JGMsXuohH/lI7mSS0CZ74bk1uxcyGVBHZxMpCVb9fB27hfczykRsNm+/dTsU8f+3stA7qFsUVRgKDW6yuc0VcwISK6/AKgMSO2ohfDDGALpr5f955wpjxcPBA5+vjq7/J5JEK9E41Qhnpe3cIoa+/37/28L0cF+uK7dwqrFxmNBlTm4TtnHiLdAFQzV+QQevLbwwl1gvHkH1YZBXO7ZuwKeATkSChLaHMzlU5lp4kkwvsh/Ch1otebzecPCGrcCzckV/3GFXfQ54xVp0E+FHQu61sUWZKk8/TJCzoaLEWQGGpjhdw5m5ui2KRu9Uhg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(40470700004)(46966006)(36840700001)(356005)(81166007)(86362001)(70206006)(82740400003)(8676002)(4326008)(70586007)(33656002)(36860700001)(53546011)(186003)(9686003)(47076005)(336012)(6506007)(7696005)(478600001)(26005)(83380400001)(41300700001)(40480700001)(316002)(55016003)(82310400005)(54906003)(2906002)(40460700003)(6862004)(5660300002)(8936002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:52:58.1957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75361c28-74d9-4e75-8965-08da91a9d1dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6511

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDnmnIg45pelIDE5OjQyDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEdlb3Jn
ZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NCAyLzZdIHhlbi94ODY6IG1vdmUgZ2VuZXJpY2FsbHkgdXNhYmxlIE5VTUEgY29kZQ0KPiBm
cm9tIHg4NiB0byBjb21tb24NCj4gDQo+IE9uIDA4LjA5LjIwMjIgMTI6MzIsIFdlaSBDaGVuIHdy
b3RlOg0KPiA+IE9uIDIwMjIvOS84IDE3OjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4gT24g
MDIuMDkuMjAyMiAwNTozMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiAtLS0gL2Rldi9udWxsDQo+
ID4+PiArKysgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+Pj4gQEAgLTAsMCArMSw0NDIgQEANCj4g
Pj4+ICsvKg0KPiA+Pj4gKyAqIEdlbmVyaWMgVk0gaW5pdGlhbGl6YXRpb24gZm9yIE5VTUEgc2V0
dXBzLg0KPiA+Pj4gKyAqIENvcHlyaWdodCAyMDAyLDIwMDMgQW5kaSBLbGVlbiwgU3VTRSBMYWJz
Lg0KPiA+Pj4gKyAqIEFkYXB0ZWQgZm9yIFhlbjogUnlhbiBIYXJwZXIgPHJ5YW5oQHVzLmlibS5j
b20+DQo+ID4+PiArICovDQo+ID4+PiArDQo+ID4+PiArI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+
ID4+PiArI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+DQo+ID4+PiArI2luY2x1ZGUgPHhlbi9t
bS5oPg0KPiA+Pj4gKyNpbmNsdWRlIDx4ZW4vbm9kZW1hc2suaD4NCj4gPj4+ICsjaW5jbHVkZSA8
eGVuL251bWEuaD4NCj4gPj4+ICsjaW5jbHVkZSA8eGVuL3BhcmFtLmg+DQo+ID4+PiArI2luY2x1
ZGUgPHhlbi9zY2hlZC5oPg0KPiA+Pj4gKyNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPg0KPiA+Pj4g
Kw0KPiA+Pj4gK3N0cnVjdCBub2RlX2RhdGEgX19yb19hZnRlcl9pbml0IG5vZGVfZGF0YVtNQVhf
TlVNTk9ERVNdOw0KPiA+Pj4gKw0KPiA+Pj4gKy8qIE1hcHBpbmcgZnJvbSBwZHggdG8gbm9kZSBp
ZCAqLw0KPiA+Pj4gK3Vuc2lnbmVkIGludCBfX3JvX2FmdGVyX2luaXQgbWVtbm9kZV9zaGlmdDsN
Cj4gPj4+ICt1bnNpZ25lZCBsb25nIF9fcm9fYWZ0ZXJfaW5pdCBtZW1ub2RlbWFwc2l6ZTsNCj4g
Pj4+ICt1aW50OF90ICpfX3JvX2FmdGVyX2luaXQgbWVtbm9kZW1hcDsNCj4gPj4+ICtzdGF0aWMg
dWludDhfdCBfX3JvX2FmdGVyX2luaXQgX21lbW5vZGVtYXBbNjRdOw0KPiA+Pg0KPiA+PiBUaGVz
ZSBsYXN0IHR3byB3YW50IHRvIHVzZSBub2RlaWRfdCBpbnN0ZWFkIG9mIHVpbnQ4X3QuIE9yaWdp
bmFsbHkNCj4gPj4gdGhlIGxhdHRlciB1c2VkIHR5cGVvZigqbWVtbm9kZW1hcCkgZm9yIChJIHRo
aW5rIC0gaWlyYyBpdCB3YXMgbWUgd2hvDQo+ID4+IG1hZGUgaXQgdGhhdCB3YXkpIHRoaXMgcmVh
c29uOiBUaGF0IHdheSBjb3JyZWN0aW5nIG1lbW5vZGVtYXAncyB0eXBlDQo+ID4+IHdvdWxkIGhh
dmUgcHJvcGFnYXRlZCB3aXRob3V0IHRoZSBuZWVkIGZvciBmdXJ0aGVyIGFkanVzdG1lbnRzLg0K
PiA+Pg0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGlzIGluZm8sIHNob3VsZCBJIG5lZWQgdG8gcmVz
dG9yZSBpdCB0byB1c2UNCj4gPiAidHlwZW9mKCptZW1ub2RlbWFwKSIgaW4gbmV4dCB2ZXJzaW9u
ID8NCj4gDQo+IFRoYXQgd291bGQgYmUgbW9yZSBpbiBsaW5lIHdpdGggdGhlIG9yaWdpbmFsIGNv
ZGUsIGJ1dCBpdCdzIG5vdA0KPiBzdHJpY3RseSBuZWNlc3Nhcnkgb25jZSBub2RlaWRfdCBpZiBw
cm9wZXJseSB1c2VkIGZvciB0aGVzZSB2YXJpYWJsZXMuDQo+IEknZCBsZWF2ZSBpdCB1cCB0byB5
b3UgYXMgbG9uZyBhcyB5b3Ugc3dpdGNoIHRvIG5vZGVpZF90Lg0KPiANCg0KT2ssIEkgd2lsbCB0
aGluayBtb3JlIGFib3V0IGl0IGluIG5leHQgdmVyc2lvbi4NCg0KPiA+Pj4gK25vZGVpZF90IF9f
cmVhZF9tb3N0bHkgY3B1X3RvX25vZGVbTlJfQ1BVU10gPSB7DQo+ID4+PiArICAgIFswIC4uLiBO
Ul9DUFVTLTFdID0gTlVNQV9OT19OT0RFDQo+ID4+PiArfTsNCj4gPj4+ICsNCj4gPj4+ICtjcHVt
YXNrX3QgX19yZWFkX21vc3RseSBub2RlX3RvX2NwdW1hc2tbTUFYX05VTU5PREVTXTsNCj4gPj4+
ICsNCj4gPj4+ICtub2RlbWFza190IF9fcmVhZF9tb3N0bHkgbm9kZV9vbmxpbmVfbWFwID0geyB7
IFswXSA9IDFVTCB9IH07DQo+ID4+PiArDQo+ID4+PiArYm9vbCBfX3JlYWRfbW9zdGx5IG51bWFf
b2ZmOw0KPiA+Pg0KPiA+PiBUaGUgdjMgcmV2aWV3IGRpc2N1c3NpbmcgdGhpcyBwb3NzaWJseSBi
ZWNvbWluZyBfX3JvX2FmdGVyX2luaXQgZGlkbid0DQo+ID4+IHJlYWxseSBmaW5pc2ggKHlvdSBk
aWRuJ3QgcmVwbHkgdG8gbXkgbGF0ZXN0IHJlcXVlc3QgdGhlcmUpLCBidXQgeW91DQo+ID4+IGFs
c28gZGlkbid0IGNoYW5nZSB0aGUgYXR0cmlidXRlLiBQbGVhc2UgY2xhcmlmeS4NCj4gPj4NCj4g
Pg0KPiA+IEkgdGhpbmsgSSBoYWQgYW5zd2VyZWQgeW91ciBxdWVzdGlvbiBieToNCj4gPiAgPj4g
SSB0aGluayB5ZXMsIGl0IHdpbGwgYmUgdXNlZCBpbiBudW1hX2Rpc2FibGVkIGFuZCBudW1hX2Rp
c2FibGVkIHdpbGwNCj4gPiAgPj4gYmUgY2FsbGVkIGluIGNwdV9hZGQuIg0KPiA+DQo+ID4gQW5k
IHlvdSByZXBsaWVkIG1lIHdpdGg6DQo+ID4gID4gSW4gdGhlIG9yaWdpbmFsIGNvZGUgSSBjYW5u
b3Qgc3BvdCBzdWNoIGEgcGF0aCAtIGNhbiB5b3UgcGxlYXNlIHBvaW50DQo+ID4gID4gb3V0IGhv
dyBleGFjdGx5IHlvdSBzZWUgbnVtYV9kaXNhYmxlZCgpIHJlYWNoYWJsZSBmcm9tIGNwdV9hZGQo
KT8gSSdtDQo+ID4gID4gY2xlYXJseSBvdmVybG9va2luZyBzb21ldGhpbmcgLi4uIg0KPiA+DQo+
ID4gQnV0IHRoZXJlIGlzIGEgdGltZSBkaWZmZXJlbmNlIGhlcmUsIHlvdXIgcmVwbHkgd2FzIHNl
bnQgYWZ0ZXIgSSBzZW50DQo+ID4gdjMsIG1heWJlIHlvdSBkaWRuJ3Qgbm90aWNlIGl0DQo+IA0K
PiBXaGljaCBzdWdnZXN0cyB5b3UgbWlnaHQgYmV0dGVyIGhhdmUgd2FpdGVkIHdpdGggc2VuZGlu
ZyB2MyB1bnRpbCB0aGUNCj4gZGlzY3Vzc2lvbiBoYWQgc2V0dGxlZC4NCj4gDQo+ID4gQWJvdXQg
dGhlIG5ldyBxdWVzdGlvbjoNCj4gPiBjcHVfYWRkIHdpbGwgY2FsbCBzcmF0X2Rpc2FibGVkLCBz
cmF0X2Rpc2FibGVkIHdpbGwgYWNjZXNzIG51bWFfb2ZmLg0KPiA+IHNyYXRfZGlzYWJsZWQgaXMg
YSBmdW5jdGlvbiB3aXRob3V0IF9faW5pdC4NCj4gDQo+IEJ1dCB0aGUgcmVxdWVzdCB3YXNuJ3Qg
dG8gbWFrZSB0aGUgdmFyaWFibGUgX19pbml0ZGF0YS4gVGhhdCB3b3VsZCBiZQ0KPiB3cm9uZyBv
ZiBjb3Vyc2UuIFNpbmNlIHNyYXRfZGlzYWJsZWQoKSBvbmx5IHJlYWRzIG51bWFfb2ZmLA0KPiBf
X3JvX2FmdGVyX2luaXQgZG9lcyBsb29rIHVzYWJsZSB0byBtZS4NCj4gDQoNCk9oLCB5ZXMsIHlv
dSdyZSByaWdodC4gSSBoYWQgdGhvdWdodCB3cm9uZy4gSSB3aWxsIGNvcnJlY3QgdGhpcy4NCg0K
Q2hlZXJzLA0KV2VpIENoZW4uDQoNCj4gSmFuDQo=

