Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5FE7FB804
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642957.1002821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vSm-0004UJ-Kd; Tue, 28 Nov 2023 10:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642957.1002821; Tue, 28 Nov 2023 10:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vSm-0004Qv-Hc; Tue, 28 Nov 2023 10:37:08 +0000
Received: by outflank-mailman (input) for mailman id 642957;
 Tue, 28 Nov 2023 10:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0gx=HJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r7vSk-0003ol-9x
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:37:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 123dd488-8dda-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:37:04 +0100 (CET)
Received: from DU2PR04CA0237.eurprd04.prod.outlook.com (2603:10a6:10:2b1::32)
 by DB9PR08MB7494.eurprd08.prod.outlook.com (2603:10a6:10:36d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 10:36:35 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::2e) by DU2PR04CA0237.outlook.office365.com
 (2603:10a6:10:2b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28 via Frontend
 Transport; Tue, 28 Nov 2023 10:36:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 10:36:34 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Tue, 28 Nov 2023 10:36:34 +0000
Received: from e5e76f2d74c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F3D25E4E-2BF0-4FB5-A958-F41D23DEB3CF.1; 
 Tue, 28 Nov 2023 10:36:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5e76f2d74c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Nov 2023 10:36:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU2PR08MB7376.eurprd08.prod.outlook.com (2603:10a6:10:2f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 10:36:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:36:25 +0000
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
X-Inumbo-ID: 123dd488-8dda-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=B+a7RotD3y2O1lDDvCJbPfkEhpryb1ugAFxZBOHZgx3iJU2P5S6WrzVRGpeTZ++23d/MBgJG33zgY3woV5osTxpGpz5TzINg8w5s/zIJCw7pW7osi1fSl9rOjutRzpb4mtRiEioM0n3imT9hRbrtciuQjkb3yhIiVnuA6XRMv0ep+tkrjWDShhH/PuR+hYKkmgEqW2Iada0NrV8jxc2CD/Hd/iZMMBQj7v7wTxj/93rMwZb5J/9YFCWgc6sHHe5WAlWYnxOXFbEhrAzN2w1zuUvkrOroiKrOBopPA00qSxyaFi9vGTfZi7Oq+S1YmyOPjCE//QSNvsFXWqPMNxrD7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmOGGQy7sOjD1W26s1AhAbwBdyMxD523+N3Efj6+HLs=;
 b=KRntGbYikqHPDJ7chRiKCtb6qs8vYoUinHtlpsPlRtonZZgaDLPe8kEV+yUw6Io1/hkEZHPzw9a7qLmiUQcRVb9SZB/23flb7l1Wnh+vlcovBINwJUX5X6hSvt4VQrUINhY5WrOExoDEa5hVA5ldAPSep6WBdttvaBH5NhntJ6oDxoMyX+bmr1KzK0rO8GOGg7i6nfaZfWvc+OpYwMTBHb24/2SNGPXQaAw8OcYn1sBGAvtOzK8P2IG59UFQrp5qYlcifzISFDIoc60L7ISfjqaRlXitOjLD7ptbk7oGD8y8mmthjt35P3lR2AHVH5jTN45QVnLDGr443aPfarXgGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmOGGQy7sOjD1W26s1AhAbwBdyMxD523+N3Efj6+HLs=;
 b=HsGxkglZHgrTTtQIYX4EPVEsQUwN7dOZsbLhuvf1KDJ2UfucdxCd2fEg8c5h5EynC5HyN8xaprFQADgQh4J6TeqUeEw9JXszIHeF9hKwLcmO38YVrC0g0lFJikTPidr9FCACDrGmTYYYyD7LEv0yKDl7r/PauAjAxZT1Bh6RbJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae7fa59135ee81fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8QRocfQOYKLNJXEzKkfmzyNG8nRRSLVKPmaSLbqwSO4ULiaPlUDIr/whwrXtmwYjEJWeYkNTxe6OUqFhAUwgoybx40LpzbT1VVR0vGwGbpJ08L1PMu4t6pLlr89iViGLxF5QOh3FcWaQLArBdAPIYSlNUttuov4Su/2pF8v82GxmUaIrF2hyPETVN4UEKR73W2rALC+oaJVFmJpjrktbu/3zMGAQnJo93uiNCPGhN9LDJPfpTfNr3ubl0nUDrnE0TtzAFkHGqdPzi9MRtwEjnviOdv1aRVPT2qPp1r1lnQajpPCx21UbB7/Z8siSkfQ/daCwZ3EpRDTsr3xSoStIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmOGGQy7sOjD1W26s1AhAbwBdyMxD523+N3Efj6+HLs=;
 b=gvOiE5DGRcCM03nDs7cgcON+Dh+KHRkqZIyxPoqSoilGzesqwKuEoHZrfceNa2HHX+I6ywH1+vTq96DgE8KHx4o3biL+J+i+MbcvcuHfWVaem5t7wTrVMNYIKxyFBf7ikj/XL/jiNimB184AWgMpO+b+UDRUuucJ7FVifSzws7qoj3R7wSnBbBdsxoiKlWTUITR9WXwBAcTNe3F9DfbByfZkpd1SXZsQjganT2RHVIgTSQwRoCNlzxFoSZHnRWVKE0QWKBBftwlA+1xQRE1QmSgbBxxcW3zQmUky4Aj4tTFauBGJK6z98tfnmpjCRq1FyEMJ6Np35POL5/e4bF1IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmOGGQy7sOjD1W26s1AhAbwBdyMxD523+N3Efj6+HLs=;
 b=HsGxkglZHgrTTtQIYX4EPVEsQUwN7dOZsbLhuvf1KDJ2UfucdxCd2fEg8c5h5EynC5HyN8xaprFQADgQh4J6TeqUeEw9JXszIHeF9hKwLcmO38YVrC0g0lFJikTPidr9FCACDrGmTYYYyD7LEv0yKDl7r/PauAjAxZT1Bh6RbJo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 0/5] Fine granular configuration
Thread-Topic: [PATCH v6 0/5] Fine granular configuration
Thread-Index: AQHaHruBt1jR61BwukqrbWb7AIYNFrCJPEYAgAZTsIA=
Date: Tue, 28 Nov 2023 10:36:25 +0000
Message-ID: <9AFCB511-0192-4C7A-8792-51AD941D6014@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <E9D1FA66-DB03-4F52-9312-DD34FA916367@arm.com>
In-Reply-To: <E9D1FA66-DB03-4F52-9312-DD34FA916367@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU2PR08MB7376:EE_|DB5PEPF00014B97:EE_|DB9PR08MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 154b0044-ccfb-45b1-e319-08dbeffde4d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5r7dNmthEWjomoKxn01me8xICdeHjIudUsIrNO+iw170QKj1h9OWspjcdqdTsUmOPVP12fmwZ6NQnIOjVhkGVIIsFSqmGqgWIUIfIELV4spgFE3UU91tLmkqKpS/EDEhigilM03i3tiYMenipOes9TnA5NXv+ZM9crSozs7lphSMKGnpsD7XYrLh+yUGYwLyrAl4gVMzn3o/+7RkK0mM4pKUgI/+Wgqh6KgdfKjdSQ5HwTDEdD0+RHAlUaLND9b0t0XrrnX1aN1XovvKqGmuZN5V+EqJIxy85jLMi/T5iINgIhgyOSxe9ut3BF7XjTaZELCFeR7mD/RxflWVOpn99IgC7wgY1P1jvmpWtjcyGddH9FfARN5hOIZn3fm6VZs7scVW5xa+rQgTRgYX4y8tJBLlwUkEBSCeNeGkqMChJ87Mw1CXdLxe4nUwBwrPmUsBxlWx8UJtBbqX0rWRfUUw5XF2LD4Xussz3zoLj7tfqEomiYo5PVu1EYQo2K6Fg3FQYPglfXxKGAtTHzjhhp3XAbYsgsfeNn0n52VqxT4DpDCYeZhes0bCe740eDQ0Zgu6G9uqxGSkWVdUcmeLMG0T/KyuZgSjD74XfCImz6P0/DvjUc3MYBsU1qhHZD+rJh29o0QQrgct9C4eSGXOxJnpMA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(316002)(122000001)(86362001)(6486002)(4326008)(8676002)(8936002)(6916009)(36756003)(33656002)(5660300002)(83380400001)(91956017)(76116006)(6506007)(6512007)(26005)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(2616005)(478600001)(71200400001)(53546011)(38070700009)(41300700001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2AC6DE3B8DBCB44986313F878135A669@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7376
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1302c26-6649-484b-d5b1-08dbeffddf5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S5oLrR67C/T61dYIF6y2993/ezIp9bHbrFGUHAyk+R1TIvbec2VdDHB8DzoNWfOZvmgRZYjlUSA+XLYpykWHBbGMJoaDLnJGieUyxLlSB31nBzDidCcpW5FNjZxcRznQxgfNwg771OAGek+90p/WXXuF7mMECcW5JJK8O4HZduw5i6iqRVt1sLVohcfjHXrwafFaDP4Gp6yax3f19Ihm91BQBLQ6CdmTY3k6cv01wvHV1HmG+8Cjz4FfG8k20oTWPPvWZRcuA9H/BZmRZjoTILfpK8CXEfEUXKnHXFMUFFJyLUqH8edkQ7i8LBtEFP/SSLuJrTJ6GZPa5rPCP6oYjtkv8N/GwDi5dGxe0AXofZQk2vM8rVblSkAa9WeNOblcNzb9/ByZJul+XDScFGzZDdSOR71LxWVDH6N8JHr46EnSHY+Iwzpj7O6W3PoVEkY6Sgb2qG6Z8EU0mbkKybA/54vt/uGcTEmSJ0ky0FsditD5cTn79P+mNy71hpBvHy9ScwAaIJ4dtlTP27KxjlI5/9km/JtDcO48pmRa0NwQHCgNKZFGJkVmuraykEGsC9CvXPJT02YUT+WlZeVjVJkX6bOjtKII5xbZAd7639njQNqxBNYkLDxH1LYc103/7jKrPla5YnQ4K+1wsIV31DkRePsNfbNh4zw1K9ZkeXiVvVvDnYXrloXy53HyLglVDczF+X2vBoc9gdvRwY6TEsjpoFjcI586Z47McOEXMnBw66YX9VQHlSAeUlUEpgfEDE5y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(336012)(53546011)(2616005)(26005)(6506007)(6512007)(478600001)(47076005)(36860700001)(83380400001)(2906002)(4326008)(41300700001)(5660300002)(8936002)(54906003)(70206006)(70586007)(316002)(6486002)(6916009)(8676002)(40460700003)(356005)(81166007)(36756003)(33656002)(82740400003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 10:36:34.7534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 154b0044-ccfb-45b1-e319-08dbeffde4d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7494



> On 24 Nov 2023, at 09:59, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> + CC Maintainers
>=20
>> On 24 Nov 2023, at 09:48, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>=20
>> This serie aims to add more modularity to some feature that can be exclu=
ded
>> without issues from the build.
>>=20
>> The first patch is already reviewed.
>>=20
>> v2 update: So I've tried to see how to put the dom0less code in the comm=
on code,
>> but the amount of modifications are not trivial, even putting only the c=
ommon
>> part and protecting them with ARM, leaving the ARM specific stuff under =
arch/
>> like gic etc... will leave a status that is not very nice, so I've decid=
ed for
>> now to keep everything on the arm architecture so that who is going to w=
ork
>> on unifying the code in common can just take from there and do the prope=
r
>> rework.
>>=20
>> Luca Fancellu (5):
>> arm/gicv2: make GICv2 driver and vGICv2 optional
>> xen/arm: Add asm/domain.h include to kernel.h
>> arm/dom0less: put dom0less feature code in a separate module
>> xen/arm: Move static memory build code in separate modules
>> arm/dom0less: introduce Kconfig for dom0less feature
>>=20
>> xen/arch/arm/Kconfig                      |   27 +
>> xen/arch/arm/Makefile                     |    7 +-
>> xen/arch/arm/arm32/mmu/mm.c               |    1 +
>> xen/arch/arm/arm64/mmu/mm.c               |    1 +
>> xen/arch/arm/bootfdt.c                    |  161 +-
>> xen/arch/arm/dom0less-build.c             | 1018 ++++++
>> xen/arch/arm/domain_build.c               | 3591 ++++++---------------
>> xen/arch/arm/efi/efi-boot.h               |    4 +
>> xen/arch/arm/gic-v3.c                     |    4 +
>> xen/arch/arm/include/asm/dom0less-build.h |   30 +
>> xen/arch/arm/include/asm/domain_build.h   |   34 +
>> xen/arch/arm/include/asm/kernel.h         |    1 +
>> xen/arch/arm/include/asm/setup.h          |    2 -
>> xen/arch/arm/include/asm/static-memory.h  |   45 +
>> xen/arch/arm/include/asm/static-shmem.h   |   66 +
>> xen/arch/arm/setup.c                      |   57 +-
>> xen/arch/arm/static-memory.c              |  287 ++
>> xen/arch/arm/static-shmem.c               |  547 ++++
>> xen/arch/arm/vgic.c                       |    2 +
>> xen/arch/arm/vgic/Makefile                |    4 +-
>> xen/common/Kconfig                        |    2 +-
>> 21 files changed, 3058 insertions(+), 2833 deletions(-)
>> create mode 100644 xen/arch/arm/dom0less-build.c
>> create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>> create mode 100644 xen/arch/arm/include/asm/static-memory.h
>> create mode 100644 xen/arch/arm/include/asm/static-shmem.h
>> create mode 100644 xen/arch/arm/static-memory.c
>> create mode 100644 xen/arch/arm/static-shmem.c
>=20
> I sent this serie forgetting about adding the maintainers, CC them
> now.

Hi all,

I think all the patches here are Ack-ed by a maintainer, is there any issue=
 to
merge them?

>=20
> Cheers,
> Luca
>=20


