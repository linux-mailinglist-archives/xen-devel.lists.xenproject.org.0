Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE77856875
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 16:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681876.1060860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1radzi-0006sB-Kl; Thu, 15 Feb 2024 15:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681876.1060860; Thu, 15 Feb 2024 15:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1radzi-0006pw-HQ; Thu, 15 Feb 2024 15:49:50 +0000
Received: by outflank-mailman (input) for mailman id 681876;
 Thu, 15 Feb 2024 15:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLkp=JY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1radzh-0006l5-Qw
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 15:49:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2606::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8319b3d-cc19-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 16:49:47 +0100 (CET)
Received: from DUZP191CA0068.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::29)
 by DB5PR08MB9998.eurprd08.prod.outlook.com (2603:10a6:10:489::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 15:49:41 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::6e) by DUZP191CA0068.outlook.office365.com
 (2603:10a6:10:4fa::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 15:49:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 15:49:41 +0000
Received: ("Tessian outbound 081d54b8cc4c:v228");
 Thu, 15 Feb 2024 15:49:41 +0000
Received: from 0fdfc400244d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B7BED59-95BE-4BCA-84CA-642802FD5C86.1; 
 Thu, 15 Feb 2024 15:49:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fdfc400244d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Feb 2024 15:49:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6375.eurprd08.prod.outlook.com (2603:10a6:20b:31b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Thu, 15 Feb
 2024 15:49:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb%7]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 15:49:27 +0000
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
X-Inumbo-ID: d8319b3d-cc19-11ee-98f5-efadbce2ee36
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UmkV5bZEB3zMhJ2mrLRgAQAwmsoFjzKdieAHydW0oAVzWscut0P0n25vR4+PwEyc16rW8B+ny0IYX/fWn1cDCNH1hVz5g/zEwgegEc9i0Wn2nXMkAxSyfpznTDc/4Czhseu0HZZxd4mpA6RFPnAWH7DM5s88pig48kXXfyxvru0x5yZthTl8v4mBXYWCOYaji7v9HVR6II4RRH7JhdE6wcGk/xRwgGMzoPgDU0eCdf5tsQ4wUrrS/JxcrniT2GeA2Igbq9rhDb1nblGGe1IvmUV7nsxhCvOaQ4MK3/QMsbwy8jx0QbcoLoK7Yu9up3rlwqE64jqYgvPzIGt/T2g5EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WCZ1M3VC/1KYKTG9M3PBbed7brqmkEF+fhFYWwZpf0=;
 b=i6o20O7YdLX8WTsxuSzJq3IxBPDkppPNocGt3AF5cBZhBAr9gtZ2ZtyXMeT3ZqaaWFcPaTJF/2ZU0ncbuiffFhWbef6STL9jidH/laYpaKaGCR7R3tTMMq4RqwzxewuGjJbA6s5DUFpG//pt10Lm/v88tDtAjwk6ueyd3ILJBb6dec4wCDFSJ82Y5fHbjGP/RBosEe/ato1PA9eFxkJYiFFF0YPgDzpVpEcyTIrTQH0KkU/cvkkkfs50b2v/Evou/Nicfidc66okylI7A5ZV1c4NxwOW/liLhjYdftqYIAFqfwcOVWRkUSazMk9+5qNaUfiS6b09clILaYpJy/e+yQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WCZ1M3VC/1KYKTG9M3PBbed7brqmkEF+fhFYWwZpf0=;
 b=2FBp74bUt6YEbHnZM7n2p+rWHjt+klGFDZGV4r8BEWB0w/3MmkFFv1DCe7xmi+7su7uU7XSuKLXRtbfgBxeDedPvXj/CxQSAKYbMRbrmfMyabKQbfpu0B2KpH2ES05ESM2D1kjqcvpqhQb7kuKQSqtyJhOSoJCU06RWvf+1XxAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f755adf48f08db8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXVEGdfc6jyC/7NsxXStFl9jY49dFPo/naMFxKWwBdTz5ttamhZh2J0x4MaaFpB3u7apunAPS8d+ZxDBLBjQggPQ0b7OuRvwy7i06miXudOJkP9HsMxkBxyh8URXDySqHGQPz7khIVw++ZLXPpbB+K4PKtL4+4ofekl8wyRWxLm4on3yIHOI8RilmtovwDmHaVvfXSoU96wY0MypXki+W80OMu1yGS62bznpIFhnKgq6cM3NwIq5rLSZDNVcVni7YNMxU1s+JjfAe2adnXqqjba17J2/Z4ZLONxVE0EwM03b40IpugB4g+gMKKUoHn+UQFV1adeMbJkP2VDUMdxofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WCZ1M3VC/1KYKTG9M3PBbed7brqmkEF+fhFYWwZpf0=;
 b=c7zWhiFaLoAimoxhRner2uu3OMN9s0O4bdAboTHcQD0N1y6L9atMiuJ3rF4oPeKVnxxV4FfJV01vw2NJaSAtySZ6snf0/XrFETkOOr5vX2YYq5ylgefvC7253OhLdAXKOcmMJK7ninqAskqegsSNm0XWTH3xdTubgAnt2ksnOQ6wHVn7h/YPOKne5K7Re0rUf13KwEwT4ADR8V0F+xBOxR6G3mVjWJDB6ReMvnNGo0XyJBIC9dhqK/boiHOuA58MORa3P3asDdLLb5m9rNG1r3KhtrboFwLpvjXEBkBr6PxwDfbrlPiG5maz+B3Wh5H0225+ijE5XlYtYZqImm8E4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WCZ1M3VC/1KYKTG9M3PBbed7brqmkEF+fhFYWwZpf0=;
 b=2FBp74bUt6YEbHnZM7n2p+rWHjt+klGFDZGV4r8BEWB0w/3MmkFFv1DCe7xmi+7su7uU7XSuKLXRtbfgBxeDedPvXj/CxQSAKYbMRbrmfMyabKQbfpu0B2KpH2ES05ESM2D1kjqcvpqhQb7kuKQSqtyJhOSoJCU06RWvf+1XxAg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Make hwdom vUART optional feature
Thread-Topic: [PATCH] xen/arm: Make hwdom vUART optional feature
Thread-Index: AQHaYBz49ii/8gxOY0aM41gWsHqs/bELjNUA
Date: Thu, 15 Feb 2024 15:49:27 +0000
Message-ID: <44B29A66-D497-439B-B6AA-C6A2CC1115D8@arm.com>
References: <20240215143947.90073-1-michal.orzel@amd.com>
In-Reply-To: <20240215143947.90073-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6375:EE_|DU2PEPF00028CFC:EE_|DB5PR08MB9998:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b4d6d2-ca3b-4bce-33e8-08dc2e3db929
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rE5qTt87AuiQayUVzFSOqyuBp98zGOIZeUzuxZxV39nNCPIaT52z891q46Fic2WdRUZlW6avqUk7zFrCwb4ROqpAU2P66x0KDw1FQBKmQlzMNn8/zEBGNvIZj5AzPlw5EXxuK1iGGi/Ewv1MqNRKxJ+cDCy2wMvjEuJzuijCch/Tk1Xkijh9ZkfNUqbSQ2sJClwZdX3/VUVgZvOMdjz6twGrPVMVjLDt8q58CESYqtMaybHsywKB/pqYTCGXac8T5Gg6p/O5Qz5MGsOJpMOJl9XCLZOd1ymiZMiFXRiXxqDTdqcEhEkuDiP3xsQLcYHwSPTd2JqB1kMQqdzHgwQelXCKjadbdGH7z/8MwAEwk0MO4PLxJRICpyUNUvjSZ9OucsBJH+oL9CducuwV3c5eWF9j1vJ3j1/Qe2lxNc1jX/IbvZdtO2YF9QvxzGVuLDIkAU3sZLfhrCUz0rG99XW53zV2Fz6zyNOIgimvb+m56jRk/SSUPTazJVrN3m3Olufo2Cmm6481HdJiB7K4tVh4Vlr+CkfRS9+RIm/r4gdIxc8pkTaRKR6OjfQy0l/OeWEkPsFAUUjvZUWxGOWwNmQ1qtFyvmV0qoIExMbyhwf4s2ogppZgLkRSK6RerTtOVI9M
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(33656002)(36756003)(86362001)(4326008)(8936002)(6916009)(8676002)(64756008)(66476007)(66446008)(66556008)(66946007)(76116006)(5660300002)(2906002)(4744005)(83380400001)(38100700002)(122000001)(38070700009)(41300700001)(71200400001)(53546011)(2616005)(316002)(54906003)(26005)(478600001)(6486002)(6512007)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CD5026B82889847840D75352ED950C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6375
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d8dd242-23b2-4b9b-46d7-08dc2e3db0a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EhSmtpC5+sUWxeNC72unvJTM6ouyMXkOsAlgwptwT0YgOKW0JlJu4rVWCbcaTxpO2xcDDcela0U6CyoWWV6/r8YgvcynAXiIf0Zce3QExOUxjKl2uAfCSPutZaHkuWsN2ZppKR3A86kGV5TSIN2p8IpfVrogjjYFdT4A+9hVp953p4xU1oyjWC0H7zwD/OLz2nAgydV+t0nu82vNtp/wWbJv5X7o1hi4Td5EBQBz48qar5T2tIQQEnH02qDP8oJ9GYy2waL629e6VWAqb7AQGtMjF1wqWEdW6R5Dmw/Bb4sgXJP/pOKE43jVImYwxm27Wf7cI72Z0UOJP1+whAbdqGrosZrdsCTjc8kIY/MyZgvpPi2eGApWkyQi0yR5h9r1GZ8HH6tK5tBhR5tuU77ATCRObwMA7ELbf+6JC2UvRg6G8J9xzfz2iNn9Vy+SPz/0MNMhfGv0UAtknCPzujJ2d90xHPSrBh/DVCCo/TyRD8zmutZfGrvbVy4a1FN9u1KvSLj4OXIto05J+gNdBTldqWEpMH+sdRhU+kI0hVLrc91kmXY34SZMYAsqjYY6NQONnlj40n17OKT+l7GDcYVUxKeLYTXOPoURBscAsSpIXjnA05+KjxRFjDDJ3SfwP2KiqGQs79fXIXZBNGMQAbyKEu/KMqlXRhN8+4aUjUxPjk8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(36860700004)(186009)(82310400011)(40470700004)(46966006)(8676002)(70206006)(70586007)(5660300002)(2906002)(4326008)(6862004)(8936002)(356005)(107886003)(81166007)(33656002)(36756003)(83380400001)(86362001)(82740400003)(53546011)(478600001)(316002)(6506007)(6486002)(6512007)(54906003)(26005)(2616005)(336012)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 15:49:41.3979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b4d6d2-ca3b-4bce-33e8-08dc2e3db929
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9998

DQoNCj4gT24gMTUgRmViIDIwMjQsIGF0IDE0OjM5LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEF0IHRoZSBtb21lbnQsIHRoZSBoYXJkd2FyZSBkb21h
aW4gdlVBUlQgaXMgYWx3YXlzIGNvbXBpbGVkIGluLiBJbiB0aGUNCj4gc3Bpcml0IG9mIGZpbmUg
Z3JhbnVsYXIgY29uZmlndXJhdGlvbiwgbWFrZSBpdCBvcHRpb25hbCBzbyB0aGF0IHRoZQ0KPiBm
ZWF0dXJlIGNhbiBiZSBkaXNhYmxlZCBpZiBub3QgbmVlZGVkLiBUaGlzIFVBUlQgaXMgbm90IGV4
cG9zZWQgKGUuZy4NCj4gdmlhIGRldmljZSB0cmVlKSB0byBhIGRvbWFpbiBhbmQgaXMgbW9zdGx5
IHVzZWQgdG8gc3VwcG9ydCBzcGVjaWFsIHVzZQ0KPiBjYXNlcyBsaWtlIExpbnV4IGVhcmx5IHBy
aW50aywgcHJpbnRzIGZyb20gdGhlIGRlY29tcHJlc3NvciBjb2RlLCBldGMuDQo+IA0KPiBJbnRy
b2R1Y2UgS2NvbmZpZyBvcHRpb24gQ09ORklHX0hXRE9NX1ZVQVJULCBlbmFibGVkIGJ5IGRlZmF1
bHQgKHRvIGtlZXANCj4gdGhlIGN1cnJlbnQgYmVoYXZpb3IpIGFuZCB1c2UgaXQgdG8gcHJvdGVj
dCB0aGUgdlVBUlQgcmVsYXRlZCBjb2RlLg0KPiBQcm92aWRlIHN0dWJzIGZvciBkb21haW5fdnVh
cnRfe2luaXQsZnJlZX0oKSBpbiBjYXNlIHRoZSBmZWF0dXJlIGlzDQo+IGRpc2FibGVkLiBUYWtl
IHRoZSBvcHBvcnR1bml0eSB0byBhZGQgYSBzdHJ1Y3QgZG9tYWluIGZvcndhcmQgZGVjbGFyYXRp
b24NCj4gdG8gdnVhcnQuaCwgc28gdGhhdCB0aGUgaGVhZGVyIGlzIHNlbGYgY29udGFpbmVkLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4N
Cj4gLS0tDQoNCkhpIE1pY2hhbCwNCg0KTG9va3MgZ29vZCB0byBtZSwgSeKAmXZlIGFsc28gdGVz
dGVkIHdpdGggYW5kIHdpdGhvdXQgdnVhcnQgb24gcWVtdSBhcm02NC4NCg0KUmV2aWV3ZWQtYnk6
IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NClRlc3RlZC1ieTogTHVjYSBG
YW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg==

