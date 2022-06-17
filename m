Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD054EF6F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 05:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350962.577433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22bm-000688-4h; Fri, 17 Jun 2022 03:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350962.577433; Fri, 17 Jun 2022 03:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o22bm-00065W-0X; Fri, 17 Jun 2022 03:25:18 +0000
Received: by outflank-mailman (input) for mailman id 350962;
 Fri, 17 Jun 2022 03:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhX=WY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o22bk-000652-GL
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 03:25:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7d00::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a68000e-eded-11ec-ab14-113154c10af9;
 Fri, 17 Jun 2022 05:25:15 +0200 (CEST)
Received: from DU2P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::26)
 by DB6PR0801MB1928.eurprd08.prod.outlook.com (2603:10a6:4:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 17 Jun
 2022 03:25:05 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::32) by DU2P251CA0019.outlook.office365.com
 (2603:10a6:10:230::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 03:25:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 03:25:04 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Fri, 17 Jun 2022 03:25:04 +0000
Received: from cb475fc259a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D22E63E-1DEA-450D-8162-19F9F6BD5DA9.1; 
 Fri, 17 Jun 2022 03:24:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb475fc259a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 03:24:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 17 Jun
 2022 03:24:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%7]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 03:24:56 +0000
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
X-Inumbo-ID: 1a68000e-eded-11ec-ab14-113154c10af9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=P/YIGBu0O3f+jQFDwNgJGEI36mvBwrlBizNPSrfpjWMGnghTWMB1w0I2kacQMSETJ+mCBh0zGgWPUeg38rEVEv2xlee8LnTkVSttB9UuxVRjZBcqtCWDVJHEV8Z6ATXdsWc+4l1NYCRh46UxbMbYyMkaJfXQ9u8LmhNChQelk15w6dfJpPG6FJnJ91p7HbkyyO/7O4QgGiUxPYvNZ8I7PsjnXBi3ZkU483E0OSjO9yqHDqkB7zp0eLvtFNfqbHdVEQ+9heM/09sGuh/+PvgSbQ5AceWecWi1hJacTY/Z37Q3A18+ap6ZDWOhN7NrNhlPvczbdtaoOjK7ZLKLJzh3ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWYQ+mlADmvF9UtpQu6HZVmTpy/QSM8fWlCaRvr8sHA=;
 b=RSZUEzJdL4/ajK1OLaLM6f5ydn2og91dHJKnGQZZOZ/VWx1GX2Lu4fXfNaxq3Og7WCazSkQMHfyaMz/TjHAeZ7EaskluCRm4blevN+x0bXWoe7bjnbppFtwqq3lGY+2SmBjNK8/ZETI5TyppsvxW0mVbLn9bxS51xsCkuUZSDcL8LchI3W8HBKQDlyx2eCni2rgja06RqIPP1M9azWfJ3COhrpjywFf//+dOx4uJb25s/uP5mr+iUCHzp2L0Z/BB5mp8BPeaHesaP0RMmNslPRcUZYQfpJyEzb1+F1I0wY1rNOBjYi3+x8dlETQfQ+ZE3Ra7i272LrKSoC5sSC6EVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWYQ+mlADmvF9UtpQu6HZVmTpy/QSM8fWlCaRvr8sHA=;
 b=1JKrZm+Bi3MPWN3K3EHd+JahXO3xfAMw4jO4hlqLmlmeMzLZkFFb8D7pigbyMi7SxqLatCjpGsbXHqbWPDffp86eyqhYVklvQ9ulI0rIg15qC7Gf6MslDmhMaazHumx2HKhBq0Hbytph5jMY1S/OOxkgqaGLQVYNQlIS4IRPY5I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqpA7YvulkPv1oA/rExoPCWhbXYS1sYaM9oDUxfsdz4V+fTS3lNwYVty6YKOsgt3aRW2rD1YOJdvjPamOBNKvxNWgVOoErPsxDYguRCMu8oX6+2kh/G5PcsQBxmLwpMRO2S6XXIT0dA/UYkKm5aMMyUB3BW8yJ361EMvos/ZUS3y7VAML+hLFu8AV+8VgNYUQRgt7tllAtLTFP4duL+5mDd7zM97bvtXIxL1jZEYlxqa9wqWBmezAgJYK+aH0FAAWEeNvzubdG9I4Qso34H8q4HvV6+62WB7xtGALSbERux2M6a3Gx9Xm4zgYljw3ou9cEsrOJGrM2lvWu0HbYHScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWYQ+mlADmvF9UtpQu6HZVmTpy/QSM8fWlCaRvr8sHA=;
 b=f5+bk8HiuetDCzVOhI0VA0bXwE70z8PjmgxLRtBVOdLV4ppwEqEhhiqKrl/qoOD6PyrEuxAnWU5cxIaRKZDhMJh4XSYlFeybfDKRyDVuI2MV9qBKDFNMI2HJZjbRcljJ8Qqtms1R0DP5fvaS+3ur/JuRjRCVlqJl68XrBoZSx8WWiSUHIFR3omJWioeGjmHSSnVnjyWGolNdhI9LsqzhaSIESsH4pagL/GA5HMAxri0enfGIzoZ1NKmlkC8vniNap5cYiLbSXh5n6VjJBe9MJBzB1No1J6AreGCw8q/7iQv321t/cfEkhWD8EdHHZngDeNRHH1rnGp7R9V7NL4QJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWYQ+mlADmvF9UtpQu6HZVmTpy/QSM8fWlCaRvr8sHA=;
 b=1JKrZm+Bi3MPWN3K3EHd+JahXO3xfAMw4jO4hlqLmlmeMzLZkFFb8D7pigbyMi7SxqLatCjpGsbXHqbWPDffp86eyqhYVklvQ9ulI0rIg15qC7Gf6MslDmhMaazHumx2HKhBq0Hbytph5jMY1S/OOxkgqaGLQVYNQlIS4IRPY5I=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: RE: [PATCH 0/5] x86/lbr: handle lack of model-specific LBRs
