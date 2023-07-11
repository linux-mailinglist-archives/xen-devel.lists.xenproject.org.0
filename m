Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0274EA00
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 11:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561632.878092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9So-0000ls-52; Tue, 11 Jul 2023 09:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561632.878092; Tue, 11 Jul 2023 09:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ9So-0000jw-1E; Tue, 11 Jul 2023 09:15:18 +0000
Received: by outflank-mailman (input) for mailman id 561632;
 Tue, 11 Jul 2023 09:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pXgh=C5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qJ9Sm-0000jb-N4
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 09:15:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716857a3-1fcb-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 11:15:14 +0200 (CEST)
Received: from AS9PR05CA0040.eurprd05.prod.outlook.com (2603:10a6:20b:489::23)
 by AS8PR08MB6199.eurprd08.prod.outlook.com (2603:10a6:20b:296::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 09:15:11 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::ac) by AS9PR05CA0040.outlook.office365.com
 (2603:10a6:20b:489::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 09:15:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.19 via Frontend Transport; Tue, 11 Jul 2023 09:15:11 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Tue, 11 Jul 2023 09:15:10 +0000
Received: from d3b7c04aee46.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F3B9CD6-762B-487F-BE33-DA14131ADABF.1; 
 Tue, 11 Jul 2023 09:15:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3b7c04aee46.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Jul 2023 09:15:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8954.eurprd08.prod.outlook.com (2603:10a6:10:465::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 09:15:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::eaec:5611:c427:57f7%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 09:15:01 +0000
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
X-Inumbo-ID: 716857a3-1fcb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btFhdzdGVwQJ4TZosIBJIEqkkmb25IwEuFAikTUp4P4=;
 b=Gr33cbi4g7qwzXYvC/+GKszNEJn/mZlIcNxkSyOLG3bBScl65e0p6aRE5puAWOtIXDA4+9kRp1C8CMiCDSA70RQEoCUN1qB9rycjkRtur9IkXfnUxsQq3NnJdqvWdl+IzZ45/e8eNwskQn5CaYOxP6ZBPzY9r4cA5aMfc6kAscc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 44786e71955f96b3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsPMYqMqwQHQ+CUU4w4mLd+dJuH/zi7dbDyN5NMrMbaBSVu0zPqlRQkIyxW4SPea5X4f8Dd1vKMgTEn+6rEYFV3JkjpoajrMwOpsPJN6sTZivRFOhCqDJ+fKSXqiuLskXixM5gL6dYet5ZAosZmzFtFoZpl6BAkcMXyuT2dIKfPfqS+grSra0pOoSUOX6muefx48GnFBAz5vOdXmm9mKcHIYrupN8g6BPKStwmI4H9vRWNVnStRbUcHMqwN0B/vY59MJpdiWtecsQa9Nz3nRypyoexUSx6sEN4+QpMBD+CuwIIERzD65awpP87kdnPJA/scT9G8sDzj+hXNZdvslRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btFhdzdGVwQJ4TZosIBJIEqkkmb25IwEuFAikTUp4P4=;
 b=FiP2v/zVYE5I3wQZY1vG7yJNdDiVfDksYD2JAHOdhG6u58egXMSmSM+uEnwBnKLZ1nrhttVrZv8qQ3kC9S19flmxPqSoGKedfdS2w2RK0KDBHpju3EZDbBFksyfISqb8JiU3/AQtdcJ75BBsyaMwOL73567JJOh/BJEeH6gSN3pZUuxXNoYyo3QG8FU//Si5Ywif5V15sG7bA7jotk1yTIRLGQRbF5bKAhldAitpjC3wAK4dlP582xLqAs3c3OaDbbtAVzH/pN7Rf945zBge7yomneJrCe70MJt0qxYuqJTDw59MUCAikU6J1NmGdvrYqsDPKtUZrOeWHoLAstqV1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btFhdzdGVwQJ4TZosIBJIEqkkmb25IwEuFAikTUp4P4=;
 b=Gr33cbi4g7qwzXYvC/+GKszNEJn/mZlIcNxkSyOLG3bBScl65e0p6aRE5puAWOtIXDA4+9kRp1C8CMiCDSA70RQEoCUN1qB9rycjkRtur9IkXfnUxsQq3NnJdqvWdl+IzZ45/e8eNwskQn5CaYOxP6ZBPzY9r4cA5aMfc6kAscc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Fix domain_handle_dtb_bootmodule() error
 path
Thread-Topic: [PATCH 1/2] xen/arm: Fix domain_handle_dtb_bootmodule() error
 path
Thread-Index: AQHZs9HrmE32Z8KSv0SIoy8VDf7goa+0SKYA
Date: Tue, 11 Jul 2023 09:15:01 +0000
Message-ID: <5B7AB94D-613C-4B78-938F-81F843A7101F@arm.com>
References: <20230711082931.5402-1-michal.orzel@amd.com>
 <20230711082931.5402-2-michal.orzel@amd.com>
In-Reply-To: <20230711082931.5402-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8954:EE_|AM7EUR03FT040:EE_|AS8PR08MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 57744546-b9a7-4e44-c9ec-08db81ef5421
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5T5u/EQ8Lq5lW6Vk7kSNVWYyk+eBoQvKLy0diSs4wuwHlkHMSHNJpvA1nGMyg85KU/fHXBsmdeZyUwY2ar2FEAO3ZbdjIDYOXfyjXPk78F1WjxyUCpvwj+2R9aroMJRJY3mjyQayAZtGro3qqY1nI3xjKYK4W8bHS7xcHKuEHFW2iO25m5Y/TPxwV49DKDxYtxYntUtUy/0RZfRIWGsgD0FxUkNknrcIy74t5EvqYZZywyNwvCAYKDJwknOFKnYVEScQevWF6OIgnRHvZuLmqCvMSTRDYA8eI6wGl94jDwHejiZo0OQFte85OGNpoKpB2mwqu+6GY9ncXLQ/XIkZ4IgfL9e+lZx15HHCVfA88rmYAXwtQylPIWl/F/c0DlKpEoTtmuboK0eDeRcsE38GZMB/ywJHmmEhXotbrP4vvoshmu+WjpfILNQ28tTFBvxeI9QaaD1MByDQRnaZ7OPf9VXNykZ5if5mGVLcMPHn5FFuT92az3Vskwt4rf4Kt+MIgwzxJhNXOtp0eO7JPb29euhMFuL55te+oZWzrY0x5thOTNA+ugcgzqCYpYHkKs+Qtd/Y1D+p++/EjvJ1pRHdqzNKPD312OCvR4oVlvcNsMt8Efpfz94+ozwuOwgzR5xUOm2tEdDoITxYwCqvMJii7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(76116006)(6486002)(478600001)(71200400001)(91956017)(54906003)(83380400001)(33656002)(36756003)(86362001)(38070700005)(2616005)(4744005)(2906002)(66946007)(186003)(6506007)(26005)(53546011)(6512007)(64756008)(122000001)(38100700002)(6916009)(8676002)(4326008)(316002)(5660300002)(41300700001)(66476007)(8936002)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69C7656B976A7947A88501C0BDB9FD0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8954
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aaff823c-4538-432a-a0de-08db81ef4e65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BXo5X3Z7ugpDtD77FFcTuDGqrZHdDUNlPtX7o8l2RIcG59hpRp3gNrzemlJbZdtRcVK/bD5Jhtnyqlr7BV96gaek4rUWC7f8a6Bfapux99x/3i4XOXN529GnbeJpSvm16rrFWq2A3dVZjaXdalRkf5sQsbHv2N8oYHTS5lZpwggku8Vvy6ay3jod00HF9BmHDZrPE+PrB4I2wCsAiGFaL4xPXkC64aOFuTvQKsU9ATqK/LuYtVq/P1XwadcthScjBSghODhf+6tRQf/0XezqXvd+1Pj85VZYtHk32F1nOPXASc/MmNhuOx1EwAAiuXr+VIfYMInK+3biDZPLzrpo0fuTz82Q71WBGag7fgfFzSqugD9EG3o0LaJuah2jpplI/oVnOk1EDMDPt9PvPvVkInfX5yXvA/sPm0AcPpjY4751vBy3DVzo51XhYOk03QUBFWovV1eXEPQoEopAaDQe34Xj3LZ8ZZ8qjBfagt3TIYzrnVdG+6PLVZyvJNalEZVNHg2cw/OOIvFdoRoRmhZC8NlsvygLMDxh98G5NNvjERJtOwITKBTwW4xPgPfrzBmx+fJVhtXeNDo/XoXJDfyr1HkT3j+5QFHxD6wktTwStKz4rU8jNQnxCOO4MpG1oSozFPuFjEPnrdW//cUyGWe5ZEIJXp/pVmNeKZeDkXPfTrBnnblkMVXYVxYZbEDNa1mgxAzL3DhF800BdK3crR+vCOfhm5EOoAiL06Esd0OV49Sn97zV7DuRLmnNdxL9XyMF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(2616005)(4744005)(2906002)(47076005)(83380400001)(40460700003)(336012)(36756003)(33656002)(82310400005)(86362001)(356005)(82740400003)(81166007)(40480700001)(41300700001)(4326008)(6486002)(6512007)(316002)(5660300002)(107886003)(8676002)(8936002)(6862004)(478600001)(70206006)(70586007)(54906003)(186003)(53546011)(26005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 09:15:11.1099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57744546-b9a7-4e44-c9ec-08db81ef5421
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6199



> On 11 Jul 2023, at 09:29, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Fix the error path in domain_handle_dtb_bootmodule(), so that the memory
> previously mapped is unmapped before returning the error code. This is
> because the function shall not make assumptions on the way of handling
> its error code in the callers. Today we call panic in case of domU
> creation failure, so having memory not unmapped is not a bug, but it can
> change.
>=20
> Similarly, fix prepare_dtb_domU() so that the memory allocated is freed
> before returning the error code from domain_handle_dtb_bootmodule().
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



