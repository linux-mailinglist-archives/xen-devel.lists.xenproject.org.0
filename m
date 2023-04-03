Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7BA6D3B80
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 03:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517294.802415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pj8zJ-0002rj-TD; Mon, 03 Apr 2023 01:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517294.802415; Mon, 03 Apr 2023 01:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pj8zJ-0002ov-Q2; Mon, 03 Apr 2023 01:28:01 +0000
Received: by outflank-mailman (input) for mailman id 517294;
 Mon, 03 Apr 2023 01:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW/x=72=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pj8zI-0002op-5S
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 01:28:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c30196a8-d1be-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 03:27:57 +0200 (CEST)
Received: from AM6PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::24) by AS2PR08MB10296.eurprd08.prod.outlook.com
 (2603:10a6:20b:648::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 01:27:54 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::b1) by AM6PR01CA0047.outlook.office365.com
 (2603:10a6:20b:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Mon, 3 Apr 2023 01:27:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.16 via Frontend Transport; Mon, 3 Apr 2023 01:27:54 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 03 Apr 2023 01:27:53 +0000
Received: from 1a285a08504b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12AA0D9A-322B-424F-AD6A-F43BE9627906.1; 
 Mon, 03 Apr 2023 01:27:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a285a08504b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 03 Apr 2023 01:27:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB7798.eurprd08.prod.outlook.com (2603:10a6:150:4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 01:27:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6254.029; Mon, 3 Apr 2023
 01:27:43 +0000
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
X-Inumbo-ID: c30196a8-d1be-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xI7pG/+thWbOKdjBTxM27elUXU8IQePp3oEeA3Z1fQ=;
 b=UtDDT2pVj/+MT0Pk/1dqk5JZdWSJ2b4hPn9K6xyQz4PZYsIbl+EtRJG+KZs7OgqzrqjIPLFhXkFNXfC9f8egS8NaAPYxe928EC8lmi0iEitl7h3txhkrAdBMKu6j23aJvA1t1qqnHt++h1inIDxxqyarU+bu94bV68hWxS3s1iY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJy9kGR8eXSoorFf8+qhdJlRjF8EvRRrL2XGFQio3XiFgGgS5tXzAjwIYGxqYYax12yQH3enSAAvfvaQv+u96ybCNdtHZt4vnLvV6CD1sM+atyfLYfDY/sooY0ha8/bynrMnW+EPQg7Z0/0rdoxaLHsI82KhxmyCIFgYpirCxsAKAfGOsWsCchhLFCRUszRWDnAITFi9sTHedG3VlNz7ziVk1IvlLzZE5Rkr2cXuXFrlMRcwmaw1Llc0pCZwenJGXB/7zLMQirEPGzjNdLVlprsjtammD5qQ1XUcZCjb9+wJmPhbFCWpzo4bbz19HCBjGjyVpg9nA9fR+YvcR5fIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xI7pG/+thWbOKdjBTxM27elUXU8IQePp3oEeA3Z1fQ=;
 b=OQtLOSbyDMwDxiueCrf+PF/+i1o93IdItpg2MKKzgAJ5+9TI4Xjl8aWRsLxN2ytmpQ8eqYV8F50hRkMylpzsYfkWHCwIx7BpWa0lJIbFNnTweJ8KCpbxq4iOdZHRqHcq/4Cg3GhHWxTt3F7hFZCK5hD12Ebf+9v/uBDw8Bx5QDk2771hhzts0Fg2NPJglXj7yQKDfmQoq2BwyPwp8+exaTk1i/KqCNEI3WZiThp2ML3oNvDScJIcCI+tIX4VB2IE9vfTPN0AGsvXwr/BDeh8PdFpmebZiGDFZ5WQZA5ac4Q47F76368OMvipKAvLYrg4akGBQ150d6g0sft0ta+B2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xI7pG/+thWbOKdjBTxM27elUXU8IQePp3oEeA3Z1fQ=;
 b=UtDDT2pVj/+MT0Pk/1dqk5JZdWSJ2b4hPn9K6xyQz4PZYsIbl+EtRJG+KZs7OgqzrqjIPLFhXkFNXfC9f8egS8NaAPYxe928EC8lmi0iEitl7h3txhkrAdBMKu6j23aJvA1t1qqnHt++h1inIDxxqyarU+bu94bV68hWxS3s1iY=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "community.manager@xenproject.org" <community.manager@xenproject.org>,
	Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@cloud.com>, Juergen
 Gross <jgross@suse.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Xen 4.18 release: Proposed release schedule
Thread-Topic: Xen 4.18 release: Proposed release schedule
Thread-Index: AdllyZg0WLVAnXgvTY+2GvS7dGkAyQ==
Date: Mon, 3 Apr 2023 01:27:42 +0000
Message-ID:
 <AS8PR08MB7991424A3167C70A9B29530C92929@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 572C6A4C7311C9449A271E8C1E3D6915.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB7798:EE_|AM7EUR03FT036:EE_|AS2PR08MB10296:EE_
X-MS-Office365-Filtering-Correlation-Id: a4762508-037e-494e-4f81-08db33e2a5f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QfQatOycnpIGKtE3P+2SHbE8E6VbhOzrdGxin3WqgfOjCB/WkUUUgjP42gkT849kPCrHlcaKqe+yLBjGuS2ap4MSJ1RiJg/xBAPs2UlX/K7ybP6HRRdIbbPDM2XQgPO+XeSzMGPL/JPjJl0dwEpTqEXWIhQQ+jJChWRb6D0k/jGKD8OQpoUkspbKf+cADU0ISQ5AefVJ1/6/oK6cCpgqflNRRbehu24ELhzVdwUQAqyPOeS/4s6mFSqJcxTLi5t8gCjBxbTZdKeqCJZ60Q8lNqHY7lmot7RcD4/PxcOFiyvzyhnI8h7ZlEk/h+wGPUhA3lL55dT6fYkl1MpiaJDwxZrIJpkUTNQ/W6WQ1PMaL0wPBhVbpQM4OzkzKS2bbGF0tSx8wPWA3bJpHnL2I6upMTlFCksFCBQV7e6PZDfPmqmTTSZbpg7z6geFAj35KSKvlMZJQQNZtr++kTpvP36TS7ljOGMn7ZLuHWIJLp6SW6NRUlessZpS8mclfyGFri02HTTVflplVlyTY2/KeElq+0rkitdglUxS2CUrxtpLt3tznkyp6C6xGR+uBjucRSSTuQlEoOj6zmuYRARIKgYzifbYPwnk4VchMXXxoaYkkY752BC04A7M70rtBKCu1hCc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(5660300002)(8936002)(41300700001)(54906003)(52536014)(478600001)(2906002)(66446008)(64756008)(76116006)(7696005)(4326008)(316002)(71200400001)(7416002)(66946007)(66556008)(66476007)(8676002)(6916009)(9686003)(186003)(6506007)(26005)(122000001)(55016003)(83380400001)(33656002)(86362001)(38100700002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7798
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10da1716-30c4-4707-fc51-08db33e29f01
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	usNsLZ3d2D+/KMoucZdM2VyDDJ3RboOvpupsjnpaX9nRK/SnhtfC7uUb5XObPi3ZhKwQhfUeGq/5ANlZ1+yBZgcubGWgEvadHM7xRPsc7tGa5Imea8NDvI/pI8nUW2o/Gy/GK+xLDR1negkCFCRVn5wcD1UGh3iY0BFxXU6s2LMRYUnSf5d6Hof6x6TDYK6BG+itkKB2qVPyjzr3YpTAz10cADrAdLJzgeiBabxgnrdYL2yCOpnFqs7EaVSmksNDbg6jQkd7voYCACwMGrifOD640bLkUMZECRE9FQ11sV7oiw4e1JFw49CIZ+WRvNVOqG0ewhJ9vP9GA28AWg8+yR8p+FS5nYCgAGyEv1UMwSczfGHJBl/ZPUTrzx4pAzITH1ev5orepKPAg66GfKuuWRAlS/S3lEYhoAsO0Om6q/3V/mUtWXujVzRJtdRDHnqZmPCdo2JDpo6LOCVUEgiI1vvMIaxvlySiqsa63QzzKIQTIrPCjNVshQkH1BCrTF7rLEdust98Yp50zQj5eDeBMQJqdmv1r2kfgjrF/0HNTkeSOTnsQHRtqjdbR0VTXhhYFxR9vUPOhjY5A6/tt+L9O6jO5sxaxQJMurkzwXsiFrE6E14ZDlWI883FTsch7EloKWHg0qO7FfiNVFAuyalzT4Eh2XCkW8Pgs7NhkWimYUs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(36840700001)(46966006)(86362001)(82310400005)(2906002)(33656002)(55016003)(40480700001)(7696005)(83380400001)(336012)(186003)(47076005)(26005)(6506007)(9686003)(4326008)(70586007)(8676002)(36860700001)(478600001)(70206006)(81166007)(6916009)(41300700001)(5660300002)(82740400003)(52536014)(356005)(54906003)(316002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 01:27:54.2178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4762508-037e-494e-4f81-08db33e2a5f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10296

Hi everyone,

Following the 8-month release cycle, also taking into account of the
Xen Summit and summer holiday, below is the proposed release
schedule that I come up with for Xen 4.18. Please don't hesitate to
provide your feedback. Thanks!

** Proposed option: Wed Aug 2, 2023 **
(+8 months from Xen 4.17 release)

- Last posting date          Fri May 12, 2023 (+6 weeks from now)

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri Jun 2, 2023 (+3 weeks from Last posting da=
te)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Jun 23, 2023 (+3 weeks from Feature freeze=
)

Bugfixes only.

(Note that Xen Summit is Jun 24 - 26, 2023)

- Hard code freeze           Fri Jul 14, 2023 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Jul 28, 2023 (+2 weeks from Hard code free=
ze)

Branch off staging-4.18.

- Release                    Wed Aug 2, 2023

Kind regards,
Henry