Thread-Topic: [PATCH 0/5] x86/lbr: handle lack of model-specific LBRs
Thread-Index: AQHYbE8ENIrU0fzd30KB0FdsdC25cq1TGGOg
Date: Fri, 17 Jun 2022 03:24:56 +0000
Message-ID:
 <AS8PR08MB79915278A454C8933E8D7DE992AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7AE86C4C0389E640BD5B3218410CD2DB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3f3dd3f0-25c5-45b3-d29b-08da5010f8c6
x-ms-traffictypediagnostic:
	AM7PR08MB5464:EE_|DBAEUR03FT054:EE_|DB6PR0801MB1928:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB19281301AB6BD036CB81823992AF9@DB6PR0801MB1928.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YvFqUqq9l4/5zn5j+EGhwaZZJmSpsMxwAqqSleelqqPr8kUwj2fYMyNvpdSOhLV2B2/GMsTbyzJT8AhMeQ83jyog7pD+fegzxbWtA2ZjGS7qdNLa8hiFeXBlGptA4AbAFIGPGrKAI6MrjNBkG0qSLRybcd5ZLVBxspmDQ5I8pY8rsWs0fjgnqo0xvA3WgIMa0OuT7nZjZuuwI9neGgIKSiGk81EWY4fNNldR4zo/xP5/+koizv2MmnlaCO2QYHqU8LuHn64eodgBcLzxLNILOHEnlgPWa9uTDrhtdyECNxDysb58c6KuEQFseowzR5hyUywBk9is4YzsKYGR7aBL2Q7ykReaAuPPujVAnFuD1nxLpPkG/jCVmsZlNSZu8DhehxbYxcg2j7yguPMB0wQAtgG5/5VNW9QWWCB6O1lyzT8ZQ/8csaAMLL7vhRVBEhN7XBF6z0maYGaq7xpDqCAOfByWiwqIllZqKrAj78vVBnXp5zFcYNIlywI7MRlWWniXjyHHkhZVPuLKrWHGDUOGbYA+ZsnCDPoCuRhMAHA4Q5F0wL0iepjOANVEViTbqkkwdd1ZViwk+aZtyvWy04WARbB8S5wL1//xfjPQXdcalJt/Mvj0H+GHvXkMPf1UAdHsK1UsS+k9eqS3vX2CB4ryAGu7P0DaYWu/VmiCMEvVVW1CHhUjVkjetCRLybrRo1QUwnVlXuEkITHt/uHYAqxXjmJ9FhbSlBsgrSix1lnXE+A7vIcmFoRhwIiMeRYQQbycdBAyYPwy9rWXPVKQvWPw82gjRmt6wANS3+Q8NHDH5oU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(64756008)(4326008)(33656002)(52536014)(2906002)(8676002)(76116006)(66476007)(66556008)(66946007)(55016003)(86362001)(5660300002)(316002)(8936002)(54906003)(498600001)(7696005)(110136005)(6506007)(26005)(966005)(9686003)(71200400001)(83380400001)(38100700002)(122000001)(186003)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df71f582-8583-4777-e4df-08da5010f381
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9GHFyS+kQCp4KsalkZqfvQvVxhDsVsMBP3yJyi+v5mT/lCjyw07dYWtEDItY9NCQ+ExmM5MsjrhEFp+pF3GEJP6fldWh5Uy8mekE59+d61vE2CXDFb+kl3lqncAg2vkp+mrAyJIpRBYVJsnCLau1wvxRx3TMWTDqOP3OB2E1jwY/P3oBJKTBFlTv7PbAcksjfTpkoMB7ia9eUsgMRIGDOL66mbGoXiZg6cnLPiTU4ZUaMsFUKufJwfwOC2WP1kahYR2+udCGyOmjtIsE2wGnbPUC7UlnFkxuO6pfeTKQpPlispsC/fycB+CtLucKFoZ+AMPmo4ulNPihRKxHjj57iRZX6crIHyDJa3YlFs6V6RcXTcL+GBFhma3K0xySvXzxWeg+x7HQsGX8yK3AjO5f7weJmxKJvjCpB6gZSs6Qk3lEamlBClPf0bRIc2dxFKpa4Os66sXmXTlHyHXeZ0hiX8ZAZVmdMWsws9VxFHLZsuObWGabHd9TmlZk7pqOT4CpWbUgnrvCuqVG4j1ljfdPclw6fbCzOHvrtxbyzYMp9+vNJYV4Kvv3IdGJMwmxro6plr2YjntyJLNUOAHTkykkRqDcRo13IpLyHOCzkUlm1QyHEvFJVSoG47+2s3LDzGCV/h2vRNalLE7GhlBoglwuAkJf97F/ynzIywAHewBd93tBBxDejo9pgDYqD7bpnlA6UVJjxa8yEjwffLmU4nfZlD9ZAbDqqrtz/CupClBdTeckjBNbO+iR7qb7cZI75nLV9wXiygN7xJP+/5UpzhsPqA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(86362001)(336012)(47076005)(54906003)(81166007)(70206006)(2906002)(7696005)(40460700003)(356005)(52536014)(70586007)(316002)(110136005)(4326008)(55016003)(36860700001)(82310400005)(33656002)(8676002)(5660300002)(8936002)(186003)(6506007)(107886003)(83380400001)(26005)(9686003)(966005)(498600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 03:25:04.9668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3dd3f0-25c5-45b3-d29b-08da5010f8c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1928

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgWzFdIGhhcyBiZWVuIHN0YWxlIGZvciBh
IHdoaWxlLCB3aXRoIGFjdGlvbnMgbmVlZGVkDQpmcm9tIHRoZSBhdXRob3IgZm9yIHRoZSBmaXJz
dCA0IHBhdGNoZXMgYW5kIGNvbW1lbnRzIG5lZWRlZCBmcm9tIHRoZQ0KbWFpbnRhaW5lcnMgZm9y
IHRoZSBwYXRjaCM1LiBTbyBzZW5kaW5nIHRoaXMgZW1haWwgYXMgYSBnZW50bGUgcmVtaW5kZXIu
DQpUaGFua3MhDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVu
LWRldmVsL2xpc3QvP3Nlcmllcz02NDM2MjUNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1i
b3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gUm9nZXIgUGF1IE1v
bm5lDQo+IFN1YmplY3Q6IFtQQVRDSCAwLzVdIHg4Ni9sYnI6IGhhbmRsZSBsYWNrIG9mIG1vZGVs
LXNwZWNpZmljIExCUnMNCj4gDQo+IEhlbGxvLA0KPiANCj4gSW50ZWwgU2FwcGhpcmUgUmFwaWRz
IENQVXMgZG9lc24ndCBoYXZlIG1vZGVsLXNwZWNpZmljIE1TUnMsIGFuZCBoZW5jZQ0KPiBvbmx5
IGFyY2hpdGVjdHVyYWwgTEJScyBhcmUgYXZhaWxhYmxlLg0KPiANCj4gRmlyc3RseSBpbXBsZW1l
bnQgc29tZSBjaGFuZ2VzIHNvIFhlbiBrbm93cyBob3cgdG8gZW5hYmxlIGFyY2ggTEJScyBzbw0K
PiB0aGF0IHRoZSBsZXIgb3B0aW9uIGNhbiBhbHNvIHdvcmsgaW4gc3VjaCBzY2VuYXJpbyAoZmly
c3QgdHdvIHBhdGNoZXMpLg0KPiANCj4gVGhlIGxhY2sgb2YgbW9kZWwtc3BlY2lmaWMgTEJScyBh
bHNvIGFmZmVjdHMgZ3Vlc3RzLCBhcyBzZXR0aW5nDQo+IERFQlVHQ1RMTVNSLkxCUiBpcyBub3cg
aWdub3JlZCAodmFsdWUgaGFyZHdpcmVkIHRvIDAsIHdyaXRlcyBpZ25vcmVkKQ0KPiBieQ0KPiB0
aGUgaGFyZHdhcmUgZHVlIHRvIHRoZSBsYWNrIG9mIG1vZGVsLXNwZWNpZmljIExCUnMuICBUaGUg
TEJSIGZvcm1hdA0KPiByZXBvcnRlZCBpbiBQRVJGX0NBUEFCSUxJVElFUyBhbHNvIG5lZWQgdG8g
YmUgZXhwb3NlZCwgYXMgdGhhdCdzIGEgd2F5DQo+IGZvciBndWVzdHMgdG8gZGV0ZWN0IGxhY2sg
b2YgbW9kZWwtc3BlY2lmaWMgTEJScyBwcmVzZW5jZSAocGF0Y2hlcyAzDQo+IGFuZCA0KS4NCj4g
DQo+IFBhdGNoIDUgaXMgYW4gaW5kZW50YXRpb24gZml4IHRoYXQgY2FuIGJlIG1lcmdlZCBpbnRv
IHBhdGNoIDQ6IGRvbmUNCj4gc2VwYXJhdGVseSB0byBoZWxwIHJlYWRhYmlsaXR5IG9mIHBhdGNo
IDQuDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KPiANCj4gUm9nZXIgUGF1IE1vbm5lICg1KToNCj4g
ICB4ODYvbGVyOiB1c2UgZmVhdHVyZSBmbGFnIHRvIGNoZWNrIGlmIG9wdGlvbiBpcyBlbmFibGVk
DQo+ICAgeDg2L2xicjogZW5hYmxlIGh5cGVydmlzb3IgTEVSIHdpdGggYXJjaCBMQlINCj4gICB4
ODYvcGVyZjogZXhwb3NlIExCUiBmb3JtYXQgaW4gUEVSRl9DQVBBQklMSVRJRVMNCj4gICB4ODYv
dm14OiBoYW5kbGUgbm8gbW9kZWwtc3BlY2lmaWMgTEJSIHByZXNlbmNlDQo+ICAgeDg2L3ZteDog
Zml4IGluZGVudGF0aW9uIG9mIExCUg0KPiANCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
ICAgICAgICAgICAgICAgICAgfCA1OSArKysrKysrKysrKysrKy0tLS0tLS0NCj4gIHhlbi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaCAgICAgICAgfCAxOCArKysrKysrDQo+ICB4ZW4v
YXJjaC94ODYvbXNyLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKw0KPiAgeGVu
L2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDI5ICsrKysrKysrLS0N
Cj4gIHhlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYyAgICAgICAgICAgICAgICAgfCAgMiArLQ0K
PiAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaCB8ICAzICstDQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gLS0NCj4gMi4zNi4wDQo+IA0KDQo=

