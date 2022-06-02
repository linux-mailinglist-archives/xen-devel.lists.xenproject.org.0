Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1653B1AB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 04:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340826.565948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwaRq-00045z-56; Thu, 02 Jun 2022 02:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340826.565948; Thu, 02 Jun 2022 02:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwaRq-00043m-1u; Thu, 02 Jun 2022 02:20:30 +0000
Received: by outflank-mailman (input) for mailman id 340826;
 Thu, 02 Jun 2022 02:20:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cpeu=WJ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nwaRo-00043e-Ev
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 02:20:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe07::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b8f85f-e21a-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 04:20:27 +0200 (CEST)
Received: from DB7PR05CA0063.eurprd05.prod.outlook.com (2603:10a6:10:2e::40)
 by AM6PR08MB4135.eurprd08.prod.outlook.com (2603:10a6:20b:a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 2 Jun
 2022 02:20:24 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::ac) by DB7PR05CA0063.outlook.office365.com
 (2603:10a6:10:2e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 2 Jun 2022 02:20:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Thu, 2 Jun 2022 02:20:23 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Thu, 02 Jun 2022 02:20:23 +0000
Received: from 7c3b2ad821d3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91096236-7B5C-4FE6-AA12-BA8294653CF5.1; 
 Thu, 02 Jun 2022 02:20:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c3b2ad821d3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Jun 2022 02:20:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB7094.eurprd08.prod.outlook.com (2603:10a6:20b:401::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 02:20:11 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 02:20:11 +0000
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
X-Inumbo-ID: 90b8f85f-e21a-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XNIUFDHEdl1sf1ATyYPQ+i820HplWGITl8+2X54eC1lkT3SXm6dpdS3NXo1fcdX6C5jckUpyWyWWJLXDYiEGy7SRuhRKekbBQyk3MQMHdYx74TenmG5ayBMNqTMxNUE0KTiwz/bZ/qJ60MpCtplrAd6e6Q1ETYdwsaDZkL8SaVS3X18eL5f8bSTgUmO7A1vYKX0XzACGOiSRMVenAINTtj4H2NzbdthWP48v7tYxT3HeYGXuFEQVDpNTeUo3Z/rUCx9RXeSmcojZLkQ4qmGPlUED0V+a3swvnErJa30rx1AJngIuPB2hX0hoHTSKNWBHeboJHnTHjGq1UhZ3dQbkJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+Qp4/v8H8bsT09zM7B9CbaKi4RLdX9Cv22MapYeN20=;
 b=GrSnUPFBmwEh9c8AzZRJ3kOzXLE+rIbyLQfqwzzkcmTRqjTgd4OTNV6BchnxDV6uBQ6/5z+19dyDeiewQfiHp/kj1E4aYiWkEwWjFFQEpICONHDQNKqhO6N49lqIZyVO8aVTctdRHj4BZuegwhj4a0baaks5kVERXvkLbYqMnkdD6jNznA5WOxvJK6y6fOElsw67EOc17qAnYbQIbUzBnE+FsV+TPOgvVSOBdbSmRT3lSqW5N2agJW7izclq+3y8TinfGIhvlhZx22rHpbkT63gbmGykA/lf8Pzo67r5pb0QGYAzZ8RR3Mi8eC8Po9hWMNpRc68+o47yTTsPb6qNQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+Qp4/v8H8bsT09zM7B9CbaKi4RLdX9Cv22MapYeN20=;
 b=f6j9ab8Y1X1oYH0zwmxSGGIYesbllRvoMGTEhHsjWWXk2D8HxYxfOaCKwmSeJMNsTWkyA36rZCYU7vcYDRvhOi44mFce/cNxOgiID2E4QM06ir8tt0gwONEr2mYpqAYv74l4T3N/twjtGkbqqditK98eG1b4/uAVNY+8iAK0BGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzkIe8zEFo79kvIBjrjv9Fqx6rdvoeAQBBzXjb0vbg3Hzd4vLUqsvwfoLQ48Mp1DX4e14npMIYeLxio+N7KyTvdCh20hBz6luoizL6K4GSChdH2z9XP40uqfSSB2zvGAfgXg6CJdv4ZSwDCR/Hbpdn5moxii4aHhe2rUDdW77A5aV2CDlAq0xTTj2QFOpCEhRStsWumcONd3XCxacYUKX2Ftaw/RW09sE/6mY02InYK4rdL9qdDGx4xM9yufJfO0mWYzuEBxT4lk26nC9WAo+0LzNFq8mNIZG9mz8xlT3auD7KdaT5Q6/Z9ot9Bf3HO2o6cyLzJv9HcEvueowyexNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+Qp4/v8H8bsT09zM7B9CbaKi4RLdX9Cv22MapYeN20=;
 b=DEr7qTKLdI8Y22R2gEtM8ervJHWLfAYLLApRi0Kg3NcQ5L2AzqGoF9sHMwNAOAP5bJFMJERxR7PlELGQmygrmE3ngsE/QBClwVyzQKEyyQgUFOzX7oxWFQrxwDePQaLrzuYTWUvtfNoTAAyISmVGVJk3t8M5CmegORGusFUcQU+FFBWTgRF4i69YRBkM/dYHxWVo+AlhrphCl9AZ4Me2EUdLRxJM/XrDMl9DnLO+Oso9hQekey4v4yfWzcgiRn0UvpHksAnZRjj6/TJ1KhT6G7wmow/UsvWkpF36rEJ+jhll2ueOARz1pyx/THqWvTNC87MTHpzkmvl2puOoqdBCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+Qp4/v8H8bsT09zM7B9CbaKi4RLdX9Cv22MapYeN20=;
 b=f6j9ab8Y1X1oYH0zwmxSGGIYesbllRvoMGTEhHsjWWXk2D8HxYxfOaCKwmSeJMNsTWkyA36rZCYU7vcYDRvhOi44mFce/cNxOgiID2E4QM06ir8tt0gwONEr2mYpqAYv74l4T3N/twjtGkbqqditK98eG1b4/uAVNY+8iAK0BGM=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Topic: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Index: AQHYbm4HiKDL321oiEuXmbKNpj1MH605Bc8AgADVNxCAAErZgIABQrBA
Date: Thu, 2 Jun 2022 02:20:10 +0000
Message-ID:
 <PAXPR08MB74208B9B507B780CEC065C9F9EDE9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
 <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
 <PAXPR08MB7420F087CC36C8E8DB8DFF7E9EDF9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <dc158225-73d0-498d-8b30-ade1078edd51@suse.com>
In-Reply-To: <dc158225-73d0-498d-8b30-ade1078edd51@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 66567AB6FDA22A4E80CBBAA15CF1F594.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e738049a-ccd3-430e-aa30-08da443e7307
x-ms-traffictypediagnostic:
	AS8PR08MB7094:EE_|DBAEUR03FT047:EE_|AM6PR08MB4135:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4135BC0CD212C90A6EFEB8629EDE9@AM6PR08MB4135.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7r/SEQwRA3K+AYdw0WbfKSZvoboH814xtaueu4W5Vsdho9Fd+4jPyhiWa2OSzutyKlqBeJYWMfYNy+WMxvTz0PmGiB0A9kCD6/jlNv88vVw+mgE9YdP2if/XepCDdtVcsaVLavwbCm4T3bNA4eDd8UF3S9CD8x3JoR+TjVr6dLUjEZ+kwJvR1y3CkMDyla2Ox5zijNCvFo570YGHtI16/exRuqiUmkgf1zb9dQsMpjxytbNPGi3au11aBkwgujcyzH1TR9U8oyaYAMXusZi/+MwNwmC7bfUlCOk1HQUc3l9cEr63cCn8PglZyxWC7hHuldKqJJehIY0zPPUUGzVuKIDEgIBKfKo9W82FYMNKJ3hshh1WM3cQrvzbhnYD5P2ztkEwoyqbL5nkeSGhQoZ8vsFrSJwPetpCLgKZYT5zo3+E853YCoGhmU5hcNpM0wfbukZ5wLCDbz3Nyr8JW4/98CEb0mQv40CkwGQ98fpmWwvcXNA2uaYEmI0MEOKMTZ8/AuCGcZW5PyOKX4uYONv+f+IoiWFHGDyFjDxOO3WHUf9OjcaMbLYrs4qmwaeQw62Uv/0EhA1TeYWXrnTl63gBTDZMDUYrSJtS87a4k+2CpOLUV1M69baFAO/k1xULIHQv4eqb6NF425v1TuGs/Msz0z+eNy5xVO4eFbgTVvAMDPPr1+AjaHOtPm1kxRWbM7pFUaB/b8ElhpKmBbh+e1sPmA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(55016003)(26005)(66446008)(4326008)(66556008)(66476007)(66946007)(8676002)(64756008)(76116006)(316002)(6916009)(186003)(54906003)(53546011)(38070700005)(2906002)(6506007)(7696005)(5660300002)(508600001)(122000001)(33656002)(83380400001)(8936002)(71200400001)(86362001)(9686003)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7094
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	782115b5-bd4a-4ee1-62fb-08da443e6b98
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hNlfV6fVM7toZPZHEgIlR6EkeLzrIxvD4ZbvaI4IBKxscIMjMS0YhkhKCGL6f+lT0obrQngTQeI6l3BsF8MPb9Y38SsI/5r7YLY5/SoP73N1ShnSoldkuWPiYP72jBs3abab7pM/qD7HjDShr72bSAZwWg8HdO46WJD2OhIv5FrC13ozcTTgi+kMnDNsfk4c3WQMTE9vbrACtzcmCTBj1o+pAm1g8cFg+z6rcnudeoK9WvhW7w+bb74tuteNf5uQb1PvBH5MUkQNbkOXf4eAJCmazYenZX5Y/fPO4HmMlaTtrdJtR455HTEk3dhVaII52KijrnKRG53FOYgH6FuUkdSIDJYeSURGpa7w7ntmvYUMbGlTnyRN5j9ZVJfCrXK28Kpf3zILAQSfHJ1aGMJYqE6R7BMcagTDmd+G++O9t7PMEtAaIYN7T3Y1oW2ErQlVDVpLPc8xG31KyAtX4s/bSn0H71gP5W84SFrz4o4MmBC3lDBliey7HiDBHW/l9lHxzz0UvcmVGbq+BDBXc1nRGB/VrJw1DiAfjw/sO3FlPvjhzS1IdOajLQKSiIrYKhjzUpB+ZrCiAmPj2Pai/9PXVK/aI6vERUBPmJFDpEVbmKnBo1ZMVKe3B0bnZ6L3agTNg2oAf/dXBH2QxgSfEEccrN3CUM72HHgb2j/ethJiuXOU0YM3OVojD4BVZLLH2xeU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(6862004)(52536014)(70586007)(55016003)(54906003)(316002)(8936002)(8676002)(86362001)(4326008)(186003)(336012)(7696005)(33656002)(5660300002)(40460700003)(508600001)(81166007)(83380400001)(36860700001)(2906002)(26005)(6506007)(9686003)(53546011)(47076005)(356005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 02:20:23.4889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e738049a-ccd3-430e-aa30-08da443e7307
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4135

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDbmnIgx5pelIDE0OjMyDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEppYW1l
aSBYaWUNCj4gPEppYW1laS5YaWVAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDcvOF0geGVuL3g4NjogYWRkIGRldGVjdGlv
biBvZiBtZW1vcnkgaW50ZXJsZWF2ZXMNCj4gZm9yIGRpZmZlcmVudCBub2Rlcw0KPiANCj4gT24g
MDEuMDYuMjAyMiAwNDo1MywgV2VpIENoZW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjAyMuW5tDXmnIgzMeaXpSAyMToyMQ0K
PiA+Pg0KPiA+PiBPbiAyMy4wNS4yMDIyIDA4OjI1LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IEBA
IC0xMTksMjAgKzEyNSw0NSBAQCBpbnQgdmFsaWRfbnVtYV9yYW5nZShwYWRkcl90IHN0YXJ0LCBw
YWRkcl90IGVuZCwNCj4gPj4gbm9kZWlkX3Qgbm9kZSkNCj4gPj4+ICAJcmV0dXJuIDA7DQo+ID4+
PiAgfQ0KPiA+Pj4NCj4gPj4+IC1zdGF0aWMgX19pbml0IGludCBjb25mbGljdGluZ19tZW1ibGtz
KHBhZGRyX3Qgc3RhcnQsIHBhZGRyX3QgZW5kKQ0KPiA+Pj4gK3N0YXRpYw0KPiA+Pj4gK2VudW0g
Y29uZmxpY3RzIF9faW5pdCBjb25mbGljdGluZ19tZW1ibGtzKG5vZGVpZF90IG5pZCwgcGFkZHJf
dCBzdGFydCwNCj4gPj4+ICsJCQkJCSAgcGFkZHJfdCBlbmQsIHBhZGRyX3QgbmRfc3RhcnQsDQo+
ID4+PiArCQkJCQkgIHBhZGRyX3QgbmRfZW5kLCB1bnNpZ25lZCBpbnQgKm1ibGtpZCkNCj4gPj4+
ICB7DQo+ID4+PiAtCWludCBpOw0KPiA+Pj4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gPj4+DQo+ID4+
PiArCS8qDQo+ID4+PiArCSAqIFNjYW4gYWxsIHJlY29yZGVkIG5vZGVzJyBtZW1vcnkgYmxvY2tz
IHRvIGNoZWNrIGNvbmZsaWN0czoNCj4gPj4+ICsJICogT3ZlcmxhcCBvciBpbnRlcmxlYXZlLg0K
PiA+Pj4gKwkgKi8NCj4gPj4+ICAJZm9yIChpID0gMDsgaSA8IG51bV9ub2RlX21lbWJsa3M7IGkr
Kykgew0KPiA+Pj4gIAkJc3RydWN0IG5vZGUgKm5kID0gJm5vZGVfbWVtYmxrX3JhbmdlW2ldOw0K
PiA+Pj4gKw0KPiA+Pj4gKwkJKm1ibGtpZCA9IGk7DQo+ID4+PiArDQo+ID4+PiArCQkvKiBTa2lw
IDAgYnl0ZXMgbm9kZSBtZW1vcnkgYmxvY2suICovDQo+ID4+PiAgCQlpZiAobmQtPnN0YXJ0ID09
IG5kLT5lbmQpDQo+ID4+PiAgCQkJY29udGludWU7DQo+ID4+PiArCQkvKg0KPiA+Pj4gKwkJICog
VXNlIG1lbWJsayByYW5nZSB0byBjaGVjayBtZW1ibGsgb3ZlcmxhcHMsIGluY2x1ZGUgdGhlDQo+
ID4+PiArCQkgKiBzZWxmLW92ZXJsYXAgY2FzZS4NCj4gPj4+ICsJCSAqLw0KPiA+Pj4gIAkJaWYg
KG5kLT5lbmQgPiBzdGFydCAmJiBuZC0+c3RhcnQgPCBlbmQpDQo+ID4+PiAtCQkJcmV0dXJuIGk7
DQo+ID4+PiArCQkJcmV0dXJuIE9WRVJMQVA7DQo+ID4+PiAgCQlpZiAobmQtPmVuZCA9PSBlbmQg
JiYgbmQtPnN0YXJ0ID09IHN0YXJ0KQ0KPiA+Pj4gLQkJCXJldHVybiBpOw0KPiA+Pj4gKwkJCXJl
dHVybiBPVkVSTEFQOw0KPiA+Pg0KPiA+PiBLbm93aW5nIHRoYXQgbmQncyByYW5nZSBpcyBub24t
ZW1wdHksIGlzIHRoaXMgMm5kIGNvbmRpdGlvbiBhY3R1YWxseQ0KPiA+PiBuZWVkZWQgaGVyZT8g
KFN1Y2ggYW4gYWRqdXN0bWVudCwgaWYgeW91IGRlY2lkZWQgdG8gbWFrZSBpdCBhbmQgaWYgbm90
DQo+ID4+IHNwbGl0IG91dCB0byBhIHNlcGFyYXRlIHBhdGNoLCB3b3VsZCBuZWVkIGNhbGxpbmcg
b3V0IGluIHRoZQ0KPiA+PiBkZXNjcmlwdGlvbi4pDQo+ID4NCj4gPiBUaGUgMm5kIGNvbmRpdGlv
biBoZXJlLCB5b3UgbWVhbnQgaXMgIihuZC0+ZW5kID09IGVuZCAmJiBuZC0+c3RhcnQgPT0NCj4g
c3RhcnQpIg0KPiA+IG9yIGp1c3QgIm5kLT5zdGFydCA9PSBzdGFydCIgYWZ0ZXIgIiYmIj8NCj4g
DQo+IE5vLCBJIG1lYW4gdGhlIGVudGlyZSAybmQgaWYoKS4NCj4gDQoNCk9LLg0KDQo+ID4+PiAr
CQkvKg0KPiA+Pj4gKwkJICogVXNlIG5vZGUgbWVtb3J5IHJhbmdlIHRvIGNoZWNrIHdoZXRoZXIg
bmV3IHJhbmdlIGNvbnRhaW5zDQo+ID4+PiArCQkgKiBtZW1vcnkgZnJvbSBvdGhlciBub2RlcyAt
IGludGVybGVhdmUgY2hlY2suIFdlIGp1c3QgbmVlZA0KPiA+Pj4gKwkJICogdG8gY2hlY2sgZnVs
bCBjb250YWlucyBzaXR1YXRpb24uIEJlY2F1c2Ugb3ZlcmxhcHMgaGF2ZQ0KPiA+Pj4gKwkJICog
YmVlbiBjaGVja2VkIGFib3ZlLg0KPiA+Pj4gKwkJICovDQo+ID4+PiArCSAgICAgICAgaWYgKG5p
ZCAhPSBtZW1ibGtfbm9kZWlkW2ldICYmDQo+ID4+PiArCQkgICAgKG5kX3N0YXJ0IDwgbmQtPnN0
YXJ0ICYmIG5kLT5lbmQgPCBuZF9lbmQpKQ0KPiA+Pj4gKwkJCXJldHVybiBJTlRFUkxFQVZFOw0K
PiA+Pg0KPiA+PiBEb2Vzbid0IHRoaXMgbmVlZCB0byBiZSA8PSBpbiBib3RoIGNhc2VzIChhbGJl
aXQgSSB0aGluayBvbmUgb2YgdGhlIHR3bw0KPiA+PiBleHByZXNzaW9ucyB3b3VsZCB3YW50IHN3
aXRjaGluZyBhcm91bmQsIHRvIGJldHRlciBsaW5lIHVwIHdpdGggdGhlDQo+ID4+IGVhcmxpZXIg
b25lLCB2aXNpYmxlIGluIGNvbnRleHQgZnVydGhlciB1cCkuDQo+ID4+DQo+ID4NCj4gPiBZZXMs
IEkgd2lsbCBhZGQgIj0iaW4gYm90aCBjYXNlcy4gQnV0IGZvciBzd2l0Y2hpbmcgYXJvdW5kLCBJ
IGFsc28NCj4gPiB3YW50ZWQgdG8gbWFrZSBhIGJldHRlciBsaW5lIHVwLiBCdXQgaWYgbmlkID09
IG1lbWJsa19ub2RlaWRbaV0sDQo+ID4gdGhlIGNoZWNrIG9mIChuZF9zdGFydCA8IG5kLT5zdGFy
dCAmJiBuZC0+ZW5kIDwgbmRfZW5kKSBpcyBtZWFuaW5nbGVzcy4NCj4gPiBJJ2xsIGFkanVzdCB0
aGVpciBvcmRlciBpbiB0aGUgbmV4dCB2ZXJzaW9uIGlmIHlvdSB0aGluayB0aGlzIGlzDQo+ID4g
YWNjZXB0YWJsZS4NCj4gDQo+IEkgd2Fzbid0IHJlZmVycmluZyB0byB0aGUgIm5pZCAhPSBtZW1i
bGtfbm9kZWlkW2ldIiBwYXJ0IGF0IGFsbC4gV2hhdA0KPiBJJ20gYWZ0ZXIgaXMgZm9yIHRoZSB0
d28gcmFuZ2UgY2hlY2tzIHRvIGNvbWUgYXMgY2xvc2UgYXMgcG9zc2libGUgdG8NCj4gd2hhdCB0
aGUgb3RoZXIgcmFuZ2UgY2hlY2sgZG9lcy4gKFdoaWNoLCBhcyBJIG5vdGljZSBvbmx5IG5vdywg
d291bGQNCj4gaW5jbHVkZSB0aGUgZHJvcHBpbmcgb2YgdGhlIHVubmVjZXNzYXJ5IGlubmVyIHBh
aXIgb2YgcGFyZW50aGVzZXMuKQ0KPiBFLmcuICh0aGVyZSBhcmUgb3RoZXIgdmFyaWF0aW9ucyBv
ZiBpdCkNCj4gDQo+IAkgICAgICAgIGlmIChuaWQgIT0gbWVtYmxrX25vZGVpZFtpXSAmJg0KPiAJ
CSAgICBuZC0+c3RhcnQgPj0gbmRfc3RhcnQgJiYgbmQtPmVuZCA8PSBuZF9lbmQpDQo+IAkJCXJl
dHVybiBJTlRFUkxFQVZFOw0KPiANCg0KT2gsIHRoYW5rcy4gSSBoYWQgdGhvdWdodCB0b28gbXVj
aCwgSSB3aWxsIGRyb3AgdGhlbS4NCg0KPiA+Pj4gQEAgLTI3NSwxMCArMzA2LDEzIEBAIGFjcGlf
bnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QNCj4gPj4gYWNwaV9zcmF0
X2NwdV9hZmZpbml0eSAqcGEpDQo+ID4+PiAgdm9pZCBfX2luaXQNCj4gPj4+ICBhY3BpX251bWFf
bWVtb3J5X2FmZmluaXR5X2luaXQoY29uc3Qgc3RydWN0IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkN
Cj4gKm1hKQ0KPiA+Pj4gIHsNCj4gPj4+ICsJZW51bSBjb25mbGljdHMgc3RhdHVzOw0KPiA+Pg0K
PiA+PiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoaXMgbG9jYWwgdmFyaWFibGUuDQo+ID4+DQo+
ID4NCj4gPiBXaHkgSSBkb24ndCBuZWVkIHRoaXMgb25lPyBEaWQgeW91IG1lYW4gSSBjYW4gdXNl
DQo+ID4gc3dpdGNoIChjb25mbGljdGluZ19tZW1ibGtzKC4uLikpIGRpcmVjdGx5Pw0KPiANCj4g
WWVzLiBXaHkgY291bGQgdGhpcyBub3QgYmUgcG9zc2libGU/DQo+IA0KDQpPay4NCg0KPiA+Pj4g
IAkJICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0LCBub2RlX21lbWJsa19yYW5nZVtp
XS5lbmQpOw0KPiA+Pj4gIAkJYmFkX3NyYXQoKTsNCj4gPj4+ICAJCXJldHVybjsNCj4gPj4+ICAJ
fQ0KPiA+Pj4gLQlpZiAoIShtYS0+ZmxhZ3MgJiBBQ1BJX1NSQVRfTUVNX0hPVF9QTFVHR0FCTEUp
KSB7DQo+ID4+PiAtCQlzdHJ1Y3Qgbm9kZSAqbmQgPSAmbm9kZXNbbm9kZV07DQo+ID4+Pg0KPiA+
Pj4gLQkJaWYgKCFub2RlX3Rlc3RfYW5kX3NldChub2RlLCBtZW1vcnlfbm9kZXNfcGFyc2VkKSkg
ew0KPiA+Pj4gLQkJCW5kLT5zdGFydCA9IHN0YXJ0Ow0KPiA+Pj4gLQkJCW5kLT5lbmQgPSBlbmQ7
DQo+ID4+PiAtCQl9IGVsc2Ugew0KPiA+Pj4gLQkJCWlmIChzdGFydCA8IG5kLT5zdGFydCkNCj4g
Pj4+IC0JCQkJbmQtPnN0YXJ0ID0gc3RhcnQ7DQo+ID4+PiAtCQkJaWYgKG5kLT5lbmQgPCBlbmQp
DQo+ID4+PiAtCQkJCW5kLT5lbmQgPSBlbmQ7DQo+ID4+PiAtCQl9DQo+ID4+PiArCWRlZmF1bHQ6
DQo+ID4+PiArCQlicmVhazsNCj4gPj4NCj4gPj4gVGhpcyB3YW50cyB0byBiZSAiY2FzZSBOT19D
T05GTElDVDoiLCBzdWNoIHRoYXQgdGhlIGNvbXBpbGVyIHdvdWxkDQo+ID4+IHdhcm4gaWYgYSBu
ZXcgZW51bWVyYXRvciBhcHBlYXJzIHdpdGhvdXQgYWRkaW5nIGNvZGUgaGVyZS4gKEFuDQo+ID4+
IGFsdGVybmF0aXZlIC0gd2hpY2ggcGVyc29uYWxseSBJIGRvbid0IGxpa2UgLSB3b3VsZCBiZSB0
byBwdXQNCj4gPj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgaW4gdGhlIGRlZmF1bHQ6IGNhc2UuIFRo
ZSBkb3duc2lkZSBpcyB0aGF0DQo+ID4+IHRoZW4gdGhlIGlzc3VlIHdvdWxkIG9ubHkgYmUgbm90
aWNlYWJsZSBhdCBydW50aW1lLikNCj4gPj4NCj4gPg0KPiA+IFRoYW5rcywgSSB3aWxsIGFkanVz
dCBpdCB0bzoNCj4gPiAJY2FzZSBOT19DT05GTElDVDoNCj4gPiAJCWJyZWFrOw0KPiA+IAlkZWZh
dWx0Og0KPiA+IAkJQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ID4gaW4gbmV4dCB2ZXJzaW9uLg0K
PiANCj4gQXMgc2FpZCAtIEkgY29uc2lkZXIgdGhpcyBmb3JtIGxlc3MgZGVzaXJhYmxlLCBhcyBp
dCdsbCBkZWZlcg0KPiBub3RpY2luZyBvZiBhbiBpc3N1ZSBmcm9tIGJ1aWxkLXRpbWUgdG8gcnVu
dGltZS4gSWYgeW91IHRoaW5rIHRoYXQNCj4gZm9ybSBpcyBiZXR0ZXIsIG1heSBJIGFzayB3aHk/
DQo+IA0KDQpPay4gSSB3aWxsIGRyb3AgdGhlIGRlZmF1bHQuIEkgaGFkIG1pcy11bmRlcnN0b29k
IHlvdXIgY29tbWVudC4NCg0KPiBKYW4NCg0K

