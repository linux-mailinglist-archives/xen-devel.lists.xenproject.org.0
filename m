Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690337C91A6
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 02:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616968.959400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrS8o-0003zS-1T; Sat, 14 Oct 2023 00:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616968.959400; Sat, 14 Oct 2023 00:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrS8n-0003wK-Tz; Sat, 14 Oct 2023 00:04:25 +0000
Received: by outflank-mailman (input) for mailman id 616968;
 Sat, 14 Oct 2023 00:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUN7=F4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrS8l-0003uj-Vz
 for xen-devel@lists.xenproject.org; Sat, 14 Oct 2023 00:04:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2045.outbound.protection.outlook.com [40.107.13.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39a4efa4-6a25-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 02:04:21 +0200 (CEST)
Received: from AS9PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:20b:48a::22)
 by AS8PR08MB6485.eurprd08.prod.outlook.com (2603:10a6:20b:318::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 00:03:50 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::bd) by AS9PR04CA0149.outlook.office365.com
 (2603:10a6:20b:48a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29 via Frontend
 Transport; Sat, 14 Oct 2023 00:03:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.17 via Frontend Transport; Sat, 14 Oct 2023 00:03:48 +0000
Received: ("Tessian outbound 0ae75d4034ba:v211");
 Sat, 14 Oct 2023 00:03:48 +0000
Received: from 70c3c9f8902e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4BDDA1D0-47D5-4AEA-9727-59C8B54FD000.1; 
 Sat, 14 Oct 2023 00:03:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70c3c9f8902e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 14 Oct 2023 00:03:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7538.eurprd08.prod.outlook.com (2603:10a6:20b:482::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Sat, 14 Oct
 2023 00:03:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Sat, 14 Oct 2023
 00:03:39 +0000
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
X-Inumbo-ID: 39a4efa4-6a25-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INoX+qCTi6SYBBI3tUhXxoaSTFA1hiOYpTrzHr/OLUI=;
 b=KRelAb6ufbTptG7Dev2L8X4moc9KF43GNgrQqPJQBSSOysEd4bGSdkMxSo6r/Q/CYDgnPJLfYj86BxhXxUk7cDCH1oirJ0Le+RNRXBrXlF6/J4H4g8uW7EjeSaHTPDBtddkibtXvVcR4bZjyyIK34QgQaP6+qQ/VtJLMLpma4OE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08c9d002243c4aaa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ib6i6DAdS1XL69WB55xZ7UoDdetDfGnhiOu80vTCn5PTM30fafKLpAbLtWt6r1gUyEUKCks+hKnoQltexB0QvBzbfAK3wswIlQicCjCDC6yJcrQ9uBnwgDTdamQ1xsRmYYv5dDBBuI33NsVtpBpROMLhjyldmMYUT0Met5Rm1TDJ3D+jpvutdit8hWp866QHk+ND0yaw7p4bkgLuEO00PhFt9sxDHFUabrUvxplkObk1o/Z9Rx9KbVQtSLWVLf8vvlDPPqj7xFnBuoq8BoYHDp+2IJ/MIlcvcbmQzFGDlemCiy1xPDwFQ4N73Xag37v0iafAKQGXOg4qQ4nHsoGf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INoX+qCTi6SYBBI3tUhXxoaSTFA1hiOYpTrzHr/OLUI=;
 b=QH64YAI00L1/TPdoom/03lauKqJEoskALWkTd+ERWO9eAiqgN4ZCc28cRZw6BksqAHNAHc6dce/GK5KaoOa0o2TifvWKGExha/Av2mAFhZ7WtULGuM0//z5sJRFI4dqulbzYsKT2J7potSKLtM93rpmTQslxoVKRU2qHNqdocOKk1IRKt5Hwjt7mTXfw+GM7L1xbwstyOPcNDKhJ8F/rM5rCkrgFz/3odXwxOjWaA3rtAv5+YE9MCIzktQ0MKyiFEca45gIsTCElVW8cflwKPCD5qeweXr0vIUZEDuXHbLAdZ1/mSmXLsISK6OWeGHWnFGWhFBtrbFlFZMZ9wPMtAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INoX+qCTi6SYBBI3tUhXxoaSTFA1hiOYpTrzHr/OLUI=;
 b=KRelAb6ufbTptG7Dev2L8X4moc9KF43GNgrQqPJQBSSOysEd4bGSdkMxSo6r/Q/CYDgnPJLfYj86BxhXxUk7cDCH1oirJ0Le+RNRXBrXlF6/J4H4g8uW7EjeSaHTPDBtddkibtXvVcR4bZjyyIK34QgQaP6+qQ/VtJLMLpma4OE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v7 5/8] xen/arm: Split MMU-specific setup_mm() and related
 code out
Thread-Topic: [PATCH v7 5/8] xen/arm: Split MMU-specific setup_mm() and
 related code out
Thread-Index: AQHZ+kx+23lhReITfUCLaoneR4RMRrBIBAOAgABrGQA=
Date: Sat, 14 Oct 2023 00:03:39 +0000
Message-ID: <4531596C-C78C-44CB-9BAE-B38FE2423652@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-6-Henry.Wang@arm.com>
 <15c7c0a5-6064-400b-9022-0dda9b8f7bef@xen.org>
In-Reply-To: <15c7c0a5-6064-400b-9022-0dda9b8f7bef@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7538:EE_|AM7EUR03FT050:EE_|AS8PR08MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f7ae35-a5f5-47fc-2d27-08dbcc490aca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1/WHmIvb27FXIhjbx+H1UTI/PRFWYRhrLyw94QkOSd53QutnbllynFXofHywXkjKF7onIxH5QxYKV8GXaOlKXJV/4NfeKd/nAFwGXsXo25NFCtdPMumOU7GcKOBMLF50/1hRHKDA5T2Ze2RXvfvvETwaLVv+hRnanU4DqaKy0gkZbfUVJFCt+dDO/4MVtgcGBLb9Tc3IR8/0uJfuZToBhZxacnD7dyF+kstyBobd1iLnPkgCJAMsnHUWq/jDYPgIbTE+iBeOqfnsRbI2jC5tijGv/IDYM9WjIhXvYCuUfkVQOpcemNlR9sJjFfrd+yj7VN4h4BbxCXYD/2Byk4i+395Vn2rTbi630QDWHUORjDvqEd0B4SE6bVnzkvazHvvWKkf21NWvqGlK2d459YVxLwPHsR/bEKes8PJKZFfSGIVjZaOCfPjS2OPCETf9c43rZXWjGUSfvXAwq4GYbo2HTTtW2Ti+rqKzdeBnHtQr3ohadZGpyl2xxYBEiXFtbli5Z6aKn/dMK8+LaFphvoI4oBzvCaUd+/JBLET55nZCqC8EfecByt5gMSnRWG/5tbAof+H+jNus5NZeRXpANRcSj82QePQNhaWIGKiqzRiNze+WYXGRp/im38LVcVYFDNqABMdJyluE9jN4bp5RCib6Xw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(478600001)(6486002)(36756003)(26005)(122000001)(2616005)(6512007)(33656002)(2906002)(38070700005)(38100700002)(86362001)(71200400001)(53546011)(6506007)(316002)(8676002)(4326008)(8936002)(66946007)(54906003)(66476007)(66446008)(76116006)(64756008)(91956017)(6916009)(66556008)(41300700001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F71E98C285F11409C5E3A86CBD9631F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7538
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	093bc2e2-00d7-4a5e-0c24-08dbcc49052c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iH/5861C5oDJbyxgjxCs0K0Xy4JrQ7vt7sF0rikMZt8FcqhqLYCU5T6xc5LWks9EHlAhWFe8dT+nu442k1OTkRhG/VdW962qwJoPzeT6jHfZYxEA+79+DdhR86CCbsnxGD82purHlG+TYEWrMzQ0eP0NTDGjqso9L72n/BughrtDpoAvAM5R+SS2DubxYhUusSAHdywk746vkvvnvuTliL6Ngo64ecWNsauJ9xaAuzeG6C46QgQixr+/rFcF7q1eKT/dbHn/jEeE0ergc7IUVFBg1ZPfZYHOYh39/x4jAdw+BNQcpShyfr+YYNWwBz+bvJ95aSV28Cj+jQtf6dXed+1lWB5khhFZrF4EJM0AWSLqZKQbcMEGWpxLrtXQ3eSSo0xN+aj5hculc0dACe1wLwKrX960YhfcKBG4I/xjJHbCEEe1Xh96Cc2rDXSt8b4MwVg5Op7FdLzJoRwJhEEnSWowffPZbKAqGJlBEd/fYldV0PZclpBSVPHUmm2ItpqcyNBmRkCmI6iRPq91kWTjGTa+7X9DstrotzflukCdU9nyWf8wDSqodYZO6LgDIkKH0CYkOFa8ens5jbxuXFOvJEmZSqWVTHy9NRJw829linUCsy5cKFXwXx/0EOe0OceQjL4YBFKkcibZz8XbwYCndhQRKKEPyt7kL0gYseqevek+rjwYboI4E4jGfVF4pv2WFe6OJVz6WVWw+f9eUPYGFDhf3qy6WYpA7qkWo8eJoFzaqJt7MIcpLWTXLB+3Gfh2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(1800799009)(186009)(36840700001)(46966006)(40470700004)(40460700003)(40480700001)(53546011)(6512007)(6506007)(478600001)(6486002)(36860700001)(47076005)(81166007)(86362001)(36756003)(356005)(33656002)(82740400003)(2906002)(316002)(2616005)(26005)(336012)(54906003)(4326008)(5660300002)(70586007)(8936002)(8676002)(70206006)(6862004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:03:48.8133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f7ae35-a5f5-47fc-2d27-08dbcc490aca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6485

Hi Julien,

> On Oct 14, 2023, at 01:40, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 09/10/2023 02:03, Henry Wang wrote:
>> setup_mm() is used for Xen to setup memory management subsystem,
>> such as boot allocator, direct-mapping, xenheap initialization,
>> frametable and static memory pages, at boot time.
>> We could inherit some components seamlessly for MPU support, such
>> as the setup of boot allocator, whilst we need to implement some
>> components differently for MPU, such as xenheap, etc. Also, there
>> are some components that is specific to MMU only, for example the
>> direct-mapping.
>> Therefore in this commit, we split the MMU-specific setup_mm() and
>> related code out. Since arm32 and arm64 have completely different
>> setup_mm() implementation, take the opportunity to split the
>> arch-specific setup_mm() to arch-specific files, so that we can
>> avoid #ifdef. Also, make init_pdx(), init_staticmem_pages(),
>> setup_mm(), and populate_boot_allocator() public for future MPU
>> implementation.
>=20
> I am a bit confused with the last sentence. AFAICT, even without the MPU =
work, I think you already need to export init_pdx() & co because it is call=
ed from two different units.

Yeah you are correct, I will reword the sentence to:
"Also, make init_pdx(), init_staticmem_pages(), and populate_boot_allocator=
() public
as these functions are now called from two different units, make setup_mm()=
 public
for future MPU implementation."

>=20
>> With above code movement, mark setup_directmap_mappings() as static
>> because the only caller of this function is now in the same file
>> with it. Drop the original setup_directmap_mappings() declaration
>> and move the in-code comment on top of the declaration on top of
>> the function implementation.
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>=20
> With the above comment clarified:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks!

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


