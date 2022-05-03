Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2551842D
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 14:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319547.539817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlrXZ-0002Tu-Hf; Tue, 03 May 2022 12:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319547.539817; Tue, 03 May 2022 12:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlrXZ-0002Qg-EW; Tue, 03 May 2022 12:22:05 +0000
Received: by outflank-mailman (input) for mailman id 319547;
 Tue, 03 May 2022 12:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlrXY-0002Qa-EH
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 12:22:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a25a972a-cadb-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 14:22:01 +0200 (CEST)
Received: from DB8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::26)
 by AM6PR08MB4599.eurprd08.prod.outlook.com (2603:10a6:20b:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 12:21:59 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::76) by DB8P191CA0016.outlook.office365.com
 (2603:10a6:10:130::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 12:21:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 12:21:59 +0000
Received: ("Tessian outbound 9613c00560a5:v118");
 Tue, 03 May 2022 12:21:59 +0000
Received: from 31aacb8ab9c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77F88537-66E6-4775-9497-770C1535E879.1; 
 Tue, 03 May 2022 12:21:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31aacb8ab9c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 12:21:48 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 12:21:46 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 12:21:46 +0000
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
X-Inumbo-ID: a25a972a-cadb-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ipHnqoMr7z79jaXjJSeaQyrzVHLU2ucGIDI1pAu+H2gHJjp+azfzq/UPtNml9QiR7ZWOPjf5B0aJmpZ+WqpoM1j7oZMnlV0n+RzO5OYByFx52pW7Y4q8f8DS6FNcra0913V77jhg24xTsuZfvofzLzj24VpbTsP11V/a168beK/qVasf9vbFyK/GOsvQHkzKp7tFo9AorztJbcLAVObXoA78Mvy0tbZCnjlbXk2ZYV4ViWhrhuNhpE0ikKInXRxUoA0wSn90sRzyiYXN6UmP+1hVpUzyl6cryM5PeZSOeP8ZOyz8EXec79XTeX/uc15FHY9cOTiWuVytGFuCEYmQ/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT/bCtPMr0qhstGgPs+C59a/oEiXhzHhdk095fZmiuQ=;
 b=K+N06bl+h/lmlPD1jKveGArfXlImNavO5JkP31XxNH1QNGyHN4dJ9vJvGZwfgIFVKY/Qf2sndtHZMIcLycv4v8iV8x8S4cgP2SYH47qbWTjaX5GZtqQaay8LBMMpvcUnLIRJ2Q9dF7zmb45xxKQYYebBQxTrrSuuDvTZzH7M+z1yEQpASA1NfVW8g4aKVCkgTZNmAh0aSDzDq/PHTyY3hjl4p+kz/ov67no5djSFSIKAuFuaLC/vk6B3pldKbjB3aK0SeUh+shF5+6Xxg6CUTtu4+MwCc3LoRGKUjYFduDdVcGffYmZETzHMRCFYVWe25A7cJXMJ+d1whHGTqmPclQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT/bCtPMr0qhstGgPs+C59a/oEiXhzHhdk095fZmiuQ=;
 b=BOwlr9JVxqj/8qWeInWZs7XCYXJvKZJHr5WD+18FpcNsCm/VLdAZSqyF83JZiMx7PG4BfMKck9Hc5mbKezer3SM/Wld/Vj9VV/tIz945DHY/lDtyH0wrnlp5v/BOhLVG9DowIK5nnzUXNglT1AlRzYhkDwoBfXAYo5TH1klevtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd1c0667f994701a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgHZ0cg99AHbsYXC3Autgv1Jj7Jkk7qG7XohPFva85z9Xu8u61sGlZbqzaKx4bWuNbDGEw8hiTwilCqYLWQGwxNo2G9Sk0plRHbQmjhvPbJFFTZecDdIhL3PJURtrMz8taTGT/XIPIM/2yv79EBwHIEsV3eZG5ZSxrRTlf0rHALHpGQxsrngY/pwfg9Ze9zeba4zGRUk2AITjRwODJdKkgwO0TSKILtVVAjStWHFN12PPobeyK1nhk4GFKvrXJw7TbatRR4lBrU/UsImQtslzkYOTjWTE4SosRXRUbRh+ZStDjI5ldevT8NJidBtTnBe5cgOmJaqNhjY7rCjgijNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT/bCtPMr0qhstGgPs+C59a/oEiXhzHhdk095fZmiuQ=;
 b=UErwgLDWU/+8utvI10hRKQ3gjhwVHJ6uxmQJxsOqWaR/TZM3RvUtLfA5UN9DYy7FxVSWW+SWeyc5rhMYCzXNCyM7+QHyZAU6sKoeM+tFUm1i4t5WkaaUawhGmbhBwSm7l3aygR0h9zITjAjXkI2pQp2e4C3EdsoX2QgwIAVokJ8zap0iiZY2asMmSWnwrKMbHAMoRCNrL0/q31M+0j+adX7asi5CcI+mm6ZxqXuw4K5rnNYx1neI9h/ifPLMGKSmZOwSj1OJggbWgRfgCzIXcpPFxa79XM1mDLMbxSIlP/QM4XJgCp26hoDgLB6VuMwWQKSFtgnM+M6jsi5o8dvrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT/bCtPMr0qhstGgPs+C59a/oEiXhzHhdk095fZmiuQ=;
 b=BOwlr9JVxqj/8qWeInWZs7XCYXJvKZJHr5WD+18FpcNsCm/VLdAZSqyF83JZiMx7PG4BfMKck9Hc5mbKezer3SM/Wld/Vj9VV/tIz945DHY/lDtyH0wrnlp5v/BOhLVG9DowIK5nnzUXNglT1AlRzYhkDwoBfXAYo5TH1klevtg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Scott Davis
	<scott.davis@starlab.io>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Topic: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Index:
 AQHYXijv9StER8938kifKUVqRlYIt60LmLoAgAABtwCAAAEnAIABTJWAgAAd6QCAAA5LAA==
Date: Tue, 3 May 2022 12:21:46 +0000
Message-ID: <375845D4-92D7-4B8B-A030-019CCB0DADDF@arm.com>
References: <20220502133027.920-1-dpsmith@apertussolutions.com>
 <20220502133027.920-2-dpsmith@apertussolutions.com>
 <CAKf6xptU7VxGzaHe=jVc0O2fbZfQi1Rmf0hDsJzOB-9k7=4W-Q@mail.gmail.com>
 <7db6b050-7ace-406f-550b-d407c57cfa59@apertussolutions.com>
 <15634549-bde3-873b-862c-37ebb891ba0e@apertussolutions.com>
 <D7CF00DB-F6E1-4B81-9597-13CFAB6102B0@arm.com>
 <89aad289-8ab9-c43f-f048-b302bcc0f568@apertussolutions.com>
In-Reply-To: <89aad289-8ab9-c43f-f048-b302bcc0f568@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dc7c73ac-5867-4a7a-67cf-08da2cff8554
x-ms-traffictypediagnostic:
	AS8PR08MB6904:EE_|DBAEUR03FT052:EE_|AM6PR08MB4599:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB459912032FD534FF0DE40364E4C09@AM6PR08MB4599.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Eklefom5rVnhX5bC7d4Q3bio+cvEfUWQxjeH6jLDS4QuKIPEQzZa33O6NUlrzUPUH7cR7BBwQdjEh1mGpQ6qzBnF5HZNMUrJHmr5PHMmWxcds1P47bartJWVEMunUh+NHtkYg8aBMDyVOuzOV4xZTUUgDYdbFZeVk2Py2VW1P0l2Y+xE9v4QydV6fBgUZPNrdTBvrqVrtwRCQgkt1ecM4u7XuHPvcBs1LzbCzWLQwagRbhgo1TPG1fqgnDzuL7+rKRoUObmkZ8N1NRI07LW0+C8IYXhejaPNFMUb9cyf5H8+uzAJOV+pyCCdxLVFfge9bASgD9dO8JzuhKSFl0Y4kbMSF+pDMLVCn7qiebnWhdEQ0l4RIzlZmfHvRkpVHlGpR5QWLLivy2Hyge2aIH3zsPIwwk3512G53jW1F+UspzsxJLHgkhpvcbKMZU9XEaYifbZFSHhAKTz3Swj+L0m9VNsELT6HUfMjHbqW/u7l2/huh2nQ8KDNNfYwmmHnJNJSawhjCOjtcM4cuz0km+wORXP+UzJ8Cdsyz+xPa3Xz376IGCJmopLjooL05WwHzVBOYpHe1eDbyefk41LJc+K27i8qmhJOUD8LnmnTgMm6Yv7ES8U3KMCE/BI9U/ZtsAy/cTLCzXrfeycNJF7nIHtJmN6/ja4QmEw1GdTmstFRsOyI0lU/VKNWVUZK0aFqIU9Mx/IGc58SDAbsMgy4zH7IOD+wohijbPygUhNsn4OHhaZV/6tm3IJLMdKpFNCnAUnU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(83380400001)(71200400001)(186003)(86362001)(38100700002)(508600001)(6486002)(38070700005)(36756003)(26005)(6512007)(4326008)(76116006)(2616005)(122000001)(66946007)(8676002)(64756008)(66476007)(66446008)(66556008)(6506007)(6916009)(33656002)(8936002)(316002)(5660300002)(7416002)(54906003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3784C09A8EB27448C83C7712C84A891@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbed2737-dec3-46d0-9a94-08da2cff7d91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2fJoYVMpqpLQAW+L1eWnaQhp07UNx2uVKtUFz2b8kvA1VYifT3nUzROEmGqhj8laK4Lz7Kt8WZq61fbg/jzt4hPdWjRGa07NvrcH+R99HrXAgD6PCyFst6KKwY7JH4Wwi7X5g67Lh6+QpcrYnrMwawFmkZT6V6uISeyC1AZGnNYeYZ/BAQWUToB3vTIFnctFIdSQTF3NjNjigza3aFrSPOAY7XG6PbLicobHT/EwhTS4FeievF1nTBIxz7OqmrKWm8EZbV81b3tl2fxbQqeAcw1ct4NhoI/GPuM0yoQVJO46XrJArMTWg4twqo3c8BI2+OPDcgMxF8C/6nXcDSqY2cHN2wwEi+12S52buKZrU8bVK5K7OxXXVNJ8g8AumYe7LC5vyfgp5vKL6nn55fW04LOlPrBdcpWcx88H+Q/D4gU48CbxubPYnm20VqURBG+2BTsnSc28Lh730FEfKmLpQwmD902k/XWvr5MvPcE7V27XFy5SgR2ehSNCkPuHf3iJaPEscGrSC+GYgLc4l6mCxCaushdsyKd2vUTJpLrkrbH+ZLeKg8rQvb+L3P1IjAZM4JZdPxPiBj/IeQxuwpE1hMZi1SghElhYgyH/Fkqvaxk242fGNqOShuIxjr5rIboUDrkmPOAPc9fPANMDZyaBMAptC7FrAMF9QGoHx8mBGCPydko/yvZOu68gi1FwJXXU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(40460700003)(33656002)(336012)(6486002)(54906003)(70586007)(47076005)(70206006)(82310400005)(2906002)(83380400001)(36756003)(8936002)(5660300002)(2616005)(6862004)(86362001)(8676002)(4326008)(316002)(356005)(6512007)(26005)(81166007)(6506007)(53546011)(508600001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 12:21:59.1530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7c73ac-5867-4a7a-67cf-08da2cff8554
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4599

DQoNCj4gT24gMyBNYXkgMjAyMiwgYXQgMTI6MzAsIERhbmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBh
cGVydHVzc29sdXRpb25zLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiA1LzMvMjIgMDU6NDMsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIDIgTWF5IDIwMjIsIGF0IDE0OjUzLCBE
YW5pZWwgUC4gU21pdGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+IHdyb3RlOg0KPj4+
IA0KPj4+IE9uIDUvMi8yMiAwOTo0OSwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOg0KPj4+PiBPbiA1
LzIvMjIgMDk6NDIsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+Pj4+PiBPbiBNb24sIE1heSAyLCAy
MDIyIGF0IDk6MzEgQU0gRGFuaWVsIFAuIFNtaXRoDQo+Pj4+PiA8ZHBzbWl0aEBhcGVydHVzc29s
dXRpb25zLmNvbT4gd3JvdGU6DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1
cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+Pj4+PiBpbmRleCBkNWQwNzkyZWQ0Li5iOTA1
NzIyMmQ2IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+Pj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+Pj4+PiBAQCAtMTA0OCw2ICsxMDQ4LDEwIEBA
IHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsDQo+
Pj4+Pj4gICAgLyogSGlkZSBVQVJUIGZyb20gRE9NMCBpZiB3ZSdyZSB1c2luZyBpdCAqLw0KPj4+
Pj4+ICAgIHNlcmlhbF9lbmRib290KCk7DQo+Pj4+Pj4gDQo+Pj4+Pj4gKyAgICBpZiAoIChyYyA9
IHhzbV9zZXRfc3lzdGVtX2FjdGl2ZSgpKSAhPSAwICkNCj4+Pj4+PiArICAgICAgICBwYW5pYygi
eHNtKGVycj0lZCk6ICINCj4+Pj4+PiArICAgICAgICAgICAgICAidW5hYmxlIHRvIHNldCBoeXBl
cnZpc29yIHRvIFNZU1RFTV9BQ1RJVkUgcHJpdmlsZWdlXG4iLCBlcnIpOw0KPj4+Pj4gDQo+Pj4+
PiBZb3Ugd2FudCB0byBwcmludCByYyBpbiB0aGlzIG1lc3NhZ2UuDQo+Pj4+IA0KPj4+PiBUaGFu
a3MsIGJ1dCBub3cgSSB3YW50IHRvIGZpZ3VyZSBvdXQgaG93IHRoYXQgY29tcGlsZQ0KPj4+IA0K
Pj4+IEFoLCBhcm0gd2hpY2ggSSBkbyBub3QgaGF2ZSBhIGJ1aWxkIGVudiB0byBkbyBidWlsZCB0
ZXN0cy4NCj4+IA0KPj4gSeKAmXZlIGJ1aWx0IHRoaXMgcGF0Y2ggb24gYXJtIChjaGFuZ2luZyBl
cnIgdG8gcmMpLCBldmVyeXRoaW5nIGxvb2tzIGZpbmUsIHNvIHdpdGggdGhhdA0KPj4gYWRkcmVz
c2VkOg0KPj4gDQo+PiBSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KPiANCj4gVGhhbmsgeW91IGFuZCBteSBhcG9sb2dpZXMgZm9yIG5vdCBhZGRpbmcg
eW91ciByZXZpZXctYnkgdGhpcyBtb3JuaW5nLiBJDQo+IGhhZCB2NiBxdWV1ZWQgdG8gZ28gb3V0
IGxhc3QgbmlnaHQgYW5kIG1pc3NlZCB0aGlzIGVtYWlsIGJlZm9yZSByZWxlYXNpbmcuDQo+IA0K
DQpIaSBEYW5pZWwsDQoNCkl04oCZcyBvayBJIHdpbGwgcHV0IGl0IGFnYWluIGluIHRoZSBuZXcg
c2VyaWUuDQoNCkNoZWVycywNCkx1Y2E=

