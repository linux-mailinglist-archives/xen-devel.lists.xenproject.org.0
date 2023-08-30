Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9554A78D3C2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592741.925554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG47-0003Ea-D0; Wed, 30 Aug 2023 07:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592741.925554; Wed, 30 Aug 2023 07:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbG47-0003CL-AA; Wed, 30 Aug 2023 07:56:39 +0000
Received: by outflank-mailman (input) for mailman id 592741;
 Wed, 30 Aug 2023 07:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI6i=EP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qbG45-0003CB-Tv
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:56:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde8b0ab-470a-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 09:56:35 +0200 (CEST)
Received: from DUZPR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::29) by VI1PR08MB5357.eurprd08.prod.outlook.com
 (2603:10a6:803:12e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Wed, 30 Aug
 2023 07:56:32 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::39) by DUZPR01CA0147.outlook.office365.com
 (2603:10a6:10:4bd::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20 via Frontend
 Transport; Wed, 30 Aug 2023 07:56:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.20 via Frontend Transport; Wed, 30 Aug 2023 07:56:32 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Wed, 30 Aug 2023 07:56:31 +0000
Received: from f5bdf2c568a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44DB5F18-7C7B-4C3C-8A60-1001FC8CDAB0.1; 
 Wed, 30 Aug 2023 07:56:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5bdf2c568a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Aug 2023 07:56:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 07:56:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:56:23 +0000
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
X-Inumbo-ID: bde8b0ab-470a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W1i4kHrGCUzFP6Brnvd8hb9hHlRRrmYYieeDuW17bY=;
 b=Aen4rpu2a4j7j2MhK2l4iHtSbyiMHERSr5OVEw4va0ZIoBtFiXrIVV3p0OdjW7opgeeKKookxO6RopAteH993EGOveOnUrsv63wUiuwi8bkMseqVQMoMwPzykLzylSL+KvKUmZ3GdoscZv12g/D1RZ6SyQGq0O2l2XlkAXKEev8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15e8d1fe9783fca8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCk+Ly1Ca0JqH3ap3aL5rhYL69B60LqRwe2090zDBqef2oKLJ6KZ8anvsXgdAXzmuNd8gWAbw1QCwIQHbAStNkyNi6Ik/To4OgzhxUshL2NOa5FiUU8hRCrqvC7fDbZ5ia62LLf0iYn7ZC2kzqpdYObjGgodfQ3Ex6bMz9FfvAQeakwWoZPQp3oVymlAXR1M8Ti3Vrxzr232e3+HNL8tbY25D8O7uT6peKKHtNFuStFJs0RD5H28nzB8HLTy2ciIY2s6m4qy71pmqxBUdijHpl2mPfdFxmlSVsBaMeHsU8tf3VYm4DqJEAm4gTG7r1Q7t4n65W0O+f+uI/qOmZu6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8W1i4kHrGCUzFP6Brnvd8hb9hHlRRrmYYieeDuW17bY=;
 b=iH9o637QNBUK47ajsAps86Fy2ERLYWdvkGwL/e/reFpkcr2JLgK+o+0X/pxa8Z0ORu9IfDu864AcjOLDlZDmPq3GbwXBIEUPLDtQtdIk/N8X2xNrsVZI3d6zN7lN/Y1cjNEtb0Vpi7Zaq3wE/nhBMHZ1lMltRMNIAGCSlyaJAFVWf/S6SBQ505bpUSKv5J3LfClM5eexDcjZWNohPmtGAb+omUINjErN7qZr0CuJxN3RwX1qP3yExNHhTQCBH78p05C6HL/5+MsKYq/P55Jdc0tpneDypv9y2Zb0wZKAgIJ1o9F04rqBOLD1ZRex3zCdTn30NiGFe8h0vOUD5N9exw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W1i4kHrGCUzFP6Brnvd8hb9hHlRRrmYYieeDuW17bY=;
 b=Aen4rpu2a4j7j2MhK2l4iHtSbyiMHERSr5OVEw4va0ZIoBtFiXrIVV3p0OdjW7opgeeKKookxO6RopAteH993EGOveOnUrsv63wUiuwi8bkMseqVQMoMwPzykLzylSL+KvKUmZ3GdoscZv12g/D1RZ6SyQGq0O2l2XlkAXKEev8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Tamas K Lengyel
	<tamas.k.lengyel@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] xen: add stubs dir to include path
Thread-Topic: [PATCH v2 1/2] xen: add stubs dir to include path
Thread-Index: AQHZ2oYKABgzDtwGqkuLqOQEWgZPabACco4AgAAHSoA=
Date: Wed, 30 Aug 2023 07:56:23 +0000
Message-ID: <9C45CD78-CBBA-4117-9519-8F1784B33641@arm.com>
References: <cover.1693319118.git.oleksii.kurochko@gmail.com>
 <09fa701d2be02589cc9f63d8334082346b5c1702.1693319118.git.oleksii.kurochko@gmail.com>
 <f1af0e80-722f-9f47-0618-a31ffe0bbff8@suse.com>
