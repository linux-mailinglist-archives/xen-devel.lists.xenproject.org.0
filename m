Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043438B33D1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712589.1113371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hla-0001sx-AW; Fri, 26 Apr 2024 09:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712589.1113371; Fri, 26 Apr 2024 09:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hla-0001ql-6d; Fri, 26 Apr 2024 09:21:14 +0000
Received: by outflank-mailman (input) for mailman id 712589;
 Fri, 26 Apr 2024 09:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Jki=L7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1s0HlY-0001qf-NX
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 09:21:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50d20381-03ae-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 11:21:09 +0200 (CEST)
Received: from DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) by DB9PR08MB6394.eurprd08.prod.outlook.com
 (2603:10a6:10:25b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 09:20:35 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::e1) by DUZPR01CA0056.outlook.office365.com
 (2603:10a6:10:469::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Fri, 26 Apr 2024 09:20:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19 via
 Frontend Transport; Fri, 26 Apr 2024 09:20:34 +0000
Received: ("Tessian outbound af213ececc3d:v315");
 Fri, 26 Apr 2024 09:20:34 +0000
Received: from ce6ff2aa42d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FB6CFCD-481A-4923-8BD8-A4622CE289EB.1; 
 Fri, 26 Apr 2024 09:20:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce6ff2aa42d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Apr 2024 09:20:28 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB9705.eurprd08.prod.outlook.com (2603:10a6:10:45c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 09:20:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 09:20:22 +0000
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
X-Inumbo-ID: 50d20381-03ae-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WlDJTIOvtiQM5Jcv5i47jKbeIcx9HUR+98/h7Tp5ZVr/v579SwHv9CHqMrBMSFkm5MwEy9ciMkFVxRiOvcFJatAjZt9BdJtnPo6nqYHsqB0IY4wErZHKHvlNif3NxolbW0sGeWghSUJx1LkH0WrSN1hDeCwV8EL/17WJzVvXh6B+4AV0i0cbKIgPTZAlswDaDwKBOx12xaifRVOmHs520ClpCLNEh+lga4hJVaC2r9bC8oJj4t7M6n7ZQKJV/HGWyex5kHdrvK14J0GRLnLkKkWjlBg+KpjcqD9jF7gHtOnMqqF1el5oZSofkwwV236/7NFhtoEgQ7aD5RP0moDPkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhLO8DX4pcflUzVcKBchtSr/A7XjhdfxygCKy8FN7Pc=;
 b=aE5ZXp0k5FsGZts5zs59I8M03mwrKmdDf55xyzFs5nHpD1jopv9ePs7OljnuZaFJ434sXGBw1MigPErwL7kqj2thmYieO+v+eoFTN6XPhF/+A2mXjkJt3plJ7GOb7L99HbsvQEMuTyOOfy5Ld8itDrtu33LjV2vbM3CSiAn0DBlagG3iXz6ThP9zB6EwF33LpWpZJEu/HpFeLKLSv1wcEQFJJRyBysMqt/R7qCkDqG08w7zyZy4RIxEUyIu5nvyJx7pwBpBDBL7YHQ1qf+JCp0m5Tjh4Iqv7TXLsA7w9Qhu3hOEyZo7yli3v31+Nl8TsaaSdl2mlodvMVc7E9rOzPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhLO8DX4pcflUzVcKBchtSr/A7XjhdfxygCKy8FN7Pc=;
 b=UifFiXRCtM4R3rCdUVtlwWf3YR9vUS24UDDYV2rNi8e9gIqbrP3hRzSPqkWNqOcai1agI9P9xu46Hll8oYkSAd7EDFIlgVEQITldcAGJp00DUKcsGACF1hsyZ3OAtVzNXj1K1KIwsOpDkDgnMmKR84OnzIjIwD4O+528vkIU0so=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02b5e0117d59c296
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRrwE+BRTLkLfPHCpqUNJ8m4BLBpG3w2WLoXx0jlu91IKQuUBChibUJOaolG6JdN8LpaAg7QD3Om9RuwAt7tnH93/0JTW385DgC3OS3W+Xd9u8uGPM3F50ucVb8sR9qfXTRTE0OP/iXM1OQMpVsBGlw4zDjrkVhHmaZqKdXT6rNF0924hdOdc0qqL7Z3fmHAJJLNCv+ZYVX5PjVBwkUDqV2wPEOhpHQ55uBEOF15oEHyPVTi5BcZvKES9IqcvQ3Pg3ladpVBXAhYV7aeGbXb2WS7lmT1RAayz2Se9gjVYfoYHeFnYXdY+XbDJfDX/dn8zC1q5Z9KNQE00GD7MexyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhLO8DX4pcflUzVcKBchtSr/A7XjhdfxygCKy8FN7Pc=;
 b=PNLXDiijwG44DIqsVDpRr6wCFji3+u5BC2PSO7e8+428XS2Ep54C+NfLPS+J/v2MT/7aFlRjPQiA64pIgUtIoZ3VobaGUq6rBP5BC4G9tYINVKc1cNd65oYnorTHimnnrTwoNaRg6YVlTccs/PP3b/wyK1g87tQa8vQeqj50Gx5HqsZQGPJPBMql/fzlBKMReBx12V0+pBbIx5+oNyDeb5Wkk0pYZwmoIEhztr4+KXVqEtNJuBelDLKKiEpOPxyChk3nhFqID4aT42jKbAEQ1dnzJQGMe3y6wWlnKAx4W9jItM/0vuUYhYiLb/qPH3rVd2KwQ7i8UwsHkwjBHLS8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhLO8DX4pcflUzVcKBchtSr/A7XjhdfxygCKy8FN7Pc=;
 b=UifFiXRCtM4R3rCdUVtlwWf3YR9vUS24UDDYV2rNi8e9gIqbrP3hRzSPqkWNqOcai1agI9P9xu46Hll8oYkSAd7EDFIlgVEQITldcAGJp00DUKcsGACF1hsyZ3OAtVzNXj1K1KIwsOpDkDgnMmKR84OnzIjIwD4O+528vkIU0so=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Thread-Index: AQHal7ZoS0Rs3weazUuhKfXitmlnMLF6RnOA
Date: Fri, 26 Apr 2024 09:20:22 +0000
Message-ID: <A0908DCC-6E15-406B-8E29-F241B6EA8BE1@arm.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
In-Reply-To: <20240426084723.4149648-6-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB9705:EE_|DU6PEPF0000A7DF:EE_|DB9PR08MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c22e029-6a9b-44c9-775c-08dc65d220e2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+6U18aFxP/2ftrz76m77pOIP6l0jIMwqqA6VoM1UtnXPHFltaHE9vWgXExHx?=
 =?us-ascii?Q?s0OazGh3Gmz1QSy89kKA2HsqAbPa8POxDNim+7VQtiLVceSCwDLvSsnnOnMI?=
 =?us-ascii?Q?RTtE9DyIroBrkDqzPWoueLCBpBhPxa/z8iTp/FmqEZpoQPtxMFu06RL52gGe?=
 =?us-ascii?Q?u7hRdu+Dm8kaMOKydPNbwSZbwOhmcgZnM8T8Qb3IPLKLTnlDfMi5TG12dmqe?=
 =?us-ascii?Q?wYQFhtPxXXkad0QsyRMMSNUcznjSUeztXf211963fEYD7eWi/WLn5F3/QZau?=
 =?us-ascii?Q?wUnaJ8JfKxUShiT6i/ShqVcNzY73XWIAECJW5PpGhliRbIhjJLayNMKuCt19?=
 =?us-ascii?Q?/Tx0x0vHqVnBzFJPD8RoNcqJrmGLHjWWw2pYp6Uh0OMYAYODhD9cGu8wsLhZ?=
 =?us-ascii?Q?ikR8QrhNgqwTP63bNVj9bMMyAh77o/crnaqpE46FG6BSOOffW0qUQTUJ3hci?=
 =?us-ascii?Q?eYyo9pa8NmHGx4oKhPp0qk7yyF0FtfansRJ9tf0sFOAo2OFVKn+Tgv7nrqGd?=
 =?us-ascii?Q?0NG9OgIM7SGf7cPW0NkEEWtEwOxetUWS6kBdvriCBMwh6hQRAo15AkM+HnWb?=
 =?us-ascii?Q?TSykmAff33KmDyI/w2XJoEH9k9RhItOaTAtSwt05piFgUvGZq1wbmbmf0mok?=
 =?us-ascii?Q?1Viec3sA6CYon8MDv67NVl0NzTBD1zcCeB2998FH7K2T2Vs6SD1tWpSHGQ9e?=
 =?us-ascii?Q?yUoHkUVtRt6iUkV05FUg4afQLo04wi6ZofMCkYSxXtV5p2l9HVyS+gSaZpfU?=
 =?us-ascii?Q?pTLgl6R4GRiAG/Z5xm/hgjNcNvHdma0hSKQjsjqdhLICyVW5HovIMgvITRBy?=
 =?us-ascii?Q?wYEGZgzkkOBAQYxSbHVJpxSpDMbvv5lupnrTLcZvnu2E3fA1SgJTARogFoXu?=
 =?us-ascii?Q?J3Hc6kolBTbFocrxeenzfzlavDPSFPOyPgIylhpZdFJ95sckTZArKIyNE35a?=
 =?us-ascii?Q?Cl03EIK2YuidFtTLar4oykPQ8vtXJB4swTWEiRqF5MxzxNHap3Hm3c+O1jBm?=
 =?us-ascii?Q?mvjM8Un4utrNYOvti1/xhl0NMblLk1zTEtTL7KcziJGmAAXKX2njdZhsNOXu?=
 =?us-ascii?Q?s5ZVpIKnhv3FhNOU3q1JjDkinSF/9nRblXHSCB7Jx71FQ+2OWfJI6AxxxLqZ?=
 =?us-ascii?Q?fBnpUGm1H7Q+TbiS0dopbeE6gd4I9Uv1ue/rq5PO4qrytqDbRMiNY0SIBKf3?=
 =?us-ascii?Q?9IzvC4lA88Brj/vIH2wzFA1JnxYLEeBAT9kG1cVDSyqlt3KnMxQzqpc9uScV?=
 =?us-ascii?Q?9SJtVmagRGMMrdxfdjYcw+AEZHOAQS/m0wMFTX1JvLIXjiD1MOG65AeoO10P?=
 =?us-ascii?Q?eWNW6viP8LqMsMCSGAEZqVvQJFr603JMXdzY/gndUDYnYw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <271537779D86EF4F8B040150454C4110@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9705
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6487b3e-6e35-4d9f-e304-08dc65d2196d
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400014|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uwh8xJ/G49FQzkp2NGEQ6Z0OTI7eiQhdRI5rbhm/UpnN0Ui4MPSRIg9c5lTh?=
 =?us-ascii?Q?gdbZ1VHzgxm1fR9c+CN4BBfMoQoapA+GHVjXXFlXiDWJ+9u+zzZPXpCM+mdd?=
 =?us-ascii?Q?sYamnJWXmFYNkTqO/f6hZ9wJIhqbqAe8AgiLLpnVEn67QEAMjQOA4GCK2ccH?=
 =?us-ascii?Q?Bp7eflwAxU5Z553rXuT1AcCwZaC9CCEQKrjnPqh6yL295SXCMIYcmc9TkamC?=
 =?us-ascii?Q?KbfrWOozslVMc59N9P2NC3piLLIOf76IxzJXVFryYzuOjboearQrXw7sc16e?=
 =?us-ascii?Q?7J0K5OrqIIWZ2MsecpFWKaabTjXT0hkDA0ztxzt1tdBppissadvZdglP64PT?=
 =?us-ascii?Q?iJrELhNp4oUVGn+IJ4Co4OSVyJiyfIRXRx3vFVY+PqG/zefKRGUB0rvOWWeq?=
 =?us-ascii?Q?NJG8KCTLKxu/2wy4CmU3eBmKHz3xIoEJXorvIUysS5tjWeHgvhIjQ50VHNZF?=
 =?us-ascii?Q?BHArKpFI7HrqIQSuhvc9jXXR49bBQvgxmwmEZ/W2r0gBiORajDbZDlzkbm4D?=
 =?us-ascii?Q?ILWWMSG076Sbc6/Eso7kfqlN1ItMY6WW1z6LVggJAQ1QhHEjvtOcdhXqHrzW?=
 =?us-ascii?Q?nYIivO11lWGBvbln+JDvz89MTxWHzCzQ/A85Bd53XC5mIUuY97TWzgFCMaZo?=
 =?us-ascii?Q?sx5KPF8HOObWvosHV1/EE9Riuivs07u4hLUo7fThz1ARaDvBgn4cUNrBQWOx?=
 =?us-ascii?Q?Iot7mAkiN5CZHAkeyo2DAmBz6RCBRNHNfJIqSH/afm7Aam8EebCiN55D2YaD?=
 =?us-ascii?Q?rCFfjzOBOuIohhAVjV/+SRsTwHKrPVpZgayYppF7p6U5EMIefCOs1tvmkfoU?=
 =?us-ascii?Q?nmPrjKh4ysWLAKLtvS/VWnzXecYDnT0iqCsHEvdr8oJE92lLBEfdEb/OiEOu?=
 =?us-ascii?Q?nBQQnBWUOgrpSfudWuL+Smpa4FX7OjgL0CAtxl+vWzK0+drxGse4IIa7v3LZ?=
 =?us-ascii?Q?agiL/WJV2ykWs7TMFcIyC9MtnF6hqxB3aLMJ2W1AtpGL0p6D/nSTx/cpK95I?=
 =?us-ascii?Q?lflundk8dnyyqDVBoz+rTc7EJ3udc4ABx7m7QfB8mj6U46tSPE4BHwklml9f?=
 =?us-ascii?Q?WpU2FrrmKWtaLUU5L0xhxxoQHgh+TApdiLu3KLVpTSgYQtzVndOjPwyNeVHv?=
 =?us-ascii?Q?N9/8NxVk/kYNWn6cGHZr7pCeTlKj2my/Ik3VgeGLRWiGbI4WoVKVHdi77RuU?=
 =?us-ascii?Q?+pnDaHhwDpKZhgwm4kRA1WvXLz6jxyGxWe6UKlIbWtigaw973fxzKjEpF+IJ?=
 =?us-ascii?Q?nePaANz/prOq1cotUQBMuU8cf900Zq3U/AH3e+GUArJOwuyyBhBsp5nQjdiF?=
 =?us-ascii?Q?cM56NwBEZbu79ZPyVn7xxqwi9G/274CbfXifnMooSNah4se/Fw1Y2t+9Jp/F?=
 =?us-ascii?Q?coD21xhBkUhBqOgP2OoJKF6NObp2?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 09:20:34.9017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c22e029-6a9b-44c9-775c-08dc65d220e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6394

Hi Jens,

> On 26 Apr 2024, at 10:47, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Add support for FF-A notifications, currently limited to an SP (Secure
> Partition) sending an asynchronous notification to a guest.
>=20
> Guests and Xen itself are made aware of pending notifications with an
> interrupt. The interrupt handler retrieves the notifications using the
> FF-A ABI and deliver them to their destinations.
>=20
> Update ffa_partinfo_domain_init() to return error code like
> ffa_notif_domain_init().
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> v2->v3:
> - Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
>  FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
> - Register the Xen SRI handler on each CPU using on_selected_cpus() and
>  setup_irq()
> - Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_INTR
>  doesn't conflict with static SGI handlers
>=20
> v1->v2:
> - Addressing review comments
> - Change ffa_handle_notification_{bind,unbind,set}() to take struct
>  cpu_user_regs *regs as argument.
> - Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to return
>  an error code.
> - Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_INTR.
> ---
> xen/arch/arm/irq.c              |   2 +-
> xen/arch/arm/tee/Makefile       |   1 +
> xen/arch/arm/tee/ffa.c          |  55 ++++-
> xen/arch/arm/tee/ffa_notif.c    | 378 ++++++++++++++++++++++++++++++++
> xen/arch/arm/tee/ffa_partinfo.c |   9 +-
> xen/arch/arm/tee/ffa_private.h  |  56 ++++-
> xen/include/public/arch-arm.h   |  14 ++
> 7 files changed, 507 insertions(+), 8 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_notif.c
>=20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index d7306aa64d50..5224898265a5 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -155,7 +155,7 @@ void __init init_IRQ(void)
>     {
>         /* SGIs are always edge-triggered */
>         if ( irq < NR_GIC_SGI )
> -            local_irqs_type[irq] =3D DT_IRQ_TYPE_EDGE_RISING;
> +            local_irqs_type[irq] =3D IRQ_TYPE_EDGE_RISING;
>         else
>             local_irqs_type[irq] =3D IRQ_TYPE_INVALID;
>     }
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index f0112a2f922d..7c0f46f7f446 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) +=3D ffa.o
> obj-$(CONFIG_FFA) +=3D ffa_shm.o
> obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
> obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
> +obj-$(CONFIG_FFA) +=3D ffa_notif.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5209612963e1..912e905a27bd 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -39,6 +39,9 @@
>  *   - at most 32 shared memory regions per guest
>  * o FFA_MSG_SEND_DIRECT_REQ:
>  *   - only supported from a VM to an SP
> + * o FFA_NOTIFICATION_*:
> + *   - only supports global notifications, that is, per vCPU notificatio=
ns
> + *     are not supported
>  *
>  * There are some large locked sections with ffa_tx_buffer_lock and
>  * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> @@ -194,6 +197,8 @@ out:
>=20
> static void handle_features(struct cpu_user_regs *regs)
> {
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     uint32_t a1 =3D get_user_reg(regs, 1);
>     unsigned int n;
>=20
> @@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>         BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>         ffa_set_regs_success(regs, 0, 0);
>         break;
> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, =
0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +
> +    case FFA_NOTIFICATION_BIND:
> +    case FFA_NOTIFICATION_UNBIND:
> +    case FFA_NOTIFICATION_GET:
> +    case FFA_NOTIFICATION_SET:
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>     default:
>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         break;
> @@ -305,6 +334,22 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>                                                      get_user_reg(regs, 1=
)),
>                                    get_user_reg(regs, 3));
>         break;
> +    case FFA_NOTIFICATION_BIND:
> +        e =3D ffa_handle_notification_bind(regs);
> +        break;
> +    case FFA_NOTIFICATION_UNBIND:
> +        e =3D ffa_handle_notification_unbind(regs);
> +        break;
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        ffa_handle_notification_info_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_GET:
> +        ffa_handle_notification_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_SET:
> +        e =3D ffa_handle_notification_set(regs);
> +        break;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -322,6 +367,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> +    int ret;
>=20
>     if ( !ffa_version )
>         return -ENODEV;
> @@ -345,10 +391,11 @@ static int ffa_domain_init(struct domain *d)
>      * error, so no need for cleanup in this function.
>      */
>=20
> -    if ( !ffa_partinfo_domain_init(d) )
> -        return -EIO;
> +    ret =3D ffa_partinfo_domain_init(d);
> +    if ( ret )
> +        return ret;
>=20
> -    return 0;
> +    return ffa_notif_domain_init(d);
> }
>=20
> static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_=
time)
> @@ -423,6 +470,7 @@ static int ffa_domain_teardown(struct domain *d)
>         return 0;
>=20
>     ffa_rxtx_domain_destroy(d);
> +    ffa_notif_domain_destroy(d);
>=20
>     ffa_domain_teardown_continue(ctx, true /* first_time */);
>=20
> @@ -502,6 +550,7 @@ static bool ffa_probe(void)
>     if ( !ffa_partinfo_init() )
>         goto err_rxtx_destroy;
>=20
> +    ffa_notif_init();
>     INIT_LIST_HEAD(&ffa_teardown_head);
>     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0)=
;
>=20
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> new file mode 100644
> index 000000000000..6bb0804ee2f8
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -0,0 +1,378 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/list.h>
> +#include <xen/spinlock.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +static bool __ro_after_init notif_enabled;
> +
> +int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( flags )    /* Only global notifications are supported */
> +        return FFA_RET_DENIED;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the sen=
der
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_hi,
> +                           bitmap_lo);
> +}
> +
> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst =3D get_user_reg(regs, 1);
> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the
> +     * destination endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
hi,
> +                            bitmap_lo);
> +}
> +
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    bool pending_global;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    spin_lock(&ctx->notif.lock);
> +    pending_global =3D ctx->notif.secure_pending;
> +    ctx->notif.secure_pending =3D false;
> +    spin_unlock(&ctx->notif.lock);
> +
> +    if ( pending_global )
> +    {
> +        /* A pending global notification for the guest */
> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm=
_id(d),
> +                     0, 0, 0, 0);
> +    }
> +    else
> +    {
> +        /* Report an error if there where no pending global notification=
 */
> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
> +    }
> +}
> +
> +void ffa_handle_notification_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t recv =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t w2 =3D 0;
> +    uint32_t w3 =3D 0;
> +    uint32_t w4 =3D 0;
> +    uint32_t w5 =3D 0;
> +    uint32_t w6 =3D 0;
> +    uint32_t w7 =3D 0;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    if ( (recv & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> +        return;
> +    }
> +
> +    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    {
> +        struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_NOTIFICATION_GET,
> +            .a1 =3D recv,
> +            .a2 =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                            FFA_NOTIF_FLAG_BITMAP_SPM ),
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +        int32_t e;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        e =3D ffa_get_ret_code(&resp);
> +        if ( e )
> +        {
> +            ffa_set_regs_error(regs, e);
> +            return;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SP )
> +        {
> +            w2 =3D resp.a2;
> +            w3 =3D resp.a3;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
> +            w6 =3D resp.a6;
> +    }

In here you never clean the secure_pending flag but in practice there would=
 be
no more pending notification if SP and SPM flags are set so the response to
notification_info_get would wrongly say there is something pending.

I am not completely sure how this could be handled if both SP and SPM are
not set so i would say for now we should at least put a comment in info_get
to keep a note of this fact.
Do you agree ?

> +
> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> +}
> +
> +int ffa_handle_notification_set(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Let the SPMC check the destination of the notification */
> +    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_=
lo,
> +                           bitmap_hi);
> +}
> +
> +/*
> + * Extract a 16-bit ID (index n) from the successful return value from
> + * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
> + * returned in registers 3 to 7 with four IDs per register for 64-bit
> + * calling convention and two IDs per register for 32-bit calling
> + * convention.
> + */
> +static uint16_t get_id_from_resp(struct arm_smccc_1_2_regs *resp,
> +                                 unsigned int n)
> +{
> +    unsigned int ids_per_reg;
> +    unsigned int reg_idx;
> +    unsigned int reg_shift;
> +
> +    if ( smccc_is_conv_64(resp->a0) )
> +        ids_per_reg =3D 4;
> +    else
> +        ids_per_reg =3D 2;
> +
> +    reg_idx =3D n / ids_per_reg + 3;
> +    reg_shift =3D ( n % ids_per_reg ) * 16;
> +
> +    switch ( reg_idx )
> +    {
> +    case 3:
> +        return resp->a3 >> reg_shift;
> +    case 4:
> +        return resp->a4 >> reg_shift;
> +    case 5:
> +        return resp->a5 >> reg_shift;
> +    case 6:
> +        return resp->a6 >> reg_shift;
> +    case 7:
> +        return resp->a7 >> reg_shift;
> +    default:
> +        ASSERT(0); /* "Can't happen" */
> +        return 0;
> +    }
> +}
> +
> +static void notif_irq_handler(int irq, void *data)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int id_pos;
> +    unsigned int list_count;
> +    uint64_t ids_count;
> +    unsigned int n;
> +    int32_t res;
> +
> +    do {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        res =3D ffa_get_ret_code(&resp);
> +        if ( res )
> +        {
> +            if ( res !=3D FFA_RET_NO_DATA )
> +                printk(XENLOG_ERR "ffa: notification info get failed: er=
ror %d\n",
> +                       res);
> +            return;
> +        }
> +
> +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT ) =
&
> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> +
> +        id_pos =3D 0;
> +        for ( n =3D 0; n < list_count; n++ )
> +        {
> +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> +            struct domain *d;
> +

If a notification is pending for a secure partition at this stage we are no=
t
signaling anything so I think this fact should be listed in the limitations=
 to
say that we do not signal any secondary scheduler if a notification is
pending for a secure partition.

> +            d =3D ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_pos=
));
> +
> +            if ( d )
> +            {
> +                struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +                spin_lock(&ctx->notif.lock);
> +                ctx->notif.secure_pending =3D true;
> +                spin_unlock(&ctx->notif.lock);
> +
> +                /*
> +                 * Since we're only delivering global notification, alwa=
ys
> +                 * deliver to the first vCPU. It doesn't matter which we
> +                 * chose, as long as it's available.
> +                 */
> +                vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR=
_ID,
> +                                true);
> +
> +                put_domain(d);
> +            }
> +
> +            id_pos +=3D count;
> +        }
> +
> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +}
> +
> +static int32_t ffa_notification_bitmap_create(uint16_t vm_id,
> +                                              uint32_t vcpu_count)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_CREATE, vm_id, vcpu_c=
ount,
> +                           0, 0);
> +}
> +
> +static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0,=
 0);
