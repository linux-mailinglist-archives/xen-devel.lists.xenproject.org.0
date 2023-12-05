Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C89804C08
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 09:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647454.1010592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQZv-0001lo-F6; Tue, 05 Dec 2023 08:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647454.1010592; Tue, 05 Dec 2023 08:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQZv-0001jN-C9; Tue, 05 Dec 2023 08:14:51 +0000
Received: by outflank-mailman (input) for mailman id 647454;
 Tue, 05 Dec 2023 08:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cV0=HQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rAQZt-0001jH-GI
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 08:14:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59f35c41-9346-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 09:14:46 +0100 (CET)
Received: from DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) by AM8PR08MB5572.eurprd08.prod.outlook.com
 (2603:10a6:20b:1db::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 08:14:42 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::1b) by DUZPR01CA0139.outlook.office365.com
 (2603:10a6:10:4bd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Tue, 5 Dec 2023 08:14:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 08:14:42 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 05 Dec 2023 08:14:42 +0000
Received: from aa171aba97fc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B9E52A6-C8D2-48E0-BF69-B0D1A80A08A3.1; 
 Tue, 05 Dec 2023 08:14:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa171aba97fc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Dec 2023 08:14:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 08:14:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 08:14:32 +0000
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
X-Inumbo-ID: 59f35c41-9346-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kLBvsd3Poiez/TN5gnol85RJBiKl6EKbyGB2+kdxPk4wrXW4M9j91IlrtLlSoHJ+zfhLhDnET65teIygn3LrVGdAj7UIwzsq/XOAg8wPxWXyntSKH6esCkvLGm6MVD4HclzON9sTAMt+iGV4fSy25MvnAKyTqYQ+Wf+QGGR9yNBpHMIFqbu3jatX0V0XwOWeD2v5J1diO2FvYsNQgD4Y6TX3lkgoXStJRYCrkBoEwXq/rdBuC40Ph+WRTtRUE9KvqvZedjUFTSxpM9P3PuBaaZqfA8U90u2HY3fyVF/CHvUJqdpK6iGEZTGHgddqVSPPFT/aVJfMmLTQ1HZrjRKzkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DxCdyJHeqP3pz7iPZ8ZZwlVp2S1lyQAMvolsbtSrxU=;
 b=NzslR14hHZ5ZQLAd3A+lT5Iq93beJ0zxPzQU3BSmXFYs3qH17vLY43jDKy6tJFS+3cgv8y5qzUJ9ir0WXS5k7fezouHAWgOOmi0fjT2UAT5S3H0kjgpJMcda5dToAstUOIk72mKP1u0J7MYaWLwlyzt+x/C9d8KuiGdCOtyTq3hCHHP3x9qdQCdnH5aN185s4orjnKSqAbxVrCwImcd7dn6OfH4JcV47M7KRwNxOh4U+cTjl6PofWeDRLeIkxUqQTOdCv7ZDfXeVwwXxQJ196EkcXj+yTk5QZTBTSRrrRTdOb0T1Wweq5G48s2rTKaGrFI1/Q6bDzz2wfEz7VcSCZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DxCdyJHeqP3pz7iPZ8ZZwlVp2S1lyQAMvolsbtSrxU=;
 b=oFaZ9v1JFu/xsC7V/cA7+vaVyEU6SpbXFCwYSi+p59ZTBqCIUKkgqNtJkwPAI48MDZtt++pax+NQLfvtoBcvA/Q1my5xTMAvmsBi7fXSwapTRBXZF8ID/iVKh6PWi+wI0hIKaOKtAjOOM1FlNl6Uq9wi8CNxJ6F9GRVTWKibg/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 338863f038d3e0a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1AFsKK5U16xXWqmjWGxvSgM0wnG2IEe2pO7TazaDtqNbrQkdr5kCYjKYrfZ//DMWY0TWu1Bh25roDjZrhY6VCDZuBF6YniVRRMvo24K5gg6RkjkBrWvoTFA/P6aMhSm0X8d7GT+o2Za3zlB0Sy0Ja8wdt0Jtj4kQQLAx46gebQAraIcedqJUxDd5b+lhNShbYwBu1TsP4jKrX/1f5oKUWJsW5CrHiGymlVpwgLA667OKMmncNNuVLGVilQzbTzU2kGSrXQWLhBfeybVSksIHkvIDx6uO6L83cPKue0N3g6OEXi9HGm1AusInYL2QDDNdWQ+ZE2ZUYmkNH8crPCwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DxCdyJHeqP3pz7iPZ8ZZwlVp2S1lyQAMvolsbtSrxU=;
 b=ea0Et3P5efdAx4CVjJoQ++DsVR6KlYYsxkcjIfML1L/vca/Meu94ULC7Mo9ezotU7KgAsxgSgvXXF8+75kZAIxN2x11MXVyMcjMHy2Dt6DcwRr1nfeUMpFxYOUTpMTOs0kYGCf8+eTlonjV10AoeSXLXLYKKj7nruRXmamDkjOF3rgybS8EQJF906QJx3AjI53/sOjlH3QNo7u8qqcTY4SuBYhHr01ovC1DiCW5bu82C1DK/XpZ5WF/h7kTLxnifjBSTbqrgF2Sgsi9yte7eNKZ6+aoHTFfHRcFCMMr5XAfqxbe4djaqcv8OQ6XiW95Xuk2ZFJbHBbxnMZoOFMv1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4DxCdyJHeqP3pz7iPZ8ZZwlVp2S1lyQAMvolsbtSrxU=;
 b=oFaZ9v1JFu/xsC7V/cA7+vaVyEU6SpbXFCwYSi+p59ZTBqCIUKkgqNtJkwPAI48MDZtt++pax+NQLfvtoBcvA/Q1my5xTMAvmsBi7fXSwapTRBXZF8ID/iVKh6PWi+wI0hIKaOKtAjOOM1FlNl6Uq9wi8CNxJ6F9GRVTWKibg/A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"patches@linaro.org" <patches@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Topic: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Index: AQHaJoeGwF1xR3NTTUaqMmqvuUyS9rCZgdwAgADXLwA=
Date: Tue, 5 Dec 2023 08:14:32 +0000
Message-ID: <0B35D609-5378-4180-B79E-0CAE69D42165@arm.com>
References: <20231204075552.3585875-1-jens.wiklander@linaro.org>
 <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org>
In-Reply-To: <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5616:EE_|DB5PEPF00014B92:EE_|AM8PR08MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7d0238-b209-4180-1a91-08dbf56a3be0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 89axDm2AF4tzAYcx8XNleUBJREHhjFZORHSHiDtK+32CsrSfb73Ght/eC9C9SpBmuysqLR+dHX2BKe0x3QgNqLCB0z3muvMG4e0jCIjKIGur3P5qHYpPUGhc5bADkQ+EXOH8HlxH68IhfZo4npoM6mBCa2h6FwQRCqdmofPTb1rvXpnpEcOEMWikEOIr/ULXz/zwFx3hC2ehHCyZ5wvaAHgk6fwkIju5VebKZHJ2upwEU9RHZxYCDsbQdGiRicHZImAcfhUbosj19wUOzGQ7soXZiPCe/ESwjJ28os185xs8GyiPevjGVJKrztlN5aLPs+mZqxxprEPCTSAm5HeUHMACmJA/PsOgIEdMOjhGrqxUDM1RM+l+9Wr0OygvJck8Pdll1UQj0ta5+yAyVNvscbn5zBgmbzZvpN3saNrvC83FK5pzVR7bunK1uBipGldyIenUfFEd4l5TqzLJfYxFU4ucivhf+OSx8TqugH7EbLHxxVv2U+EPh2I2U+vPZT2GY9dtG3phBg5CCNFF4ibh+Q/L2pIE8DRFdA5gF+jK9kt/ac2QC+sXWtiU3WRJqCKDiZ2maATsRQxNBZdyNrqB+rxUEvyzNk5jbhiNyUFiWdELvB0WTwtUojsujtyE3k39olpdStnpwixAZs4/xtGPLg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(366004)(136003)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6916009)(316002)(66556008)(66446008)(64756008)(54906003)(66476007)(86362001)(8936002)(8676002)(4326008)(66946007)(478600001)(6486002)(91956017)(76116006)(41300700001)(36756003)(5660300002)(2906002)(33656002)(122000001)(38100700002)(2616005)(6506007)(71200400001)(53546011)(6512007)(83380400001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6ED5C370F3625944AAAAE4BC32BE3612@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef35af77-e390-4fcc-2033-08dbf56a35fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K/cCrf2/gXFXS7jvM2l0b8vRLxpcrYLwV5PcrAoiy5OT90YrMiLakvSGDy9TC/tKQJsYpGC9km8f0oJXbhWXxQPiOgiZ1V4xOW3LkRqUCGxy/3/TRbqhOaAtf0QVhzRMfmbf8Gi7zxY3Ulkvu4iH3nIooGDinTtVR8O40HgwCiNF8zP1ipkdUuT9FjbtD62VXUXYkG7rXlVr0/HdyJr9wnIm5LPwzmlEdFy+Ctnm4xfBvaySKl3wBIitf2uyaMRFkxH4NRE+keIlEJbLYnarSDL02dNnpcTiON3pzqun2jIZgBHc/BUqU6eiz/fOYuEkLby7N1BpEk33WnosL7hupU5pHiNjD/KXGDslKtd5pRvJTRj5W85sZfwhVHwQdvMdoHe0lLEqE8Ev0RUAUBDP4Z/nz6TL2O22ycgkMKbfzymPvBG/UmubG77gtjJavPB1SkGX9sGVSfj90DcOeh11B54hJLJ2hogs91N16xhnHwCMlaTARA7yJSoAmn+eF4BGDnF+nbpZJM3lnzW+PUhMTaMbUyF7lV/Lk1I1v1kLIeh6wtHxYEGvaFFzuy59iBhJ/RAAASmj+24WwidYx4e5ETnkoYJLeAm8/ted4QLdk1M6zeXwvZiZnB13/S0AyxsBW3gNywJ66ZizzhsABpc8bXGaW4i0eKrJfcTObcdN6g/cag2/dcZZ1qmbBiT968LTIP7Ma8zYrn2RMwIFwqugnKdNRNx6ARBoBoB3RuOEy+7Tmf4C5UU3uRKEoGOHSSPL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(54906003)(70586007)(70206006)(8676002)(4326008)(6862004)(8936002)(316002)(478600001)(6486002)(40460700003)(5660300002)(41300700001)(36756003)(33656002)(2906002)(86362001)(6512007)(40480700001)(81166007)(356005)(83380400001)(26005)(107886003)(336012)(2616005)(53546011)(6506007)(82740400003)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 08:14:42.2938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7d0238-b209-4180-1a91-08dbf56a3be0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5572

Hi Julien,

Thanks a lot for your review and comment, this is very helpful.

> On 4 Dec 2023, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jens,
>=20
> On 04/12/2023 07:55, Jens Wiklander wrote:
>> When an FF-A enabled guest is destroyed it may leave behind memory
>> shared with SPs. This memory must be reclaimed before it's reused or an
>> SP may make changes to memory used by a new unrelated guest. So when the
>> domain is teared down add FF-A requests to reclaim all remaining shared
>> memory.
>> SPs in the secure world are notified using VM_DESTROYED that a guest has
>> been destroyed. An SP is supposed to relinquish all shared memory to all=
ow
>> reclaiming the memory. The relinquish operation may need to be delayed i=
f
>> the shared memory is for instance part of a DMA operation.
>> If the FF-A memory reclaim request fails, return -ERESTART to retry
>> again. This will effectively block the destruction of the guest until
>> all memory has been reclaimed.
>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>> ---
>> Hi,
>> This patch is a bit crude, but gets the job done. In a well designed
>> system this might even be good enough since the SP or the secure world
>> will let the memory be reclaimed and we can move on. But, if for some
>> reason reclaiming the memory is refused it must not be possible to reuse
>> the memory.
>=20
> IIUC, we are trying to harden against a buggy SP. Is that correct?

This is not hardening as this is a possible scenario with a correctly imple=
mented SP.
This is valid for the SP to not be able to relinquish the memory directly s=
o we have
to take this possibility into account and retry.

What is not expected if for the SP to never release the memory hence the po=
ssible
"todo" at the end of the code where i think we might have to implement a co=
unter
to bound the possible number of loops but as always the question is how man=
y...

In this case the only solution would be to park the memory as suggested aft=
er
but we are not completely sure where hence the RFC.

>=20
>> These shared memory ranges are typically quite small compared to the
>> total memory usage of a guest so it would be an improvement if only
>> refused shared memory ranges where set aside from future reuse while the
>> guest was destroyed and other resources made available for reuse. This
>> could be done by for instance assign the refused shared memory ranges
>> to a dummy VM like DOMID_IO.
>=20
> I like the idea to use a dummy VM, but I don't think DOMID_IO is right. O=
nce teardown has completed, the domain will stay around until the last refe=
rence on all pages are dropped. At this point, the amount of memory left-ov=
er is minimum (this is mostly bookeeping in Xen).
>=20
> From the userland PoV, the domain will still show-up in the list but tool=
s like "xl list" will show "(null)". They are called zombie domains.
>=20
> So I would consider to keep the same domain around. The advantage is you =
can call "xl destroy" again to retry the operation.

In this scenario the "restart" implementation here is right but how could w=
e park the VM as "zombie" instead of busy looping in
the "kill" loop of userland ?

Also we need to release all the memory of the VM but the one shared with th=
e SP.=20

I will let Jens answer the more implementation questions here after and try=
 to help on the more "system" ones.

>=20
>> Thanks,
>> Jens
>> ---
>>  xen/arch/arm/tee/ffa.c | 36 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 183528d13388..9c596462a8a2 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -1539,6 +1539,7 @@ static bool is_in_subscr_list(const uint16_t *subs=
cr, uint16_t start,
>>  static int ffa_domain_teardown(struct domain *d)
>>  {
>>      struct ffa_ctx *ctx =3D d->arch.tee;
>> +    struct ffa_shm_mem *shm, *tmp;
>>      unsigned int n;
>>      int32_t res;
>>  @@ -1564,10 +1565,45 @@ static int ffa_domain_teardown(struct domain *d=
)
>>              printk(XENLOG_ERR "ffa: Failed to report destruction of vm_=
id %u to  %u: res %d\n",
>>                     get_vm_id(d), subscr_vm_destroyed[n], res);
>>      }
>> +    /*
>> +     * If this function is called again due to -ERESTART below, make su=
re
>> +     * not to send the FFA_MSG_SEND_VM_DESTROYED's.
>> +     */
>> +    subscr_vm_destroyed_count =3D 0;
>=20
> AFAICT, this variable is global. So wouldn't you effectively break other =
domain if let say the unmapping error is temporary?
>=20
>>        if ( ctx->rx )
>>          rxtx_unmap(ctx);
>>  +
>> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
>> +    {
>> +        register_t handle_hi;
>> +        register_t handle_lo;
>> +
>> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
>> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
>=20
> Is this call expensive? If so, we may need to handle continuation here.

This call should not be expensive in the normal case as memory is reclaimab=
le
so there is no processing required in the SP and all is done in the SPMC wh=
ich
should basically just return a yes or no depending on a state for the handl=
e.

So I think this is the best trade.

@Jens: One thing to consider is that a Destroy might get a retry or busy an=
swer and we
will have to issue it again and this is not considered in the current imple=
mentation.

After discussing the subject internally we could in fact consider that if a=
n SP cannot release
some memory shared with the VM destroyed, it should tell it by returning "r=
etry" to the message.
Here that could simplify things by doing a strategy where:
- we retry on the VM_DESTROY message if required
- if some memory is not reclaimable we check if we could park it and make t=
he VM a zombie.
What do you think ?


>=20
>> +        if ( res )
>> +        {
>> +            printk(XENLOG_INFO, "ffa: Failed to reclaim handle %#lx : %=
d\n",
>> +                   shm->handle, res);
>=20
> I think you want to use XENLOG_G_INFO to use the guest ratelimit. Also, I=
 would suggest to print the domain ID in the logs (see '%pd').
>=20
>=20
>> +        }
>> +        else
>> +        {
>> +            printk(XENLOG_DEBUG, "ffa: Reclaimed handle %#lx\n", shm->h=
andle);
>=20
> Same here. You want to use XENLOG_G_DEBUG and print the domain ID.
>=20
>> +            ctx->shm_count--;
>> +            list_del(&shm->list);
>> +        }
>> +    }
>=20
> NIT: New line here please for clarity.
>=20
>> +    if ( !list_empty(&ctx->shm_list) )
>> +    {
>> +        printk(XENLOG_INFO, "ffa: Remaining unclaimed handles, retrying=
\n");
>=20
> Same as the other printks.
>=20
>> +        /*
>> +         * TODO: add a timeout where we either panic or let the guest b=
e
>> +         * fully destroyed.
>> +         */
> Timeout with proper handling would be a solution. I am not sure about pan=
ic-ing. Do you think the TEE would be in a bad state if we can't release me=
mory?
>=20
>> +        return -ERESTART;
>> +    }
>> +
>>      XFREE(d->arch.tee);
>>        return 0;
>=20
> Cheers,
>=20

Cheers
Bertrand

> --=20
> Julien Grall