In-Reply-To: <f1af0e80-722f-9f47-0618-a31ffe0bbff8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB9677:EE_|DBAEUR03FT005:EE_|VI1PR08MB5357:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd49a53-1987-48f1-3db7-08dba92e9ff6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JvZXZqjxa80AfLTQC0jalwQ6yjl6t87+Fk0ZMxOOJYMZYHc4Gfw/IweoSEYwvgBOGrYaKVSNSoaS7sHx17ruhpubIMIPR/FJurD5m9lHT5JjQORVpCnxVOXuO5PK/OD9WHY/4CjDWqHKEtwxn/XLvG4r1yoRfnMajyYWP9re0Kgl6hN3vX6gTGb0qMmDWctdtN0ao9kCYqFJQ2qWmYAUtPKA7peAlrRWfIwDwqTLv5KpeqBoN18OtkO13nIk5oVUMqgl3eV4Pk0UN5h0Jx0STklTUYOIZh9t7Ds33btCR1/EvA0jgsJHFL2Fu25PuRYPbzWbR8MP7F8L4qCL/Ch/9AmJqWML16jH0aEEe7nFaVaSulO7qTcZ05pe8QvKFlpZWnnuOKKd/Fgj6rjnCf1o+rALak3ae52n7kD7cg3MEl14u9Vb4tXkUgj0FzYByf0AJDJrkRJ/fZhFN1aiMZVmc7tpLq6+7S3dpGpUojIKG+1VIC0akZJajivV+VM8IgdX6ey9TiBEsezWEGIAEFHUAAmFxpo/pSmLfXDl+wpLlWSxLEfGFlnAHyTLcDRYgg/8XpVyx11FQ5CehYdCkDO6yPdcD6RKFiaxbiR5C4qZIQK0+r0TgQ5fpcf3qkJSL3PiEzoccscR0JbMvuqjw5lctA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(1800799009)(186009)(451199024)(8936002)(91956017)(53546011)(478600001)(76116006)(122000001)(66556008)(6506007)(66946007)(71200400001)(66476007)(64756008)(54906003)(66446008)(6486002)(6916009)(38070700005)(316002)(38100700002)(41300700001)(6512007)(5660300002)(8676002)(36756003)(83380400001)(2906002)(2616005)(86362001)(4744005)(33656002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E28221EE0A2AC344BE2D0F9DDBCCD4DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2085105-9e96-4537-b3bd-08dba92e9b0c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oFaeOKbVaQlcR4ujHcSRBkVp2NeHWvq05fC7gUOwpnilAyUnHX4RR4rm7pnrb+BHv0KIX1GnwQob+mrMIu+e81COVTFGig/6L4MjET8VSZIVRtkEwX4pw20SHuDJBZ1xdPtg00mmXnJdq1CUOnZP7lhSwY9Jr+j5SB2KQXiOcRxBAdp4T+hR8SgSMHTGCPsfgny4GhJ3x+BN323xypCpGf1R/1THPrx6oWMIeSoH4w4SF0c12u3Rl+xCIrt5Ko3SRKHJM+cRgMMkqT/4L94Und2Oup/Kg48PBQLijW3gR7XwG94OKXvqyDJAsYhRUGjgspaAJ8bXJ86Q2ubuCJeg474DshYTWvnUMs8CS9SrjpRXm4g/IPaQJPIM98+Ek6dr6Qm7Cu42zp8GO8RpCUE7E/AFO0/MiP2nAePMWi9Y1E3018mmuwp2PRY01iTybHQzhRkHGyEVgsidsOwOSoTTgmyMOYcst0B7UOQ68R/RDQdLMB3WmPdMhlxy6YSw/BNwgy0bnK1v1r6RnoKyorj6MCygy6TKGtR0vH+PgMp4keeHFPnTSGu2wN0YweodPWvga0HtPmLAQKkJ4sVqrruuOk4QNF3M4QqaIP4ogbaa/BIWy63cWZA1tr5UIcnLZx0+rU9d+9EmxBZ7gpMUJBSkg1eOweQoPcfjTrXjZoU4WCidSQ6efeadpCzSnP+BNrwDOHFcgAOjC5lFSu3rnyJc6RXOxxsmGoc2zFl35Z17aszuJpkK6ZM/vCeNaF9kpyOy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(2616005)(40460700003)(83380400001)(47076005)(4326008)(5660300002)(8936002)(6862004)(8676002)(336012)(36860700001)(36756003)(4744005)(478600001)(33656002)(82740400003)(70206006)(316002)(70586007)(54906003)(81166007)(356005)(40480700001)(6486002)(26005)(41300700001)(6512007)(6506007)(86362001)(2906002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:56:32.0205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd49a53-1987-48f1-3db7-08dba92e9ff6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5357

Hi Jan,

> On 30 Aug 2023, at 09:30, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 29.08.2023 16:34, Oleksii Kurochko wrote:
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
>> endif
>> CFLAGS +=3D -I$(srctree)/include
>> CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include
>> +CFLAGS +=3D -I$(srctree)/include/stubs
>>=20
>> # Note that link order matters!
>> ALL_OBJS-y                :=3D common/built_in.o
>=20
> I have to admit that I'm not entirely happy with the name. I wonder what
> other REST maintainers think. In particular I would consider using
> Linux'es "asm-generic" name instead, allowing to cover both stub headers
> like the one to be introduced here, but also other kinds of "fallback"
> ones.
>=20

This is a great idea.
+1 on asm-generic

Cheers
Bertrand

> Jan
>=20