> +}
> +
> +struct notif_irq_info {
> +    unsigned int irq;
> +    int ret;
> +    struct irqaction *action;
> +};
> +
> +static void notif_irq_enable(void *info)
> +{
> +    struct notif_irq_info *irq_info =3D info;
> +
> +    irq_info->ret =3D setup_irq(irq_info->irq, 0, irq_info->action);
> +    if ( irq_info->ret )
> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> +               irq_info->irq, irq_info->ret);
> +}
> +
> +void ffa_notif_init(void)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_FEATURES,
> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> +    };
> +    struct notif_irq_info irq_info =3D { };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int cpu;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> +        return;
> +
> +    irq_info.irq =3D resp.a2;
> +    if ( irq_info.irq < GIC_SGI_STATIC_MAX || irq_info.irq >=3D NR_GIC_S=
GI )
> +    {
> +        printk(XENLOG_ERR "ffa: notification initialization failed: conf=
licting SGI %u\n",
> +               irq_info.irq);
> +        return;
> +    }
> +
> +    /*
> +     * SGIs are per-CPU so we must enable the IRQ on each CPU. We use an
> +     * IPI to call notif_irq_enable() on each CPU including the current
> +     * CPU. The struct irqaction is preallocated since we can't allocate
> +     * memory while in interrupt context.
> +     */
> +    for_each_online_cpu(cpu)
> +    {
> +        irq_info.action =3D xmalloc(struct irqaction);

You allocate one action per cpu but you have only one action pointer in you=
r structure
which means you will overload the previously allocated one and lose track.

You should have a table of actions in your structure instead unless one act=
ion is
enough and can be reused on all cpus and in this case you should move out o=
f
your loop the allocation part.

> +        if ( !irq_info.action )
> +        {
> +            irq_info.ret =3D -ENOMEM;
> +            break;
> +        }
> +
> +        *irq_info.action =3D (struct irqaction){
> +            .handler =3D notif_irq_handler,
> +            .name =3D "FF-A notif",
> +            .free_on_release =3D 1,
> +        };
> +
> +        on_selected_cpus(cpumask_of(cpu), notif_irq_enable, &irq_info, 1=
);
> +        if ( irq_info.ret )
> +        {
> +            XFREE(irq_info.action);
> +            break;
> +        }
> +    }
> +
> +    notif_enabled =3D !irq_info.ret;
> +}
> +
> +int ffa_notif_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t res;
> +
> +    if ( !notif_enabled )
> +        return 0;
> +
> +    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpu=
s);
> +    if ( res )
> +        return -ENOMEM;
> +
> +    ctx->notif.enabled =3D true;
> +
> +    return 0;
> +}
> +
> +void ffa_notif_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( ctx->notif.enabled )
> +    {
> +        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> +        ctx->notif.enabled =3D false;
> +    }
> +}
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index dc1059584828..93a03c6bc672 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -306,7 +306,7 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *ct=
x,
>     }
> }
>=20
> -bool ffa_partinfo_domain_init(struct domain *d)
> +int ffa_partinfo_domain_init(struct domain *d)
> {
>     unsigned int count =3D BITS_TO_LONGS(subscr_vm_destroyed_count);
>     struct ffa_ctx *ctx =3D d->arch.tee;
> @@ -315,7 +315,7 @@ bool ffa_partinfo_domain_init(struct domain *d)
>=20
>     ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
>     if ( !ctx->vm_destroy_bitmap )
> -        return false;
> +        return -ENOMEM;
>=20
>     for ( n =3D 0; n < subscr_vm_created_count; n++ )
>     {
> @@ -330,7 +330,10 @@ bool ffa_partinfo_domain_init(struct domain *d)
>     }
>     vm_destroy_bitmap_init(ctx, n);
>=20
> -    return n =3D=3D subscr_vm_created_count;
> +    if ( n !=3D subscr_vm_created_count )
> +        return -EIO;
> +
> +    return 0;
> }
>=20
> bool ffa_partinfo_domain_destroy(struct domain *d)
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 98236cbf14a3..a59c9887774b 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -25,6 +25,7 @@
> #define FFA_RET_DENIED                  -6
> #define FFA_RET_RETRY                   -7
> #define FFA_RET_ABORTED                 -8
> +#define FFA_RET_NO_DATA                 -9
>=20
> /* FFA_VERSION helpers */
> #define FFA_VERSION_MAJOR_SHIFT         16U
> @@ -175,6 +176,21 @@
>  */
> #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>=20
> +/* Flags used in calls to FFA_NOTIFICATION_GET interface  */
> +#define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
> +#define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> +#define FFA_NOTIF_FLAG_BITMAP_SPM       BIT(2, U)
> +#define FFA_NOTIF_FLAG_BITMAP_HYP       BIT(3, U)
> +
> +#define FFA_NOTIF_INFO_GET_MORE_FLAG        BIT(0, U)
> +#define FFA_NOTIF_INFO_GET_ID_LIST_SHIFT    12
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
> +
> +/* Feature IDs used with FFA_FEATURES */
> +#define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
> +#define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
> +
> /* Function IDs */
> #define FFA_ERROR                       0x84000060U
> #define FFA_SUCCESS_32                  0x84000061U
> @@ -213,6 +229,27 @@
> #define FFA_MEM_FRAG_TX                 0x8400007BU
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
> +#define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
> +#define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
> +#define FFA_NOTIFICATION_BIND           0x8400007FU
> +#define FFA_NOTIFICATION_UNBIND         0x84000080U
> +#define FFA_NOTIFICATION_SET            0x84000081U
> +#define FFA_NOTIFICATION_GET            0x84000082U
> +#define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
> +#define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> +
> +struct ffa_ctx_notif {
> +    bool enabled;
> +
> +    /* Used to serialize access to the rest of this struct */
> +    spinlock_t lock;
> +
> +    /*
> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> +     * pending global notifications.
> +     */
> +    bool secure_pending;
> +};
>=20
> struct ffa_ctx {
>     void *rx;
> @@ -228,6 +265,7 @@ struct ffa_ctx {
>     struct list_head shm_list;
>     /* Number of allocated shared memory object */
>     unsigned int shm_count;
> +    struct ffa_ctx_notif notif;
>     /*
>      * tx_lock is used to serialize access to tx
>      * rx_lock is used to serialize access to rx
> @@ -257,7 +295,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)=
;
> int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
>=20
> bool ffa_partinfo_init(void);
> -bool ffa_partinfo_domain_init(struct domain *d);
> +int ffa_partinfo_domain_init(struct domain *d);
> bool ffa_partinfo_domain_destroy(struct domain *d);
> int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t =
w3,
>                                       uint32_t w4, uint32_t w5, uint32_t =
*count,
> @@ -271,12 +309,28 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register=
_t tx_addr,
> uint32_t ffa_handle_rxtx_unmap(void);
> int32_t ffa_handle_rx_release(void);
>=20
> +void ffa_notif_init(void);
> +int ffa_notif_domain_init(struct domain *d);
> +void ffa_notif_domain_destroy(struct domain *d);
> +
> +int ffa_handle_notification_bind(struct cpu_user_regs *regs);
> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs);
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
> +void ffa_handle_notification_get(struct cpu_user_regs *regs);
> +int ffa_handle_notification_set(struct cpu_user_regs *regs);
> +
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
>     return d->domain_id + 1;
> }
>=20
> +static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
> +{
> +    /* -1 to match ffa_get_vm_id() */
> +    return get_domain_by_id(vm_id - 1);
> +}
> +

I think there is a global discussion to have on using get_domain_by_vm_id
or rcu_lock_live_remote_domain_by_id to make sure the domain is not
dying when we try to do something with it.

It does not need to be done here as there are other places to adapt but
i wanted to raise the question.

I would like to know what you and also other maintainers think here.
@Julien/Michal/Stefano ?

> static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0=
,
>                                 register_t v1, register_t v2, register_t =
v3,
>                                 register_t v4, register_t v5, register_t =
v6,
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index e167e14f8df9..1eac9802aa53 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -505,6 +505,7 @@ typedef uint64_t xen_callback_t;
> #define GUEST_MAX_VCPUS 128
>=20
> /* Interrupts */
> +
> #define GUEST_TIMER_VIRT_PPI    27
> #define GUEST_TIMER_PHYS_S_PPI  29
> #define GUEST_TIMER_PHYS_NS_PPI 30
> @@ -515,6 +516,19 @@ typedef uint64_t xen_callback_t;
> #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> #define GUEST_VIRTIO_MMIO_SPI_LAST    43
>=20
> +/*
> + * SGI is the preferred delivery mechanism of FF-A pending notifications=
 or
> + * schedule recveive interrupt. SGIs 8-15 are normally not used by a gue=
st
> + * as they in a non-virtualized system typically are assigned to the sec=
ure
> + * world. Here we're free to use SGI 8-15 since they are virtual and hav=
e
> + * nothing to do with the secure world.
> + *
> + * For partitioning of SGIs see also Arm Base System Architecture v1.0C,
> + * https://developer.arm.com/documentation/den0094/
> + */
> +#define GUEST_FFA_NOTIF_PEND_INTR_ID      8
> +#define GUEST_FFA_SCHEDULE_RECV_INTR_ID   9
> +
> /* PSCI functions */
> #define PSCI_cpu_suspend 0
> #define PSCI_cpu_off     1
> --=20
> 2.34.1
>=20

Cheers
Bertrand



