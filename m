Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0D7FBA6E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 13:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643120.1003021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xTA-0002Mv-Vm; Tue, 28 Nov 2023 12:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643120.1003021; Tue, 28 Nov 2023 12:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7xTA-0002L6-TA; Tue, 28 Nov 2023 12:45:40 +0000
Received: by outflank-mailman (input) for mailman id 643120;
 Tue, 28 Nov 2023 12:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0gx=HJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r7xT9-0002Kh-RK
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 12:45:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 073a06f7-8dec-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 13:45:37 +0100 (CET)
Received: from DB7PR03CA0089.eurprd03.prod.outlook.com (2603:10a6:10:72::30)
 by AM8PR08MB5714.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 12:45:33 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::ed) by DB7PR03CA0089.outlook.office365.com
 (2603:10a6:10:72::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Tue, 28 Nov 2023 12:45:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.18 via Frontend Transport; Tue, 28 Nov 2023 12:45:32 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Tue, 28 Nov 2023 12:45:32 +0000
Received: from fe3eabffa92e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8B0E157-CD1A-4D85-8B3A-4876F139BD67.1; 
 Tue, 28 Nov 2023 12:45:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe3eabffa92e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Nov 2023 12:45:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9263.eurprd08.prod.outlook.com (2603:10a6:10:3f8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 12:45:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 12:45:19 +0000
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
X-Inumbo-ID: 073a06f7-8dec-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SgYJ0TfUbGx4joQ73w5aq648j+0XCO8ttPVCTDd/h5lSuWmPjwPAsudv+k6aMWmqHMGcUhjAQNUkZHgC8EzYq7SkRG6eCEVkwPmmsh5wL9Sqm4dPux6o7S+Y7l93Ljp24fbt7zFFkWI9HSFRpai8D4eRRr4thV97Tirs5qZy1nNWtZzNhOkro5ZtNgxOdgH2P4xpuI6REbzHmQ+oBA7z/RaNDt0k/JsUT+zMDLFDacCsRUOtBdoElV/rM51N6ebCwHhcau3xkaNBnuYKmCLb2AQ3KYVBP9Sak3TGglgmzH03tPbdWCd5pNSPMG13QEP9XxlRFDbpyuV8WEvabS7lCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6nDvR46CWk2CI93w/An2DDADTbtzjdXyf4b1uHtW2U=;
 b=KVQz1yJQ8ka6r+CvA++4kdz7FDTgM2Q7HR+0vFZmKM82yzHRKFor7Bx2I/0qmFgScZFryd5gvDt5nCi/HN3d3yYjcSzfs+3xR8Eg8Ijta8BBgmvRgTSOP0ulAI5bUslm+Dn3lFNwqDzfczkGBiXaoHMjUP94yFqIkn8iG0DCqEiarvGx6TXJDCTS0EJdvU3feccFxhuMfb2FJ01hoWX92grm8jO+bp5kRRxh0SZ/oF+7dWzcq38a+iG5dyF+okOrWGpTCsMCuu0tqV/vc0XunNcN2H0//63nxsGB0+pokc5SLJC5vPE3p0qUNytFT26Y9cm63NwQuPRJdO+BBy1tRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6nDvR46CWk2CI93w/An2DDADTbtzjdXyf4b1uHtW2U=;
 b=3LoX8FtoVL2S7Ymns065rTrb3sHUiUYMLwn1mShR9Azcc1kuiNAP1ZZGhiTTqglO4y/CjbpaGvtR0oO6jojLxQm4TVU50pWCTGuSP6na7YMLWQIgu53AwKbZqtExly+orv/CyE/yg9x/86rANNw/7PGMlvW3XnSJKlSUrk7ZHkY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d680593d557812b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLgIveC0shFpgq76S2pBOUpWErXvCWZkCy3Cn9MVOfBLCkr6wxRb1v/SjPVpLTYNnlp/XZI2/c6GoeWdThk1A8/FrJtzjYHjr1A16yO1QjOlwFWBzT7vXiaQFp/fgVCgdhKPqNT7IlajP79V6cA1Ur4VsMumu1y88pc2hTE4CtcNWr3vV+i+fIYUrze2OyWnPY+R9IFd38GhoJJIMjwsvXmHqKW6F2GGQfaQ8Bs7ieB8glsMReESSCpR9JiFkfIEf4c+Mv6zlgJBKcCcIbZ5WeCR9Qb51NOQoRh5kgEiJr4wKkTCVn82jYvM4oS17E8nPARwXXPmGsJVlayIUD5DqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6nDvR46CWk2CI93w/An2DDADTbtzjdXyf4b1uHtW2U=;
 b=fotyqUB6XUpEcKuQ/TZnXtzE63vG1znJ5+9HCQWFrShVk4PLH++VO1JZz2eT13qJtoB4k1njKUYVdXqQefYDFMmIUbeAQIv/Hc64jykzta/F1R0wvtGpEdQMCbPNiFZlc/CJcf66YOnIjnrKXVwDgU4usmgew6ad/WcMBGXH40ZLTWpQF6CrO8r4SbA3ODuD7smnrvotuEjn/gtVTar4bb1HEoSgSppWlHg5otjnHH7qFAz+l+xCEEDpQMme8Bjpu2AVBd+4m/4gJP0zAajRZgbwWnNiuAodWLif7Whay02fAUny27HBXRI4FQtPuh1YqrZhxGRNQiQZt1vOSVHxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6nDvR46CWk2CI93w/An2DDADTbtzjdXyf4b1uHtW2U=;
 b=3LoX8FtoVL2S7Ymns065rTrb3sHUiUYMLwn1mShR9Azcc1kuiNAP1ZZGhiTTqglO4y/CjbpaGvtR0oO6jojLxQm4TVU50pWCTGuSP6na7YMLWQIgu53AwKbZqtExly+orv/CyE/yg9x/86rANNw/7PGMlvW3XnSJKlSUrk7ZHkY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v6 0/5] Fine granular configuration
Thread-Topic: [PATCH v6 0/5] Fine granular configuration
Thread-Index: AQHaHruBt1jR61BwukqrbWb7AIYNFrCJPEYAgAZTsICAACI1gIAAAc0A
Date: Tue, 28 Nov 2023 12:45:19 +0000
Message-ID: <561A800B-FDFA-4018-824D-5BDAB26FE4DC@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
 <E9D1FA66-DB03-4F52-9312-DD34FA916367@arm.com>
 <9AFCB511-0192-4C7A-8792-51AD941D6014@arm.com>
 <2402c235-97c9-4b75-a87d-8b048f049956@amd.com>
In-Reply-To: <2402c235-97c9-4b75-a87d-8b048f049956@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9263:EE_|DB5PEPF00014B9F:EE_|AM8PR08MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f51e3b-29c4-443d-a72b-08dbf00fe90b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ekc7KFgk+vV+GrgD3cL6DTC42h+QfBmBaIUatnIAv8p1KBV+fm2C7Sbr6NU5HxRyRk3wr6izevQqEC0atlN9odfpFBPHwto1JiR0+OQdcn1Ob6MUeWUvdr794HMpvhntyiAUXN7a0UIfpFsg0cc2SSc6p3zDrcCSPFvlky7n6ehEsdGmfOQK+oi7bXSD7FMjDt/GnVzDzEl3icXzhOoa6VaE5Hpf0jbClB7N54GhRh7M+0dBZFdGCoNY3xFUUqzNQeO67GmR3dRINB4guJnML4snYYMT38Dj6XAZe2AmW3fLRQegWq0jIi5wXanKvOrW4sZNkj1Y21fMIHkIzbeiP4OgRXLZ/Bu4eI16w+Q7HA/asPCqVUywIL5ViNDUSv6ga8+hPINm1OlNxC/eUJwnCmT3uysLtogkF6ZF9kJg35AkMKudzUkrCehVmZnVsYRQGm0K7hAEtsurj+U2GxEe97mD9E7LaKuQ4bwRGAQ9oEQAlD1Sf2YvXoADtQp+RwWCNsoCqf1xZQh3h8uXvg8u5mmL+0Qncr9+6d51r1fnAKVtQgNLMbZP8XWFmlxYRfwYxipkXu/A197itMi+lEOg9cqdaAgC76dzjxBPqw+dqMIM9d51pHZTS+XnPxPpYawkKqFjlMLk8mcEpBdeMGJYFg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(366004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(71200400001)(8676002)(8936002)(66476007)(4326008)(6486002)(86362001)(478600001)(66446008)(316002)(91956017)(76116006)(54906003)(66946007)(6916009)(53546011)(64756008)(66556008)(38100700002)(83380400001)(122000001)(5660300002)(6506007)(6512007)(38070700009)(2906002)(41300700001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90B7D73DCC97AC408BD7ABE54216A11E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9263
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54b064c5-c068-4bc8-4d28-08dbf00fe11c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KDGnk+YJb3BjCdK9axtFFdY4kBzO+CwIobvQuhoAcfIyBoxp56OnAv2C63ngboxQSGBsUA4q2Zrurnd1tiEckrPUG7WEjej0TDygEPQetLtUMOQ4QESRTb88CRO911mH9hvhq8SXyBfh2q017jWR8ongzdUM9/CxoRneCR+CHAbfn2qeISe+G96XndG6Ls4rkuBlUTb4QQZlCz95T5KL1LRak9p9Lac8qeCdvLtDNNmmaLBgrYoMY4yLqkjx9gYn4bxDAVuSvhLGkrUop15/+y4TIJINtH2OUtTgfM4z07MXkxybNrAfbu88K9jmxLsq96YrRE7kGhLMEgOGlxTXXLfIxgKleQntkUI9ODJQGDzdav9dQoOgnv1971qDc92ENezFX0bsxB+0s/oi0iOTofnrF4LQkNFiBpMAyqjbNig3QmqwSHYeUOhGHIPQLZXdWiX6uRqPw/pkMmcv1NYoYs1MZ0+jT1oIbfAMAi7Tkt5072wnvcCOE/14urjKuDzKGb3lijqVE65bYI0Z3u7jTt2cQ03TbiyR7qXHORh73CAoSjMKJRovMpekF0JlRMvqLtj669vn18RitW3aHI+6+saHMur36ULm0g4AgF3y1vau+fbYLolU4dpurdu9Zk/tPA0zll6BJXT90rTDLS6al1tQKB9PfUXj9aJRj/vRTRpTj/85b5vGAm8vEvynEFOoZNX9Tk65hUsPSx87CIdgVpBcVjehpv29yiiGvbldjTSIog8uDLayMjNXlHVZALDr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(336012)(83380400001)(356005)(40460700003)(81166007)(82740400003)(86362001)(36756003)(33656002)(47076005)(36860700001)(54906003)(316002)(41300700001)(70586007)(70206006)(4326008)(8936002)(8676002)(6862004)(40480700001)(5660300002)(2906002)(6512007)(53546011)(6506007)(2616005)(26005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 12:45:32.7931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f51e3b-29c4-443d-a72b-08dbf00fe90b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714



> On 28 Nov 2023, at 12:38, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> On 28/11/2023 11:36, Luca Fancellu wrote:
>>=20
>>=20
>>> On 24 Nov 2023, at 09:59, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>=20
>>> + CC Maintainers
>>>=20
>>>> On 24 Nov 2023, at 09:48, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>>>=20
>>>> This serie aims to add more modularity to some feature that can be exc=
luded
>>>> without issues from the build.
>>>>=20
>>>> The first patch is already reviewed.
>>>>=20
>>>> v2 update: So I've tried to see how to put the dom0less code in the co=
mmon code,
>>>> but the amount of modifications are not trivial, even putting only the=
 common
>>>> part and protecting them with ARM, leaving the ARM specific stuff unde=
r arch/
>>>> like gic etc... will leave a status that is not very nice, so I've dec=
ided for
>>>> now to keep everything on the arm architecture so that who is going to=
 work
>>>> on unifying the code in common can just take from there and do the pro=
per
>>>> rework.
>>>>=20
>>>> Luca Fancellu (5):
>>>> arm/gicv2: make GICv2 driver and vGICv2 optional
>>>> xen/arm: Add asm/domain.h include to kernel.h
>>>> arm/dom0less: put dom0less feature code in a separate module
>>>> xen/arm: Move static memory build code in separate modules
>>>> arm/dom0less: introduce Kconfig for dom0less feature
>>>>=20
>>>> xen/arch/arm/Kconfig                      |   27 +
>>>> xen/arch/arm/Makefile                     |    7 +-
>>>> xen/arch/arm/arm32/mmu/mm.c               |    1 +
>>>> xen/arch/arm/arm64/mmu/mm.c               |    1 +
>>>> xen/arch/arm/bootfdt.c                    |  161 +-
>>>> xen/arch/arm/dom0less-build.c             | 1018 ++++++
>>>> xen/arch/arm/domain_build.c               | 3591 ++++++---------------
>>>> xen/arch/arm/efi/efi-boot.h               |    4 +
>>>> xen/arch/arm/gic-v3.c                     |    4 +
>>>> xen/arch/arm/include/asm/dom0less-build.h |   30 +
>>>> xen/arch/arm/include/asm/domain_build.h   |   34 +
>>>> xen/arch/arm/include/asm/kernel.h         |    1 +
>>>> xen/arch/arm/include/asm/setup.h          |    2 -
>>>> xen/arch/arm/include/asm/static-memory.h  |   45 +
>>>> xen/arch/arm/include/asm/static-shmem.h   |   66 +
>>>> xen/arch/arm/setup.c                      |   57 +-
>>>> xen/arch/arm/static-memory.c              |  287 ++
>>>> xen/arch/arm/static-shmem.c               |  547 ++++
>>>> xen/arch/arm/vgic.c                       |    2 +
>>>> xen/arch/arm/vgic/Makefile                |    4 +-
>>>> xen/common/Kconfig                        |    2 +-
>>>> 21 files changed, 3058 insertions(+), 2833 deletions(-)
>>>> create mode 100644 xen/arch/arm/dom0less-build.c
>>>> create mode 100644 xen/arch/arm/include/asm/dom0less-build.h
>>>> create mode 100644 xen/arch/arm/include/asm/static-memory.h
>>>> create mode 100644 xen/arch/arm/include/asm/static-shmem.h
>>>> create mode 100644 xen/arch/arm/static-memory.c
>>>> create mode 100644 xen/arch/arm/static-shmem.c
>>>=20
>>> I sent this serie forgetting about adding the maintainers, CC them
>>> now.
>>=20
>> Hi all,
>>=20
>> I think all the patches here are Ack-ed by a maintainer, is there any is=
sue to
>> merge them?
> We discussed this on Matrix and Julien will take care of committing this =
week.

Ok understood, thanks=20

>=20
> ~Michal
>=20


