Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516A782647
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 11:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587455.918845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY1FF-0006xS-9T; Mon, 21 Aug 2023 09:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587455.918845; Mon, 21 Aug 2023 09:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY1FF-0006tx-61; Mon, 21 Aug 2023 09:30:45 +0000
Received: by outflank-mailman (input) for mailman id 587455;
 Mon, 21 Aug 2023 09:30:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xF=EG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qY1FD-0006b2-S0
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 09:30:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6654c8ba-4005-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 11:30:43 +0200 (CEST)
Received: from AM6PR0502CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::23) by PAVPR08MB9114.eurprd08.prod.outlook.com
 (2603:10a6:102:327::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 09:30:40 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::75) by AM6PR0502CA0046.outlook.office365.com
 (2603:10a6:20b:56::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 09:30:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Mon, 21 Aug 2023 09:30:40 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Mon, 21 Aug 2023 09:30:40 +0000
Received: from fd0f4412be3e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10049BA6-DD98-4B78-B3BE-C31579C55541.1; 
 Mon, 21 Aug 2023 09:30:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd0f4412be3e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Aug 2023 09:30:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9788.eurprd08.prod.outlook.com (2603:10a6:20b:603::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Mon, 21 Aug
 2023 09:30:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:30:29 +0000
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
X-Inumbo-ID: 6654c8ba-4005-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K1r+xUuTlNBa/CQDe3Ur6xvmag/JljLlf5SeK+2ZnA=;
 b=M3IgDP0/BQL3LrXyZQAcQwHgSwXQ8R0hR7txSFNWhGDKBApGdWQllrLPE3KV6Y4Gsv7JDYiG7V93KDidaOwrFf8/3B5Enm1sCrC/tQw3HEyJ2zVhMBtYKp/DefgnN9iNUNeBz35iTnH1+XfRnEMJc1R8zNPFRZoTEWLXVauAZNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf97f13d62a00a5e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMKea6OIEPmRB7DePxrS9g8PS1Tf5mAlVkollUJz2UEHR40dmOEfcGm8wRvfd367sT5CcjRFEl5CRwzxNd/vuTwj+TiCSQj+bpjPU/hw3WxTZlf4PKo9tC4hbt6drR6kyP8iOiIjXg8AhW2tGEwf0yztS7Rhz+izqWvkAK7C9pEHZZm5y56dWEkgehO8VSHHrUnnh+UT1urrIrvqFK2aIUsCPmM931AVaJIzGXnHsIH3sl+a8ZGAIRmNfS4mUmSdHjKOj7JHVL7l3QehiYPcwdVegcLn0TuaRI3hlSm7uaGydlioqRqzzz5/yVWlYq/6hOmj8aq4S0Xha7LWeX9Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K1r+xUuTlNBa/CQDe3Ur6xvmag/JljLlf5SeK+2ZnA=;
 b=iCqitFd7ZMEM+pLVwkKGlcwshs3ba1/Ma7DjjYVFN/Na4rI0mCGdc5uypNtwIJY6SQqZjqnL/1PbONIYCfVuwMIOk1Gb4SrM36KPbg19Y+To39Wdx2iq8pjTk3t1yxwwK7DpenF+q5uendhMlPMTZRi40R2MilvcsIe0fWTIgLt1a/Ho3KGKtjVST3hwvvcH+pgJRiXOmCR3YcpGoQWL73x6z1AVqwQuFrmlG+1Dux0+tcYX7QZonH5aOJcV7ew7/vGd0EuT6ZGxaYPXPEYmCxggcLu4NQGRYLorvPDykakVdMnhzquagpMU31O0jnNJHaatTlx1L2BT6n0Md1sG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0K1r+xUuTlNBa/CQDe3Ur6xvmag/JljLlf5SeK+2ZnA=;
 b=M3IgDP0/BQL3LrXyZQAcQwHgSwXQ8R0hR7txSFNWhGDKBApGdWQllrLPE3KV6Y4Gsv7JDYiG7V93KDidaOwrFf8/3B5Enm1sCrC/tQw3HEyJ2zVhMBtYKp/DefgnN9iNUNeBz35iTnH1+XfRnEMJc1R8zNPFRZoTEWLXVauAZNM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 06/13] xen/arm64: Fold setup_fixmap() to
 create_page_tables()
Thread-Topic: [PATCH v5 06/13] xen/arm64: Fold setup_fixmap() to
 create_page_tables()
Thread-Index: AQHZzmd/r/JuiD2oz0+SIciGrMmW46/0hSIAgAACQQA=
Date: Mon, 21 Aug 2023 09:30:29 +0000
Message-ID: <611B2C47-851C-4754-81EE-BCE53A6CEBA2@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-7-Henry.Wang@arm.com>
 <2178de3c-db05-44ac-a7d7-fa605723d16e@xen.org>
In-Reply-To: <2178de3c-db05-44ac-a7d7-fa605723d16e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9788:EE_|AM7EUR03FT019:EE_|PAVPR08MB9114:EE_
X-MS-Office365-Filtering-Correlation-Id: 71139a04-210f-4d7f-8a5a-08dba229490e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3RRDoeKpCSJOuK6ik2tmPG7DEfV9tbi6GBalyQ6aNVkoPEN4uWwG2NGXm7EYHM5tl55orHKcvzHJzvVKT7p8w76pYK0hBX5U1aLPDfsgyzzDEhsR0eTfR/EG1HUr9Nx+LaODTCut4JeN+wkoEYR6oaEdUY1ALdeR/AeggxfqWGqYfXLTJL8B57SwK5fufHo4TjcPt+8QhigqaKEFkh43zSJPp3K2T5rwjIA7eEK0naa1H08r8QF9gVsf/UBJe6Dcnf5Z999rn18GSckdBgZ98YJNX6USOI7XyKmZRgdj5Ioiqr7Ofyklp9J4H583fonnFHf3DvA5f3y81FHDGVpzKkMKic5Eu321SkH4mVyKTMqqCNQiNMb7mtoJcoCVVi5TR/R7+oXk87V5Nm2URHVdw920QGD+RJej89a7AcsRUThZHHGcZ4V6tJPuiyvLGuvEHFC/FxZvmO9KkUPVmqse6Y8hFnitKhH3MQCufyN3TKW1Ak0QacdkRV6XSJdw9F6AWhocyhreiy9QIMkTt/XZ9SK1oRGeJDVWYVJWWG412yjrS+sxq/rcx3goYGtftKLSltLiHqVqg+/uPJh0GIxZIHufKJivIScEpCG7PsjnNbsPxbn933Y0umrV/4aahOYX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(1800799009)(186009)(451199024)(86362001)(33656002)(36756003)(122000001)(6916009)(54906003)(64756008)(316002)(66556008)(66476007)(66446008)(91956017)(66946007)(478600001)(76116006)(966005)(41300700001)(38100700002)(38070700005)(26005)(71200400001)(6512007)(6506007)(6486002)(53546011)(2616005)(8676002)(4326008)(5660300002)(2906002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F474B81ECD14E4AAC07940395CE52C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9788
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f77be93a-e398-4dfc-3f7b-08dba2294256
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p3OvIW9mPdAY5cBEfGEMzvkLETZgrCbOKaiyO5n+75QL7UMZ6E4X6HGd9j3RBcBSxqWbgH0eSJhbcwdRdYckGuBb49lpmdHnGwtd7xrw0PoVAMG0MRVaG4Cxx+dCUoRCAmrkwlKyuygJU/hL2n5Ldve7Lq8EjeMpnMjliqNUl7hD3UbmKmOBR16GVgkeYOh8fgTxGb+yU/7ZQYD1WP4v+XZPrGd/ElwBOOuAyhpescCwV2Uqwkcm3sAXA8D7eyXixKss9vJ4HXaqDUgVf1dCsD0p0n7pDXA2MJg42Xk1Ghf77EXjNhxuuzn58yThdJdaqhai4h/JDM8XS4JVZCI+WzOV0Hp0uMuQbF145/MKQGaJYI+IVCHv0bEBGb5hbXInI7wMnVcyrSiaSrw/dKZ0dfknVBDjqvEy3K8UYev7Dw6Ux/TUN7ESwNi6sWrtbU6IujyrjplblF/ipWBOQffHi+pVVdXmthnTkphFP1Ae85hSpoXVI1BE4Bp+ZZMG2bQI+luntp9/+93xA4RO3gsSc8knz0yNkYMlLf9rmHUgsVrQVWwx2lHZR2M3NuXmwqXsU0vc6WTARTcCdDYPIfcuBnwok0CCQmfWiJFnMin1rfvaq5Eu+tJyOSjJMJ4H0InbeJcOoTxSNuSdCZ5qfoauYxCVF7SIm7KfPxmaXoSGI1TlzPl8yQKzc+O3axFqgRJ3yLTBE4IGMtP7Fo6umw6ZFMnT5jW25H3TLAekURrizf0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6486002)(6506007)(6512007)(53546011)(40460700003)(36860700001)(336012)(107886003)(40480700001)(36756003)(26005)(81166007)(47076005)(356005)(82740400003)(2616005)(33656002)(41300700001)(2906002)(316002)(54906003)(70206006)(86362001)(5660300002)(70586007)(6862004)(8676002)(478600001)(4326008)(8936002)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:30:40.5480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71139a04-210f-4d7f-8a5a-08dba229490e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9114



> On Aug 21, 2023, at 17:22, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 14/08/2023 05:25, Henry Wang wrote:
>> The original assembly setup_fixmap() is actually doing two seperate
>> tasks, one is enabling the early UART when earlyprintk on, and the
>> other is to set up the fixmap (even when earlyprintk is off).
>> Per discussion in [1], since commit
>> 9d267c049d92 ("xen/arm64: Rework the memory layout"), there is no
>> chance that the fixmap and the mapping of early UART will clash with
>> the 1:1 mapping. Therefore the mapping of both the fixmap and the
>> early UART can be moved to the end of create_pagetables().
>> No functional change intended.
>=20
> I would drop this sentence because the fixmap is now prepared much earlie=
r in the code. So there is technically some functional change.

Sure, I will drop this sentence in v6.

>=20
>> [1] https://lore.kernel.org/xen-devel/78862bb8-fd7f-5a51-a7ae-3c5b5998ed=
80@xen.org/
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


