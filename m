Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B896603092
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 18:12:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425305.673036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okpCF-0006AS-Qz; Tue, 18 Oct 2022 16:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425305.673036; Tue, 18 Oct 2022 16:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okpCF-00067W-N9; Tue, 18 Oct 2022 16:12:03 +0000
Received: by outflank-mailman (input) for mailman id 425305;
 Tue, 18 Oct 2022 16:12:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RnJu=2T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1okpCE-00065t-4Y
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 16:12:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98402f57-4eff-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 18:11:59 +0200 (CEST)
Received: from DU2P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::25)
 by DB3PR08MB8913.eurprd08.prod.outlook.com (2603:10a6:10:43a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 16:11:57 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::e5) by DU2P251CA0010.outlook.office365.com
 (2603:10a6:10:230::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 16:11:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 16:11:57 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 18 Oct 2022 16:11:57 +0000
Received: from ae42d45d7561.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37C49311-F5F9-48E3-A3F3-88C8C2FF497B.1; 
 Tue, 18 Oct 2022 16:11:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae42d45d7561.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Oct 2022 16:11:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6427.eurprd08.prod.outlook.com (2603:10a6:10:25a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 16:11:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 16:11:43 +0000
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
X-Inumbo-ID: 98402f57-4eff-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eumjy+BzVu7eRBaFndoRLmBo+Re90O6CzPOEzmoCLszG+jWFTeeSkPjovTnGfANpSABZCLd7B9KTZ5kH4J8v8MoEvnniMmkaulUZCkBRZmNoNToSbEZf8zErPGYsTQ3F4Px7DjgHuDf2z3UUXtw1SPN2bNoWROvHmIvMe/5lCMY+E7x7bDaqbVo1ADWWDua6jevuszxQkR82u637P5htOdegOAaeo6EHGWGlND/fq0+5xqTXIqnQwO34NH3f3C1MRsjIPuKVVWw49klJrkd4Yrvp87BoFxJr6EySQ/Uwz23pRqYl/H7id77pEW5R/6P3vP1Q/CV4j+3jroF5jRdCKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFQ3hU6pgKRN9KLaAKrTOdnpabWGjgVOhZI8BI+ZFYE=;
 b=XPSq14Yw4Kk2xzZk2ihkWdMSOb4Wio2Q5WPhG8plVO/5y13FtzhbYKz/8R01yx9vbyloIE6JMFZ+lgwS9jGozDADD9MtXPSh/bnHKQ4DYZqrzrqbN37R/dK66xhYowf+3dGvKqFkX+kSj5qoSVPCoVrmttHWn8NsfhTUhT63YZpuslvBXWzWwcYN82soTx4I/cqVNZacNAPuHi+HmsbMzysBuQtV7idlXlG51PMVgeYBDpXWvJbjNZshW/xzYpVDvkPKF2R0PLC3hRtChqqXP25vLIt7AFl8HSkBaZMatfFhlpvQ155HXMHuufL1WLl94Ies+ZFqauyqc3tmRHHmbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFQ3hU6pgKRN9KLaAKrTOdnpabWGjgVOhZI8BI+ZFYE=;
 b=Em/vni01cmYEQclE5rNY+PZHmk1Sx5LHSC5JxTT3sPaEgqXdn12TXg6OWH9C8zUvE6NFKQYv6uQSJcf89NTZ8v2WIacA59FpOBSmq25J8ZVztkRxkzY/aRfSkaJUZ4araCBnyCJnaL/DIS45lqLj5aSMZcXWVOq3XIguhp/0VEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 553b3c67a07c87a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Koje0jNsrMBjrc6b4Keh8d8UGbCaOm7MHmWiEMcOAjXyfatT8TG0i6DYol+T2gIO70ECUD5QyN68pWFldge1yPuVrzptxbzhJ3pk4+3Kq/VV4Rkc8fSG0TXXxVEL+wta28fQLz9PX0gY5vi3aIlh2EvY7x8GeIgwMcp/FevIondozJkcM+vpPtLhAQTpsGBaHLzhBCdgQyhXB2jP4n2bJTuykg/sesKvMnD0sTlQ2xVVxdrQtRT+FlbU0eZAxuaHBEFMChElGPa6L8H7pyLFgAEl10o8Z+gmZmhj3fWTH4u01Us5Mbcixh+jGABu2Rom4aZLtqkNFZWGy8+Px2sqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFQ3hU6pgKRN9KLaAKrTOdnpabWGjgVOhZI8BI+ZFYE=;
 b=a2gmSSLm8HJzbvbH5g7CL11xcyGn2bmVXmmj5mveWiZBij/1jEZYBNSZKvF+9vCZ3to4k4KnPu8x6lRhYdUkHKazKkwdjD3zPfn2qf3G32hyYRYg/iyPhhC3/j/5iGMWx2bG0GIQ8/J65uF7fva7qDiTQL/wZV6AoDgSPjuNCW2D0zTQUZt+ajWnXKr6QyyYt0NhCRTpq1bZqPXjSmjOac66Z8uKaZe9LV+dhA++P0i+xu5goypXSmT6vELtjqVPCriztpE3+CC4QJ2Ai/JAe98BSNCBf1XC9npgjqqHy03tNVPBcjfDg7jthRoZUAa15QU8QPOJdlDI359bnL1GmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFQ3hU6pgKRN9KLaAKrTOdnpabWGjgVOhZI8BI+ZFYE=;
 b=Em/vni01cmYEQclE5rNY+PZHmk1Sx5LHSC5JxTT3sPaEgqXdn12TXg6OWH9C8zUvE6NFKQYv6uQSJcf89NTZ8v2WIacA59FpOBSmq25J8ZVztkRxkzY/aRfSkaJUZ4araCBnyCJnaL/DIS45lqLj5aSMZcXWVOq3XIguhp/0VEk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Proposal for deviations in static analyser findings
Thread-Topic: Proposal for deviations in static analyser findings
Thread-Index:
 AQHY3lPHM2Tyba3hCkeKMW07GDOb2a4L9DeAgAAnewCAABdGAIAIGdUAgAADdICAAAu3gA==
Date: Tue, 18 Oct 2022 16:11:43 +0000
Message-ID: <A906FDB6-7DA5-4900-A6DE-1140231E69AE@arm.com>
References: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
 <ddc5039d-e312-326a-b71c-8d08d04100e0@suse.com>
 <186C83D7-6C7A-4319-86E4-69F7FDA7FDA5@arm.com>
 <559a3d4c-08ea-ef8c-9a56-2b53db3d51e4@suse.com>
 <E00E3AE4-7863-4231-9DB7-A7B66C8F6791@arm.com>
 <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
In-Reply-To: <233a9356-b64f-37f7-d7ee-3d6223224497@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6427:EE_|DBAEUR03FT049:EE_|DB3PR08MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c42f0ba-2878-4117-3164-08dab1237b17
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Kg+eW9mWB0xNtjwE0H6rFpH6pmE3cCnwJEYq9Vd8o1/e4NM0pV/a80jI8Oo1vNm8pMqwdZetIqYzAL0FtSEKxo6y3RcMKGe1Eh61Q8qHE+AXLsdGz4Vvrx9Q8v+r8YVbwwrly+TWEbRJ598UEtmoJU8ET/KumFgWtVWmodc32Pak4j1vI5ffZZ9BS5gsUa++QS9ahxyHjCWS8YsQrFxUOFpc0Y4HOxLiq19IPbe2P+Csed3/nFNrfZzEtv4zda4yk1wYmHdM5zIrd34yCN+OeY8zNbsCSnzpC5hbBTSR0gKlPOa4Sx2OuWS1D5PibexytpEqP7/RFNgccVEk/3w7xShJT4ywaLGEiLp3F+sfixcF/GGRwcShMiUuImehAlGZU2NKr6vYJz/I4bVKquyQpBdnCcZPnvG/aWuFVcTBWFMBe8HkhyM7gHYcfm3ogfOZ5QjdHfom73/3lkXah95QqYXwN+gKP9pFES8H3TR2ZqrqYt1iYk+O6Pd+VW+KI2sxoiHRf00fkB74NnhSiLLYc04nCvEk5u3OZU4Cr9i2RwTGCl9kChkaNfkPtu3SOKrC5xWGBcfVN4pD/WkV2lSUpIMg6Pv9MTY0HdE2sS3/40J3sAt3G3phLa+C21LZLb1V28sKaw47HZSxJwYSAnBtO/aAb8RSAN39cs8hJh1xgW2Mxesckwfa6nXANB+72ls+Z3kdUz9cBJfAXpI/hz1ciIC/4E+wSti0wuUcaYfrDTZOBMBsovacJjb2uJh4ObUqGvd7GsnodyG2b0HqeHRTREL49zNRJQGxvg7RZFVwVts=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(83380400001)(2906002)(186003)(2616005)(86362001)(33656002)(4326008)(8676002)(26005)(6506007)(66446008)(64756008)(6512007)(41300700001)(53546011)(38070700005)(36756003)(316002)(54906003)(66476007)(122000001)(38100700002)(66556008)(8936002)(71200400001)(5660300002)(6916009)(66946007)(76116006)(91956017)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6AF9A4124F1FC46BA85048787D26808@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6427
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae883c9f-0ca7-4d20-c6be-08dab123730a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S9nSJQo545FPEJE8GawoNOiLyj3tIMwHcQTRTev8JO7oqr22dRGqCte2TUoiykKyJVTp0xB9U4u5bUPvLxf4266DCYkTG6AbeLInLUS7/JC1P3gUK+mmWEnpHOynuQcNdpFvJFBnoJPijP4dfvFi2crmWzKdrvko11LWe7QVXKxlPmWlgpzwO/PrIt2pV9GFhzGri+bQtsuEd7AoShcNcVGgKAsHRm8vQPlDiWEJ2/Rm5iTtR/bmhmXn1B5V1O7QlL0IE16dcIhu++233UGxszAAgvMJ1n55e9sUHz8B180RdYsu18oW0EFSKVY7nbAjF0+LJpUTPRFU5y6c3txxtyb7WAnsh4QEY6LJu5KFg++Pb5yQy+Sq/C8KcnmI0qCDVV4k1o5cMXUb+SzTrPb+rTbCD1qB0+CHC7Km8ho7Il+RyvUbRJTRq5Ozbzufm8Dhgl12F9Vt5aBGJ2LIBUzMvU0FgRs3WutN0Qu/X/Ymh6NegLPhhpdxJKJd03W44lkbmrwlX6c0RYfKY0zw/L7zldviw2HmY9G+zB0Yiirstfa7DXj99Su42nUrOL+LIiCsT3kd0Kx83liNcI+k09Djlg9/5DuqhKfAPnXYpv878rOvU3XJVTzOA9RG8PvEHC9FaHmddnAoaSSKVvLzj7G8ku9kPYUVWlfUU95/YbyPhtFto+/M48QcqNLNkK2kUS1cR3J2KWgca2OyVxMJphUsFEl7rY8DoZesjsGfcR+UmZAjVOvNpcRNjASS93vQ/+fCLWlCHVr1ajZq07I/SQhVVQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(86362001)(40480700001)(82740400003)(36756003)(36860700001)(33656002)(40460700003)(81166007)(356005)(82310400005)(83380400001)(316002)(478600001)(54906003)(6486002)(53546011)(41300700001)(26005)(8936002)(2616005)(6506007)(6512007)(5660300002)(6862004)(70206006)(70586007)(8676002)(4326008)(336012)(186003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 16:11:57.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c42f0ba-2878-4117-3164-08dab1237b17
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8913

SGksDQoNCj4gT24gMTggT2N0IDIwMjIsIGF0IDE2OjI5LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTguMTAuMjAyMiAxNzoxNywgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+PiBPbiAxMyBPY3QgMjAyMiwgYXQgMTI6MzQsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMTMuMTAuMjAyMiAxMjoxMSwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+Pj4+IE9uIDEzIE9jdCAyMDIyLCBhdCAwODo1MCwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDEyLjEwLjIwMjIgMTg6MDAsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gRW50cmllcyBpbiB0aGUgZGF0YWJhc2Ugc2hvdWxk
IG5ldmVyIGJlIHJlbW92ZWQsIGV2ZW4gaWYgdGhleSBhcmUgbm90IHVzZWQNCj4+Pj4+PiBhbnlt
b3JlIGluIHRoZSBjb2RlIChpZiBhIHBhdGNoIGlzIHJlbW92aW5nIG9yIG1vZGlmeWluZyB0aGUg
ZmF1bHR5IGxpbmUpLg0KPj4+Pj4+IFRoaXMgaXMgdG8gbWFrZSBzdXJlIHRoYXQgbnVtYmVycyBh
cmUgbm90IHJldXNlZCB3aGljaCBjb3VsZCBsZWFkIHRvIGNvbmZsaWN0cw0KPj4+Pj4+IHdpdGgg
b2xkIGJyYW5jaGVzIG9yIG1pc2xlYWRpbmcganVzdGlmaWNhdGlvbnMuDQo+Pj4+PiANCj4+Pj4+
IENhbiB3ZSBhZGQgcHJvdmlzaW9ucyBmb3Igc2hyaW5raW5nIHN1Y2ggZW50cmllcyB0byBlLmcu
IGp1c3QgdGhlaXIgImlkIg0KPj4+Pj4gbGluZT8gT3IgaXMgdGhlIGludGVudGlvbiB0byBiZSBh
YmxlIHRvIHJlLXVzZSBzdWNoIGFuIGVudHJ5IGlmIGEgbWF0Y2hpbmcNCj4+Pj4+IGluc3RhbmNl
IGFwcGVhcnMgYWdhaW4gbGF0ZXI/DQo+Pj4+IA0KPj4+PiBJIHByZWZlciB0byBkb27igJl0IHNo
cmluayBpdCwgdGhlIG5hbWUgaXRzZWxmIGlzIG5vdCB2ZXJ5IGxvbmcsIGV2ZW4gdXNpbmcgbWFu
eSBkaWdpdHMgb2YgdGhlIGluY3JlbWVudGFsDQo+Pj4+IG51bWJlciwgaXQgcmVtb3ZlcyBhbHNv
IHRoZSBkZXBlbmRlbmN5IG9uIHRoZSBmaWxlIG5hbWUuDQo+Pj4gDQo+Pj4gTmFtZSBsZW5ndGgg
aXNuJ3QgcmVsZXZhbnQgaGVyZSwgYW5kIEkgaGF2ZSBubyBpZGVhIHdoYXQgZGVwZW5kZW5jeSBv
biBhDQo+Pj4gZmlsZSBuYW1lIHlvdSdyZSB0aGlua2luZyBvZi4gTXkgcXVlc3Rpb24gaXMgYSBz
Y2FsYWJpbGl0eSBvbmU6IE92ZXIgdGltZQ0KPj4+IHRoZSB0YWJsZSB3aWxsIGdyb3cgbGFyZ2Uu
IElmIGFsbCBlbnRyaWVzIHJlbWFpbiB0aGVyZSBpbiBmdWxsIGZvcmV2ZXIsDQo+Pj4gdGFibGUg
c2l6ZSBtYXkgYmVjb21lIHVud2llbGR5Lg0KPj4gDQo+PiBPayBJIG1pc3VuZGVyc3Rvb2QgeW91
ciBxdWVzdGlvbiwgbm93IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBhcmUgYXNraW5nLCB3ZSBjb3Vs
ZCByZW1vdmUgdGhlIGNvbnRlbnQNCj4+IG9mIHRoZSDigJxhbmFseXNlcuKAnSBkaWN0aW9uYXJ5
IGZvciBzdXJlLCBiZWNhdXNlIGlmIHRoZXJlIGlzIG5vdCBhbnltb3JlIGEgbGluayB3aXRoIHRo
ZSBjdXJyZW50IGNvZGUuDQo+PiANCj4+IFJlZ2FyZGluZyByZW1vdmluZyB0aGUg4oCcbmFtZeKA
nSBhbmQg4oCcdGV4dOKAnSwgY291bGQgaXQgYmUgdGhhdCBhdCBzb21lIHBvaW50IHdlIGNhbiBp
bnRyb2R1Y2UgaW4gdGhlIGNvZGUNCj4+IGEgdmlvbGF0aW9uIHRoYXQgcmVxdWlyZXMgdGhlIHNh
bWUganVzdGlmaWNhdGlvbiBwcm92aWRlZCBieSB0aGUg4oCcb3JwaGFu4oCdIGVudHJ5Pw0KPj4g
SW4gdGhhdCBjYXNlIHdlIGNvdWxkIHJldXNlIHRoYXQgZW50cnkgd2l0aG91dCBjcmVhdGluZyBh
IG5ldyBvbmUgdGhhdCB3aWxsIG9ubHkgd2FzdGUgc3BhY2UuDQo+PiBXaGF0IGlzIHRoZSBvcGlu
aW9uIG9uIHRoaXM/DQo+IA0KPiBXZWxsLCB5ZXMsIHRoaXMgaXMgdGhlIG9uZSBjYXNlIHRoYXQg
SSwgdG9vLCB3YXMgd29uZGVyaW5nIGFib3V0LiBJdCdzIG5vdA0KPiBjbGVhciB0byBtZSB3aGV0
aGVyIGl0IHdvdWxkbid0IGJlIGJldHRlciB0byBhbGxvY2F0ZSBhIGZyZXNoIElEIGluIHN1Y2gg
YQ0KPiBjYXNlLg0KDQpGb3IgdHJhY2VhYmlsaXR5IGFuZCByZWxlYXNlIGhhbmRsaW5nIEkgdGhp
bmsgaXQgaXMgaW1wb3J0YW50IHRoYXQ6DQotIHdlIG5ldmVyIHJldXNlIHRoZSBzYW1lIElEIGlu
IGFueSBjYXNlDQotIHdlIGtlZXAgSURzIGluIHRoZSBkYXRhYmFzZSBldmVuIGlmIHRoZXJlIGlz
IG5vIG9jY3VycmVuY2UgaW4geGVuIGNvZGUgYXMgdGhpcyB3aWxsIHByZXZlbnQgYWRkaW5nIGEg
bmV3IElEIGlmIGFuIGV4aXN0aW5nIG9uZSBjYW4gYmUgcmV1c2VkDQoNCkluIGEgY2VydGlmaWNh
dGlvbiBjb250ZXh0LCB3aGVuIGEganVzdGlmaWNhdGlvbiBoYXMgYmVlbiB2YWxpZGF0ZWQgYW5k
IGFncmVlZCBpdCB3aWxsIG1ha2UgbGlmZSBhIGxvdCBlYXNpZXIgdG8gbm90IG1vZGlmeSBpdCBh
bmQgcmV1c2UgaXQgaW4gdGhlIGZ1dHVyZSBpZiBpdCBpcyBuZWVkZWQuDQpGcm9tIG91ciBwb2lu
dCBvZiB2aWV3LCBoYXZpbmcgYSBjbGVhciBhbmQgc2ltcGxlIHdheSBvZiBoYW5kbGluZyB0aG9z
ZSB3aWxsIG1ha2UgYmFja3BvcnRzIGEgbG90IGVhc2llci4NCg0KDQo+Pj4+Pj4gSGVyZSBhIGJy
aWVmIGV4cGxhbmF0aW9uIG9mIHRoZSBmaWVsZCBpbnNpZGUgYW4gb2JqZWN0IG9mIHRoZSAiY29u
dGVudCIgYXJyYXk6DQo+Pj4+Pj4gLSBpZDogaXQgaXMgYSB1bmlxdWUgc3RyaW5nIHRoYXQgaXMg
dXNlZCB0byByZWZlciB0byB0aGUgZmluZGluZywgbWFueSBmaW5kaW5nDQo+Pj4+Pj4gY2FuIGJl
IHRhZ2dlZCB3aXRoIHRoZSBzYW1lIGlkLCBpZiB0aGUganVzdGlmaWNhdGlvbiBob2xkcyBmb3Ig
YW55IGFwcGxpZWQNCj4+Pj4+PiBjYXNlLg0KPj4+Pj4+IEl0IHRlbGxzIHRoZSB0b29sIHRvIHN1
YnN0aXR1dGUgYSBYZW4gaW4tY29kZSBjb21tZW50IGhhdmluZyB0aGlzIHN0cnVjdHVyZToNCj4+
Pj4+PiAvKiBTQUYtMC1zYWZlIFsuLi5dIFwqLw0KPj4+Pj4+IC0gYW5hbHlzZXI6IGl0IGlzIGFu
IG9iamVjdCBjb250YWluaW5nIHBhaXIgb2Yga2V5LXZhbHVlIHN0cmluZ3MsIHRoZSBrZXkgaXMN
Cj4+Pj4+PiB0aGUgYW5hbHlzZXIsIHNvIGl0IGNhbiBiZSBjcHBjaGVjaywgY292ZXJpdHkgb3Ig
ZWNsYWlyLiBUaGUgdmFsdWUgaXMgdGhlDQo+Pj4+Pj4gcHJvcHJpZXRhcnkgaWQgY29ycmVzcG9u
ZGluZyBvbiB0aGUgZmluZGluZywgZm9yIGV4YW1wbGUgd2hlbiBjb3Zlcml0eSBpcw0KPj4+Pj4+
IHVzZWQgYXMgYW5hbHlzZXIsIHRoZSB0b29sIHdpbGwgdHJhbnNsYXRlIHRoZSBYZW4gaW4tY29k
ZSBjb21lbnQgaW4gdGhpcyB3YXk6DQo+Pj4+Pj4gLyogU0FGLTAtc2FmZSBbLi4uXSBcKi8gLT4g
LyogY292ZXJpdHlbY292ZXJpdHktaWRdIFwqLw0KPj4+Pj4gDQo+Pj4+PiBJbiBoZXJlLCB3aGVy
ZSB3b3VsZCBjb3Zlcml0eS1pZCBjb21lIGZyb20/IEFuZCBob3cgZG9lcyB0aGUgdHJhbnNmb3Jt
YXRpb24NCj4+Pj4+IGhlcmUgbWF0Y2ggdXAgd2l0aCB0aGUgdmFsdWUgb2YgdGhlICJjb3Zlcml0
eSI6IGZpZWxkIGluIHRoZSB0YWJsZT8NCj4+Pj4gDQo+Pj4+IEkgY2FuIHB1dCBhbiBleGFtcGxl
IG9mIHRoYXQsIGFzIHlvdSBwb2ludGVkIG91dCBpdCBjb3VsZCBiZSBkaWZmaWN1bHQgdG8gZ2V0
IHdoZXJlDQo+Pj4+IHRoaXMgcHJvcHJpZXRhcnkgdG9vbCBJRCBjb21lcyBmcm9tLg0KPj4+PiAN
Cj4+Pj4gVGhlIHByb3ByaWV0YXJ5IElEIChDb3Zlcml0eSBpbiB0aGlzIGNhc2UpIGNvbWVzIGZy
b20gdGhlIHJlcG9ydCBpdCBwcm9kdWNlczoNCj4+Pj4gDQo+Pj4+IFvigKZdDQo+Pj4+IDxmaWxl
IHBhdGg+OjxsaW5lIG51bWJlcj46DQo+Pj4+IDEuIHByb3ByaWV0YXJ5X0lEOiBb4oCmXQ0KPj4+
PiBb4oCmXQ0KPj4+PiANCj4+Pj4gYWZ0ZXIgd2Ugc2VlIHRoZSBmaW5kaW5nLCB3ZSB0YWtlIHRo
YXQgSUQsIHdlIHB1dCBpdCBpbiB0aGUg4oCcYW5hbHlzZXLigJ0gZGljdGlvbmFyeSBhczoNCj4+
Pj4gDQo+Pj4+IFvigKZdDQo+Pj4+ICJpZCI64oCdU0FGLTItc2FmZSIsDQo+Pj4+IOKAnGFuYWx5
c2Vy4oCdOiB7DQo+Pj4+IAnigJxjb3Zlcml0eeKAnTog4oCccHJvcHJpZXRhcnlfSUQiDQo+Pj4+
IH0sDQo+Pj4+IFvigKZdDQo+Pj4+IA0KPj4+PiBTbyBpbiB0aGUgc291cmNlIGNvZGUgd2Ugd2ls
bCBoYXZlOg0KPj4+PiANCj4+Pj4gLyogU0FGLTItc2FmZSBbb3B0aW9uYWwgdGV4dF0gKi8NCj4+
Pj4gQyBjb2RlIGFmZmVjdGVkIGxpbmU7DQo+Pj4+IA0KPj4+PiBBbmQgd2hlbiB0aGUgYW5hbHlz
aXMgd2lsbCBiZSBwZXJmb3JtZWQsIHRoZSB0b29sIChjb3Zlcml0eSBmb3IgZXhhbXBsZSkgd2ls
bCBydW4gb24gdGhpcyBzb3VyY2UgY29kZToNCj4+Pj4gDQo+Pj4+IC8qIGNvdmVyaXR5W3Byb3By
aWV0YXJ5X0lEXSAqLw0KPj4+PiBDIGNvZGUgYWZmZWN0ZWQgbGluZTsNCj4+Pj4gDQo+Pj4+IFRo
ZSB0b29sIHdpbGwgd3JpdGUgYSByZXBvcnQgYW5kIHdpbGwgc3VwcHJlc3MgdGhlIGZpbmRpbmcg
d2l0aCDigJxwcm9wcmlldGFyeV9JROKAnSB0aGF0IGNvbWVzIGluIHRoZSBDIGNvZGUNCj4+Pj4g
bGluZSBhZnRlciB0aGUgY29tbWVudC4NCj4+PiANCj4+PiBMZXQgbWUgYWRkIHNvbWUgYmFja2dy
b3VuZCB0byBteSBlYXJsaWVyIGNvbW1lbnQ6DQo+Pj4gDQo+Pj4gSWYgd2Ugd2FudGVkIHRvIGFk
ZCBzdWNoIElEcyB0byB0aGUgdGFibGUsIHRoZW4gSSBndWVzcyB0aGlzIHdvdWxkIHJlc3VsdCBp
bg0KPj4+IGEgcHJvbGlmZXJhdGlvbiBvZiBlbnRyaWVzLiBJZiBteSBvYnNlcnZhdGlvbnMgaGF2
ZW4ndCBtaXNndWlkZWQgbWUsDQo+Pj4gQ292ZXJpdHkgbWlnaHQgcmUtdXNlIHRoZSBzYW1lIElE
IGZvciBtdWx0aXBsZSBzaW1pbGFyIG5ldyBpc3N1ZXMgZm91bmQgaW4gYQ0KPj4+IHNpbmdsZSBy
dW4sIGJ1dCBpdCB3b3VsZCBub3QgcmUtdXNlIHRoZW0gYWNyb3NzIHJ1bnMuIEhlbmNlIGlycmVz
cGVjdGl2ZSBvZg0KPj4+IHRoZWlyIHNpbWlsYXJpdHksIG11bHRpcGxlIHRhYmxlIGVudHJpZXMg
d291bGQgYmUgbmVlZGVkIGp1c3QgYmVjYXVzZSBvZiB0aGUNCj4+PiBkaWZmZXJlbnQgQ292ZXJp
dHkgSURzLg0KPj4gDQo+PiBDb3Zlcml0eSB3aWxsIHVzZSBldmVyeSBydW4gdGhlIHNhbWUgaWQg
Zm9yIHRoZSBzYW1lIGNsYXNzIG9mIHZpb2xhdGlvbiwgZm9yIGV4YW1wbGUNCj4+IG1pc3JhX2Nf
MjAxMl9ydWxlXzhfNl92aW9sYXRpb24gZm9yIHZpb2xhdGlvbiBvZiBydWxlIDguNi4NCj4gDQo+
IEhtbSwgSSd2ZSBuZXZlciBzZWVuIHN1Y2guIEkgYWx3YXlzIHNhdyBpdCB1c2UgbnVtZXJpYyBJ
RHMsIGFuZCB3ZSd2ZQ0KPiBhY3R1YWxseSBiZWVuIHB1dHRpbmcgdGhlc2UgaW4gY29tbWl0cyB3
aGVuIGFkZHJlc3NpbmcgdGhlaXIgZmluZGluZ3MuDQoNCkhlcmUgSSB0aGluayB5b3UgYXJlIG1p
eGluZyBhIGZpbmRpbmcgaW5zaWRlIHRoZSBjb2RlIHdpdGggdGhlIHR5cGUgYXNzb2NpYXRlZC4N
CldlIG1pZ2h0IGhhdmUgc2V2ZXJhbCBmaW5kaW5ncyBvZiB0aGUgc2FtZSB0eXBlIGJ1dCB3aXRo
IGRpZmZlcmVudCBqdXN0aWZpY2F0aW9ucy4NCg0KPiANCj4+Pj4gQWZ0ZXIgdGhlIGFuYWx5c2lz
LCB0aGUgc291cmNlIGNvZGUgd2lsbCByZXR1cm4gYXMgdGhlIG9yaWdpbmFsICh3aXRoIHRoZSBT
QUYtKiB0YWcpLg0KPj4+IA0KPj4+IFdoaWxlIHlvdSBtZW50aW9uIHNvbWV0aGluZyBzaW1pbGFy
IGFsc28gYXMgc3RlcCAzIGluIHRoZSBvcmlnaW5hbCBkb2N1bWVudA0KPj4+IG5lYXIgdGhlIHRv
cCwgSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGlzICJyZXR1cm4gYXMgdGhl
IG9yaWdpbmFsIg0KPj4+IG1lYW5zLiBJZiB5b3Ugd2FudCB0byBydW4gdGhlIHRvb2wgb24gYW4g
YWx0ZXJlZCAoY29tbWVudHMgbW9kaWZpZWQpIHNvdXJjZQ0KPj4+IHRyZWUsIHdoYXQgSSdkIGV4
cGVjdCB5b3UgdG8gZG8gaXMgY2xvbmUgdGhlIHNvdXJjZXMgaW50byBhIHRocm93LWF3YXkgdHJl
ZSwNCj4+PiBtYXNzYWdlIHRoZSBjb21tZW50cywgcnVuIHRoZSB0b29sLCBhbmQgZGVsZXRlIHRo
ZSBtYXNzYWdlZCB0cmVlLg0KPj4+Pj4+IGlmIHRoZSBvYmplY3QgZG9lc24ndCBoYXZlIGEga2V5
LXZhbHVlLCB0aGVuIHRoZSBjb3JyZXNwb25kaW5nIGluLWNvZGUNCj4+Pj4+PiBjb21tZW50IHdv
bid0IGJlIHRyYW5zbGF0ZWQuDQo+Pj4+PiANCj4+Pj4+IElpcmMgYXQgbGVhc3QgQ292ZXJpdHkg
aWdub3JlcyBjZXJ0YWluIGluc3RhbmNlcyBvZiB3aGF0IGl0IG1pZ2h0IGNvbnNpZGVyDQo+Pj4+
PiB2aW9sYXRpb25zIChmYWxsLXRocm91Z2ggaW4gc3dpdGNoKCkgc3RhdGVtZW50cyBpbiBwYXJ0
aWN1bGFyKSBpbiBjYXNlDQo+Pj4+PiBfYW55XyBjb21tZW50IGlzIHByZXNlbnQuIFRoZXJlZm9y
ZSBtYXkgSSBzdWdnZXN0IHRoYXQgc3VjaCBjb21tZW50cyBiZQ0KPj4+Pj4gZGVsZXRlZCAocmVh
bGx5OiByZXBsYWNlZCBieSBhIGJsYW5rIGxpbmUsIHRvIG1haW50YWluIGNvcnJlY3QgbGluZQ0K
Pj4+Pj4gbnVtYmVyaW5nKSBpZiB0aGVyZSdzIG5vIG1hdGNoaW5nIGtleS12YWx1ZSBwYWlyPw0K
Pj4+PiANCj4+Pj4gWWVzIHRoZSBsaW5lIHdvbuKAmXQgYmUgYWx0ZXJlZCBpZiB0aGVyZSBpcyBu
byBtYXRjaC4gVGhpcyB0byBlbnN1cmUgdGhlIGNvcnJlY3QgbGluZQ0KPj4+PiBudW1iZXJpbmcg
aXMgbm90IGFmZmVjdGVkLg0KPj4+IA0KPj4+ICJ3b24ndCBiZSBhbHRlcmVkIiBpcyB0aGUgb3Bw
b3NpdGUgb2Ygd2hhdCBJJ3ZlIGJlZW4gYXNraW5nIHRvIGNvbnNpZGVyOg0KPj4+IE9ic2Vydmlu
ZyB0aGF0IGNvbW1lbnRzIF9yZWdhcmRsZXNzXyBvZiB0aGVpciBjb250ZW50cyBtYXkgc2lsZW5j
ZSBmaW5kaW5ncywNCj4+PiB0aGUgc3VnZ2VzdGlvbiBpcyB0byByZW1vdmUgY29tbWVudHMgKGxl
YXZpbmcgYSBibGFuayBsaW5lKSB3aGVuIHRoZXJlJ3Mgbm8NCj4+PiBlbnRyeSBmb3IgdGhlIHRh
cmdldGVkIHRvb2wgaW4gdGhlIHRhYmxlIGVudHJ5Lg0KPj4gDQo+PiBXaHk/IFRoZSB0YWcgY29t
bWVudCB3b27igJl0IGRvIGFueXRoaW5nLCBpdCB3b3VsZCBhY3QgYXMgYSBibGFuayBsaW5lIGZy
b20gdGhlIGFuYWx5c2VyDQo+PiBwZXJzcGVjdGl2ZS4NCj4gDQo+IFRoZSBfdGFnXyB3b24ndCBk
byBhbnl0aGluZywgYnV0IGFzIHNhaWQgYW55IF9jb21tZW50XyBtYXkgaGF2ZSBhbiBlZmZlY3Qu
DQoNCkkgYW0gbm90IHN1cmUgSSBmb2xsb3cgdGhpcyBvbmUgYnV0IGluIGFueSBjYXNlIHdlIGNh
biBjaG9vc2UgdG8gYW55d2F5IHN1YnN0aXR1dGUgdGhlIHRhZyB3aXRoIHNvbWV0aGluZyBsaWtl
IC8qIE5vdCBhcHBsaWNhYmxlICovLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0K
DQo=

