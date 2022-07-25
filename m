Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A257FD3F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 12:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374499.606575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFv8N-0001jR-UN; Mon, 25 Jul 2022 10:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374499.606575; Mon, 25 Jul 2022 10:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFv8N-0001g4-RI; Mon, 25 Jul 2022 10:16:19 +0000
Received: by outflank-mailman (input) for mailman id 374499;
 Mon, 25 Jul 2022 10:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ymx=X6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oFv8M-0001fy-Es
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 10:16:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1957163-0c02-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 12:16:16 +0200 (CEST)
Received: from AS9PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:20b:48a::25)
 by DB9PR08MB6553.eurprd08.prod.outlook.com (2603:10a6:10:25b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 10:16:13 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::2) by AS9PR04CA0144.outlook.office365.com
 (2603:10a6:20b:48a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Mon, 25 Jul 2022 10:16:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 10:16:13 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 25 Jul 2022 10:16:13 +0000
Received: from 9348a12d7fb2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF8D64BD-F78B-4CDB-9282-DE4D455C7414.1; 
 Mon, 25 Jul 2022 10:16:05 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9348a12d7fb2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Jul 2022 10:16:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4506.eurprd08.prod.outlook.com (2603:10a6:10:d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 10:16:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5438.026; Mon, 25 Jul 2022
 10:16:03 +0000
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
X-Inumbo-ID: d1957163-0c02-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RaS++jbYPKV2Ur80Fzb0Msb7ULa9wexhqBAZKRXYBW2KcR3NQUC8bg9gdhPr2enCRZPlLAAgrkqBKy1xc4EP9PgefTNa0oc2VgjkN6IBZBVCSDDleeEEG+fQDLERijIzK2aXUaaK2VbuPBFyU8+b9j7/o4zw3w+823I/g5T7OIAVUvzfg/ksmak8uVIYssin6W5KQVZMA4ACaDucLb4MEBSd7a34jSCgdDXXfOSRRbeKTL1zZGsVRpDCgX8TbhsYlISxVvs8FfoJUiWuPJNTHpZ/zjthoXyIQhB1hLV5w/ThwV0IYddlPZ9IlIl2ABG6KALYaYUzKngH05tbjMSK5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS9vItpIuIK9OlfLSP7o6peJlfETlLDCYbgMyPx/Gjw=;
 b=DQDtdyv8SPhxpALRFh4M25H7lZCTmZUmJd+sbq7mDYOy38zQiZU3O78eU0Mr/V+FdkuCSw7/fV5fnupAdkc82/Jvg/z45AqAb7r6tG/x5vK4aJi3Yn1t/DcWMY+X5iBcrlilbKwC+kvPtk1przZ9bYob+UO/PZEvsl7I+rorjlDAkkrPloVdIB52JTJ0qeIfB2xrFF84Fv4vghwKUnkqK7WhFRWCqY8qvsSmDsp9Pz/pPuDCW1JAr/qOxDEMYYnNBc3cQ2cIeGEQNoL/+6TJUDMrKyL+0sgxQRJoOIkyxSVLZRReoN4GM6eZs5n8PGzvZFkjnscMc6FZhaRvATABog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS9vItpIuIK9OlfLSP7o6peJlfETlLDCYbgMyPx/Gjw=;
 b=P5b5vKUJm56J7ncXb35lYsznZuLvgHw81RiE/xImyALkmCtG3ebXPEQBlGFFqocfdRDCkYySnWQGaTRoixBwJSqDnwwJnXugbE1NK6gJSJG1B8759V3tT19M7DZbrxnv1ci799puDzt6NTQGqJef1Ffy/fM9oUNZDUJpl+cT8cY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28ea5f9c2e39e528
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHatFPrOxmQ1qzIXhFfNMsKU+e6GIE+hij5gvX1fNfYs2xI82HQ124oaMLVgm1dacdE1kfBpKzyZgvtddWCKCcfNSviojBjviHx9zY+QvctsX9eTPPJ4RyVsZrr1Y7QmuhREoCaZ+ZfeXZj2ZQXBx+aWPS2uCUNW7kVa1ukUTWufC9suDqfbTVX/Q1SiP1iRYoBI6d3S8vDRKLRxBFo0PMBvHdaAaNFCXG+X531zJ/AFEhsz+QWXFEW+oIdTameW1Sdbk5z8hLvY7uk5oAsUk3eRq6Hc+qz80Pd/Q0SQ8h6Wcz3x6426aOZt1VNRlIqmJc5B9oL9+vWlWCi88tIXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wS9vItpIuIK9OlfLSP7o6peJlfETlLDCYbgMyPx/Gjw=;
 b=BXE9hCw7tQY0lmZo7Nu64mpfBy0VrfKwGSrlVE0s1w4eCfDC7Yw7uwZL71E2372UD9qSzaNVMBBSCzx7tDLiG1UpUIRDawn5r2TqW4dtGLnS4XXi2ISGpBALnMQqwTXbKtLXVDv89qbZ+Fh4lVSEkepuaE7JjAHsDxk5KN9Gyu1zMgMeJN9iwdsHM/aVGOXRs35LNB7V8Gohu7hhz85mfzMtNQkwGzYfZq48lwy88NP9BJ1Q0CRC8DAiR4sJrVUvcvWaZPN7kghQCAwZ2zoB3VEfKAj9qIDcE01Pa6EnT2FAtO2O2bx7obCJtVRckBudFtm81S4e/PYnx56JSbRrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS9vItpIuIK9OlfLSP7o6peJlfETlLDCYbgMyPx/Gjw=;
 b=P5b5vKUJm56J7ncXb35lYsznZuLvgHw81RiE/xImyALkmCtG3ebXPEQBlGFFqocfdRDCkYySnWQGaTRoixBwJSqDnwwJnXugbE1NK6gJSJG1B8759V3tT19M7DZbrxnv1ci799puDzt6NTQGqJef1Ffy/fM9oUNZDUJpl+cT8cY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] Arm32: restore proper name of .dtb section start symbol
Thread-Topic: [PATCH] Arm32: restore proper name of .dtb section start symbol
Thread-Index: AQHYoA8PRqZOjU+nJkmLp8Hrm92H6a2O3vcA
Date: Mon, 25 Jul 2022 10:16:03 +0000
Message-ID: <1130CFDC-9464-4559-9E8D-DBDFF069B895@arm.com>
References: <9f1949e5-665b-a153-342e-8b3482c8b9c8@suse.com>
In-Reply-To: <9f1949e5-665b-a153-342e-8b3482c8b9c8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2757d274-28ab-483a-8182-08da6e26b3fa
x-ms-traffictypediagnostic:
	DBBPR08MB4506:EE_|AM5EUR03FT030:EE_|DB9PR08MB6553:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0XuFcGxZV7YN3OuTbaACJ/xryFloYncZER+htYMxUhkiD4msYxaomOyWq53Z+rVhvpjIQbcZGe2ClrklRhGc7EUvIY/Le0B5Oy5n8xt5Bs0ew5hlP5dKSp0Ig2l2iNFaScUgpWzz1QyuAQd09sb9zx7pbpJS0/6ucYgTD1rP3RhIdpsQ08i96oO0KCse1cuUciJG8NotT+0zV8IcDAS2wJP65DkoVikHRv5wzMr2Gyy7DGR83T1YVrdGBz89H6P1WoDbb8EOlU/HnwkUro9h9e/hc0I9dOjGIG/WD7xqHPfyAgEt0BC+j9wLGTcNHKm/EA/cg3aHJvWysKVI+MaIoQtTquYJF1BQwJ6L6W8tYrjQgDZGN6sPgUx8Xf6rIl4B320ve7pUfaVp6YNsNetsbgQ9aMKGYmJWmNgidkoCTm7PeIKt68+pPLS+/HLio+VnggeR3QU3/8cn6hIYvaZU6JtYY4zDaGrUgFd8odfrK5stb9pCBvbl+xc2yJn7+/5h2AgvKyd6DTxDsnfxa9Pt79UVwsCJ15IGevKGYAt1SIKCICMarjNM2hggIhaeBhw69VcbIYXXeosHAGpaUNleOEvg3VZ3J4ySWWoYh1dk8fzW75pTXicuY4A7mfh8Lb9kwohOwT2aFEgCXuC/Kglp9Wb2IohwtNXxSmROodxKziILLGm59OkDbpSC649Sr58uEmZCvAhxGkygyZCm5+/Bb84lGnHO0iPTSE50dRmCx5+uHLNT1tOHhj/zEZ7vFoMZb5NPFfDkVQdcSaVQG0f5+qz2k/VDBHZ3aGEK6OmI6USvdd2Iwwaq7Wg3H/aHWEQ1ykOw4oF5rEJ5Afha8Xamc+bR9QES8459/vK4c/FHBSI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(186003)(64756008)(66556008)(66446008)(66476007)(8676002)(91956017)(4326008)(76116006)(2906002)(41300700001)(66946007)(71200400001)(26005)(33656002)(86362001)(6506007)(6486002)(8936002)(2616005)(53546011)(54906003)(36756003)(316002)(4744005)(6916009)(83380400001)(6512007)(38100700002)(5660300002)(38070700005)(478600001)(122000001)(142923001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <291124C6D1BB4547BB0E0B6EA6705177@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4506
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce2dd595-f5f2-4425-5608-08da6e26ae3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qc9sHu4MPpXlZSWu58OjvOTBeNJkfK1osdyebtMgE0WRYN+z2pn4XBKW6kXpjouLPrgvEdowatbLLJGMsqXy+lbTOmCpJ+o2nYjn5sOHVrCyW/K2b/7/6eL3z5RPMDXrIbf+QdapCGl8IKaXJyvTj0gfj/CUKDzmTh+4axod2UrGk28sONRtpG63FO56OCqfLfBzwzGaEUl0gs60AE9SiH1hfoHbarmrZiWTNdwZWBlCR7I1/Ur1sf7wuSroxVDujbYbDZ0DgAl7fBO3+smqX7lShqHBsunX3NfyBNxxlxX3CFcf5n4UVAS7cUOiwEjFF8M/tYtiA4V1SGXx08zwSRclfdXGVr+x24484yyqQXUjQKYKdKnSbmvenMacjBNqHL+07YhQCsAxjUkEb+j07ixwUAIZojrHEyM0NKGgd2ukOKKcFmJeIt5bavZIxoY7ScBI5pviQTzsBrFaqv4OtlpwFDf3om0/fqE7XNxBUzpjB7C0d6eVz4xcyh6pbGpsyJ+TTjEN7eXj4Rr8pxobCSAYsDFbUJcPj2wFC2BGa8ABHna23VeBlEmIc6ZuL+yXGqvnZJAE9TZMcYyJYbfX3vCto0BWs0FtMlT/yNugMF6strErOb2xf8u7kjfcILl8JdSOM44D6czv5IoJxdnPcJbTjh5/CdtIDLsP4XRX0v1lb8mp23rPX5lU+ZsK3/yB4QbIEqMwFkWah/CY8latZOVBHsgiZbyNOAzhmuapv4uF438oYm3tNZ9pG8Ec0PNKuNK1ltNlofnzVsNMYIMUDfdQZ9w7NzauUanTo3jGTQnjoGDCZOuBg96gqzyNfQuYdsBCNYd1w91ArZXsVWY/EQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(86362001)(41300700001)(2906002)(26005)(6512007)(40460700003)(53546011)(6506007)(6486002)(33656002)(6862004)(82310400005)(4744005)(478600001)(83380400001)(8936002)(5660300002)(107886003)(2616005)(47076005)(336012)(40480700001)(186003)(36860700001)(82740400003)(356005)(81166007)(8676002)(4326008)(54906003)(36756003)(316002)(70586007)(70206006)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 10:16:13.3084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2757d274-28ab-483a-8182-08da6e26b3fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6553

Hi Jan,

> On 25 Jul 2022, at 11:12, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> This addresses a build failure when CONFIG_DTB_FILE evaluates to a non-
> empty string.
>=20
> Fixes: d07358f2dccd ("xen/arm32: head.S: Introduce a macro to load the ph=
ysical address of a symbol")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Of course this really would be a prime candidate for avoiding the
> use of linker-script-defined symbols in the first place, by using
> .startof.(.dtb). If only Clang also supported that ...
>=20
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -162,7 +162,7 @@ past_zImage:
>=20
>         /* Using the DTB in the .dtb section? */
> .ifnes CONFIG_DTB_FILE,""
> -        load_paddr r8, _stdb
> +        load_paddr r8, _sdtb
> .endif
>=20
>         /* Initialize the UART if earlyprintk has been enabled. */


