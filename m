Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4555F8E3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 09:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357588.586232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6S4F-0001Eh-3P; Wed, 29 Jun 2022 07:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357588.586232; Wed, 29 Jun 2022 07:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6S4F-0001Cu-0a; Wed, 29 Jun 2022 07:24:55 +0000
Received: by outflank-mailman (input) for mailman id 357588;
 Wed, 29 Jun 2022 07:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiI7=XE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o6S4D-0001Co-Jg
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 07:24:53 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50079.outbound.protection.outlook.com [40.107.5.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91209e78-f77c-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 09:24:52 +0200 (CEST)
Received: from DB7PR05CA0041.eurprd05.prod.outlook.com (2603:10a6:10:2e::18)
 by AS8PR08MB7919.eurprd08.prod.outlook.com (2603:10a6:20b:53a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 07:24:50 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::2a) by DB7PR05CA0041.outlook.office365.com
 (2603:10a6:10:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Wed, 29 Jun 2022 07:24:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 07:24:49 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Wed, 29 Jun 2022 07:24:49 +0000
Received: from f910740833bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E945B5ED-3366-4A94-9D73-BF3BAD374B50.1; 
 Wed, 29 Jun 2022 07:24:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f910740833bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 07:24:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8011.eurprd08.prod.outlook.com (2603:10a6:150:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 07:24:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Wed, 29 Jun 2022
 07:24:36 +0000
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
X-Inumbo-ID: 91209e78-f77c-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=InAND9r4oiv8xYPczmAnsDVVD/UtO+9ownfAFghBz/sIiywGyES3sMgvAflyEKwD+0R5w3YUag+8WJgYPk3Ty159sfL4Ibp8JP6LsQRwhErwWXHIyEQC3kkLLmfSEwwUoRkmXdNPHXobkcXGMtcM8e7Gbg1uHd0z4y+pliYOYjy+yZj7AIo2swJk+wwh1NI05FHgO76WrLI6y3k1RMKPUqpY3T0jUAg7U+mKvd2AyYenUcUdGPA2RF3V2OtJ/RIW0Zo3Pfl10lo5rKH+JoJyIdjMFq5QlgA/uyWUybOq7wrZiTbOuKjmZdHkPMw0M/CQs0ksHocosIpX4VzlR6FEYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EbsGJD4I+ly+24gKzUWrr0eH8sJyGBH/nl4+VcvseE=;
 b=Fk1LAPwKH5ZARubk4sQ760O8z5lJcdzR1lJoiZ0zHb+vtXEE9Byhl4ND2g3gBNkkkhhhLEKnitE3m5rdjQiKTyAJdNIPfX+ctwPD0eWjjfi2fKbJqkzilQS4NsaWznUI6Nr7djkCkDY0nFuNMpiv7G0LVEdHSRteUsl7fHmseu4p7Bhv+8O0dbbrYJjSC4/2LO2/go184dtIeJmV7mssxULJz79VJ/AEI/FXJVQvkEqBW9TO1zi0F7qV9FNpTpWVsfRZ1tyRhCpId1KTwIxfd0FMzL9iOCA22HWkhqPRjB802lIYsyHSJVRASVlJ8fxGUplLS1+McmdY7SLtSC197w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EbsGJD4I+ly+24gKzUWrr0eH8sJyGBH/nl4+VcvseE=;
 b=6BFE1i0AtwuuijixyQdfUCQkSKYPKgoPk+dCgQXjS+cJcvD+O+/b0XULP0CKSk5RNvSwMf4CGv1vYVsAtLvBJgZQugpU7HnaufKI+f4Cv+xMMXOLiDiag+PcCZMFyIGBD+KSOKSf0UwXA4USavBxldfULc2ZyMEYWMMRs0t4bug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c978156913fce0f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0UBpEZVbWleMb/WwPGspq4Uk2FoOl/dO9yYMGdg+GJEd+RPFQUJKHxWtpuCVgqMirgzoEFWrx1XskoGJiEF+G05mow6l90ST8vCRIqqemZILyiOVUmcKXqDz5rQeuyhUOqcHhldpQPboeBJA/JqL+a1dc6E6tSYSCRXGBIssk5+BiIJUlbxxmvYeUo77ghXviFfLN+cZx/dtVL0qLSM3dAwgPZUJV6yAlp7nFuRmUS2luR+0MtfwNolPhwbQgIbq8wZULJTtWZFQ5hvoL8r2Jsvz5nvBRCuRV5HzmCBzd/wFsGAw1xkY3q9Q2k2P6eTh7LhUPUZSVawrtzRSMT/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EbsGJD4I+ly+24gKzUWrr0eH8sJyGBH/nl4+VcvseE=;
 b=CSqeLoH9jLVjeYqELhp+XiAoukAd0CTE8IkFIp7fVoYiRjlYC/4tQIKMTnBHM3zgpySKx+WXstnW9AUnNzrVVoI2aKFQH0/vlTe80bsKT/CgGluS4A1l8PUozlMrnwIbm8pJm707GtvPipvrQWgjq+CmWwbSN0R05ucqZCPedqL23oJm8SOtcYYZUOBeHF3/oRSUcJ9Xe06/RU/6KIcRydHW/nJB/ElfkAteOf9IILpfRld8LoeAyg9RtK2w0zIvNFIgvWAgdyUFDQAQm04UUTSreswmQ++knZUUlX9fWfZMXHZchy9WGl/jMR5rWLschCnGoEJVHxEHoVRCy+ysJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EbsGJD4I+ly+24gKzUWrr0eH8sJyGBH/nl4+VcvseE=;
 b=6BFE1i0AtwuuijixyQdfUCQkSKYPKgoPk+dCgQXjS+cJcvD+O+/b0XULP0CKSk5RNvSwMf4CGv1vYVsAtLvBJgZQugpU7HnaufKI+f4Cv+xMMXOLiDiag+PcCZMFyIGBD+KSOKSf0UwXA4USavBxldfULc2ZyMEYWMMRs0t4bug=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Topic: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Index: AQHYiwEFKAxihkpP+kCxp/TNi89h5q1l/I6A
Date: Wed, 29 Jun 2022 07:24:36 +0000
Message-ID: <BF0AB23A-DB4B-4DA3-9E4C-C15FAD360247@arm.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
In-Reply-To: <20220628150851.8627-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e53defb0-9b19-4336-4778-08da59a073b7
x-ms-traffictypediagnostic:
	GV1PR08MB8011:EE_|DBAEUR03FT048:EE_|AS8PR08MB7919:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gNaPsnlKZXBZhDBI1oX4g+Zjxhe7OGXGQeaTE/JAq5qWOkILA2A21tCZAwLQdWbhvegYGUdmUaErq+aVJhuArlmIwMiGcZq9LJoEDX2Ym6TuRgtBp1l1W4jKl3TkNaH2brqCjvLYHSBsMJhAnxRgqVS4iEee4Er6z/sRViYmOGRKMOVUbXDVlO9ILkwRz6FBNNET6YGKA+XSGHRqbD1L6XnJBb+C/wJ8Z8NTohSN3lt4NNAK/RD512vkm6BS+DDR+Me91J6P1wuB8ImQc8ELc4u4axkSV0b6XgwqJERih/jr3zPVsUhDR+KLyN7Jw5bnPBVEVY4/z4OlNPyHLDPH6IXsDleaviVeBgKfroYnC8PGvOGkSMNzilYseLNnZX0zvTUzjyRZLOhZfmNW+MrgDh6bLDr1MA30eXMupcRutCLkve/uVf6f6HD/fk8C86WlqmMT+owUMnvd6QT2eoTJN7tHv5D01OepbxOjpFZXtdllayvZqkZ4BOEoS2QA/SBX84mEuCA+/QIh9Q8GA4fZB57qPKrIkqYlvK0J45AuZcq9LmEaGNSfJYi+xuwgdFZ8Zxh8pXg7iX61lL+PwoUjOTxPhTJZlumWLvBpN0qOsSrXYfrLfImTwyDQFJS9x+jvUbAOGi7B5gZK2ki7VelP7L3lPirJmWcs6ixjbh09a1uZBjSuTNLBAN+DraZMcxfEnkO/vtLcAgq1l2vMSwnUdKVWSItk+JFm98vmtNBpRZQy60Gh2nBhDAFX30WtS6RAGJoXST2C4mLu1H+F7yiTrMjxP01PFCiKy1yvG83m2i69U+qPb3GcKOCTWbJ+qflsWHrWZQfYzuOxxcnPs5fKuw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(83380400001)(38100700002)(33656002)(478600001)(5660300002)(2906002)(38070700005)(36756003)(8936002)(41300700001)(6506007)(53546011)(86362001)(122000001)(316002)(66476007)(8676002)(66446008)(4326008)(6512007)(66556008)(66946007)(2616005)(64756008)(6486002)(71200400001)(186003)(6916009)(54906003)(91956017)(76116006)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B901EAF10719924DB2C13DBF155DE92F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8011
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5edb8ecb-e51e-4238-5aff-08da59a06b9e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aoALF96Q/drMJJxoT5tm3YYcuNHdYWqOb+NNyTRT1Nu0VonRoTbuLcgc8GPcsWHHl5OjXQJb08nyDSaVHVbXc/ePdrVQfvX1ebX/W0C1Nh/AaeMmY0GPeuOYkKL/sanY/w1c5mgqsKAX5bKJKrJu9vztja/0EH+YMKGG7r3NaWlEd3YmidkmC6/4VoIS3xnGv9tggI6XsXERvg63luctsaX6npD6Jrk7aynyqDv6C9/3xNd9eo3KQhqSkQY2IYBBHq46RLuvIl50ufFYA5ld7fYYZyFOobfNzlQ6TGogykolUrn+HhaWs2teLxnsQB3NHqDL3b2wFWm3VI0ZOq+tj/9ZKH2SbmJQfi1pT9jnN20JIJO2ubL3YAwGETftpt3L8CPCccj99+kKmr2/mgY14deCNb/ybxMNAJhOjHwNqStX9ygBYSJVPu2pBhyrVtGS8SqPZacIbr7CzJbBYRodjkc/fVZ/Ez/5BU/OtnxQ7JzcdSsRq4qwfC6ky0QGFIkFbp97H3eO4qS3dm/oXWmm/Ne7Ztv45ZG+7bA+5GQUGBmxmWAixl7emO1RpHuG8FocVSCtRu8OAr1Ma9wIDfTj2QueaEY5NbePH1Qmfuj35ZFxJ05jVRh2sctFmBfQG5VSkThsZUEvdiV59G81LVO9g8Z9RuZiF6IO1jjl7YAHQrsMQFE570/L+C9ikSNmlhq2FRtKNlfyxGZOpusInIZdFo028qwXJ3QydXHEkI5a5k7FzGRKegSIdlLAqkBKwGsIPy78Q2AIao10beYAsmzP+pZOO6ZrmKrT5KOSkDY5E2yISKQkCcBod/KBr/LgVVWF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(40470700004)(47076005)(336012)(6512007)(53546011)(2616005)(107886003)(186003)(36860700001)(6506007)(40480700001)(83380400001)(2906002)(6862004)(5660300002)(8936002)(40460700003)(82310400005)(6486002)(41300700001)(478600001)(4326008)(70586007)(54906003)(8676002)(316002)(70206006)(86362001)(33656002)(356005)(81166007)(36756003)(26005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 07:24:49.7220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e53defb0-9b19-4336-4778-08da59a073b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7919

Hi Xenia,

> On 28 Jun 2022, at 16:08, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> The expression 1 << 31 produces undefined behaviour because the type of i=
nteger
> constant 1 is (signed) int and the result of shifting 1 by 31 bits is not
> representable in the (signed) int type.
> Change the type of 1 to unsigned int by adding the U suffix.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
> For GBPA_UPDATE I will submit a patch.
>=20
> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 1e857f915a..f2562acc38 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct de=
vice *dev,
> #define CR2_E2H				(1 << 0)
>=20
> #define ARM_SMMU_GBPA			0x44
> -#define GBPA_UPDATE			(1 << 31)
> +#define GBPA_UPDATE			(1U << 31)
> #define GBPA_ABORT			(1 << 20)
>=20
> #define ARM_SMMU_IRQ_CTRL		0x50
> @@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct de=
vice *dev,
>=20
> #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
> #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))

Could also make sense to fix those 2 to be coherent.

> -#define Q_OVERFLOW_FLAG			(1 << 31)
> +#define Q_OVERFLOW_FLAG			(1U << 31)
> #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
> #define Q_ENT(q, p)			((q)->base +			\
> 					 Q_IDX(&((q)->llq), p) *	\

Cheers
Bertrand


