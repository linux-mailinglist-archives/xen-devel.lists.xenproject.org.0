Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB3773ADD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580022.908278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOLo-0003tR-OY; Tue, 08 Aug 2023 15:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580022.908278; Tue, 08 Aug 2023 15:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOLo-0003rT-Ll; Tue, 08 Aug 2023 15:10:24 +0000
Received: by outflank-mailman (input) for mailman id 580022;
 Tue, 08 Aug 2023 15:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/Vr=DZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTOLn-0003rJ-Tr
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:10:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23016d8-35fd-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:10:23 +0200 (CEST)
Received: from FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21) by
 DU0PR08MB9418.eurprd08.prod.outlook.com (2603:10a6:10:421::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.25; Tue, 8 Aug 2023 15:09:51 +0000
Received: from VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:0:cafe::77) by FRYP281CA0011.outlook.office365.com
 (2603:10a6:d10::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.16 via Frontend
 Transport; Tue, 8 Aug 2023 15:09:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT039.mail.protection.outlook.com (100.127.144.77) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45 via Frontend Transport; Tue, 8 Aug 2023 15:09:50 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Tue, 08 Aug 2023 15:09:49 +0000
Received: from 475518f4f4a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3ABC8230-D378-487F-A7F6-DC6C2B638105.1; 
 Tue, 08 Aug 2023 15:08:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 475518f4f4a6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Aug 2023 15:08:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB5570.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:08:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 15:08:40 +0000
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
X-Inumbo-ID: b23016d8-35fd-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR531HV0oY4lV7VgzQe4AkX5MZLRVgBb2FpikOdOUg8=;
 b=4U9P9lgiK8WLsyEiLeKo+WjTlMPwFUAMAKVpavbTzLAJvICUJ9WtTIZE1sv796v95isWLLHlbk3T/QN1AOWqwJ4bbO0vMDQ5693e0Gnz3YiZ7v3O75B0mdPIikG4xAL38nMX3PV35OQfvd21Z0GFed7jMcxZr+ccUNt26YH8Ad0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d65cbdfe526c7782
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAHcJ+JOVMUeQ/3Z1pG7lqAVX6cO/4ui6+MuAP4rhiYCOECz9B9zDWgalouPcnVUaw+4ESmNwquMWSyDBak3yjcX6iyQ870BVssGgDVINIzcv1V7GtP2Tuv6wHa4R1lj7nqoAQbjtNPNzfW3E3gInUZlAl1QneeZdxaGv8SvdHREAXb5KYzVnN7XLvcOyhIaRHEI4aoeG1hHpwQ5ClhuCScg+TnmNkv0Z7FYEwGBhCGcxpK7jiddU1ahLvFhEX8D3ukdVO4n/ECb3GT/EcVqsmXbmaSioYcN0uOpNVWyMFyUT3R+Lm2XYc/0fql6QZ9jT7k0U8d7Y8j81LtQVdRO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LR531HV0oY4lV7VgzQe4AkX5MZLRVgBb2FpikOdOUg8=;
 b=HMwsirfTTKamCsO84s+DfEuq03sgHCNuDgBtlBN1Y+HOw9FiLuy0+6bmfmrLgjQmBd83IHKKLlON5JFd4NmRSQBMUCt0IzKxa0Z6yfgIFEw0nuc6HllKVqn3rWQhZ+MoBF4rznq+u5LSUk2M/ry16BSsNjnG7MnAGU14UUedArNzJeoksODcR2M9yBIc3eBI2XeT05izUxjjo6McrDK3RRh9P2r9h7LK5iC6K8WoqmXEGqju57EjU0A5EZEJhFkbhQ4JkXvd+lg/ANhZegI3WjBb/EhvlrRj+dNJvvQFrjqMXD7+5LZj+ceZntysU34KWlaUHwnG1ZUZADqK34C5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LR531HV0oY4lV7VgzQe4AkX5MZLRVgBb2FpikOdOUg8=;
 b=4U9P9lgiK8WLsyEiLeKo+WjTlMPwFUAMAKVpavbTzLAJvICUJ9WtTIZE1sv796v95isWLLHlbk3T/QN1AOWqwJ4bbO0vMDQ5693e0Gnz3YiZ7v3O75B0mdPIikG4xAL38nMX3PV35OQfvd21Z0GFed7jMcxZr+ccUNt26YH8Ad0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] mem-sharing: move (x86) / drop (Arm)
 arch_dump_shared_mem_info()
Thread-Topic: [PATCH] mem-sharing: move (x86) / drop (Arm)
 arch_dump_shared_mem_info()
Thread-Index: AQHZyfBJrIpFu/4jlkOaspAEusf4b6/ggH4A
Date: Tue, 8 Aug 2023 15:08:39 +0000
Message-ID: <B566D20C-3818-4476-9FB4-4F93721C6E6D@arm.com>
References: <b0a49d20-8e82-8264-8241-86a108139682@suse.com>
In-Reply-To: <b0a49d20-8e82-8264-8241-86a108139682@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB5570:EE_|VI1EUR03FT039:EE_|DU0PR08MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf4f673-021c-4176-90f7-08db982182f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C3uozCephDrjXiuj05xMEVeIi9HxA1X/4vWhElrgVOc6T6sgB9Jegk19DfKv7kAIMPoYJynVbapsLVHaaft+KJfu4YooBWIhVLvntcCTlOpbZikyG1txaJXk0y+k0kuzNI2sXGP8UtShp+W8hSKuzYnXwFx1lx+ESaOntEsD91UAH5X0/IyJcKNmQOPPPrIpAjAqlMevLUguLfz1bfukzv+wxhzAlbVRUKpt9wl/eVQquK8/ysrsvl8BCouhv/5S2aDh36fd8lqXQZpLYKPG0pNXrg0r+zP7Tpq5c1xLOOUrpDBCR8tE7rGNjFhcmLONWD5n0qTdM7AXyABaugbW1g4mwx5kp+YH0odd6pgr8uCGAl89n86Esz4Ov/csbUCUbtq0G5RBSCTpMtN/h5HBFc+cDVc4/74+1Qeryvn0TD32G8Mc9C7NO1kBJUYI/PMstQDUZJcOHlZKWbtqWjBsirYiYe205YPWA0o+szQaYQfIDq8Za9aZt6f5rHWTxY2Ff3eWuJT7EtC6xvZocs7wgkrlAJqTVgQ5pVpM7I2z5Sc52px1ZQGfmJNi5OgmUEQ3q9nmTh1LmxOtkBorP4/XIdkI/1jFGNhtXDZY/YcHSBtaMuODgvcAJ+Xnr+USxmUoDYjxVUaaymp2LoUktamH4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(1800799003)(186006)(451199021)(2616005)(122000001)(478600001)(6486002)(66556008)(6512007)(53546011)(26005)(6506007)(33656002)(64756008)(66476007)(41300700001)(76116006)(91956017)(316002)(8676002)(4326008)(8936002)(66946007)(66446008)(2906002)(6916009)(71200400001)(54906003)(36756003)(38100700002)(38070700005)(86362001)(5660300002)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F39195C3D9ED5F4EBE6BD600BA1B34D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5570
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecc51250-5664-4de8-5f14-08db98215911
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MvKObE3HSM2wlnbmLu6T6ilolNUOy/bISFgmc5F5jwqQ5POoZtDiQ7qnxi/SRBiPoi5B6aY2wMhUwUXqlS90fwhOFII1AZZz2MQm1kZUKXVngxre/RiI4Vj/q9UJg0erBmPINGmpvSccO7W5pl50HeXnaVJZ6N1wUQ827mddsSM4xl9w0rrIAucAfMWOKZ5bN77H/P/uN6VFJkUVmgulQEHDuc4jtbcQIIk6Xl3F+Enf6fC5+DyosIbNu7ti05/OkgNIBEJLKZB9oYm/TmSo4EKg3qs1QubwBg5EAQWkCpA+lCtTzOQPea+YjY6XHUPM+g396eujJdezQJ+Sg7uHpHDA4uSfzaYddPFlkAf8Z2lWm7VN6HZsufvK0B9di+9X4Ymq14cu2FTNRPoYKxQOkBDeKXYZW9p021JwyoDI60S7dQyDVuXDva1h0dGfEuN5wh4Px5dkm8mkN1VzQShriqV22CtCiWR89t17+7Y0B9HNvTsPwh14gZzTiuB30pDQB+I/nJqncyEFJEC2ttHKMvbkHmIV048S6H7cc58cF4nHjZ16z47MseuJ8DMWVLEEJ1ZvWA4R4mgXjik7A4+fE/uK0nrJILucrQ++CIoaEkBr9SBDj2K9sUxQ/BsOrIOyNU/eBKdXzAuJqTAGQIXb0oymCuw630xzpVh8Gp4dldlbzCh1QOKcTGwlJTNk8UA0+Ju5P/vOfukMCxlNF9nspn0GA6YDj2x9yR0mdgElF7YXjpz5+4uMQ0iYtusF6VMl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(346002)(136003)(186006)(1800799003)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(47076005)(6512007)(2906002)(36756003)(5660300002)(2616005)(36860700001)(54906003)(6486002)(70206006)(70586007)(356005)(33656002)(4326008)(82740400003)(316002)(81166007)(40480700001)(41300700001)(86362001)(107886003)(40460700003)(8676002)(26005)(8936002)(6862004)(6506007)(336012)(53546011)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:09:50.0175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf4f673-021c-4176-90f7-08db982182f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9418



> On 8 Aug 2023, at 13:02, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When !MEM_SHARING no useful output is produced. Move the function into
> mm/mem_sharing.c while conditionalizing the call to it, thus allowing to
> drop it altogether from Arm (and eliminating the need to introduce stubs
> on PPC and RISC-V).
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wasn't really sure whether introducing a stub in xen/mm.h would be any
> better than adding the (further) #ifdef to dump_domains().
>=20
> We could go further and also eliminate the need for the stub variants
> of mem_sharing_get_nr_{shared,saved}_mfns() by moving the
> XENMEM_get_sharing_{shared,freed}_pages cases in
> {,compat_}arch_memory_op() into the already existing #ifdef-s there.
> Returning an error for those sub-ops may be slightly more appropriate
> than returning 0 when !MEM_SHARING.
>=20
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1297,10 +1297,6 @@ void free_init_memory(void)
>     printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>=
>10);
> }
>=20
> -void arch_dump_shared_mem_info(void)
> -{
> -}
> -

Hi Jan,

For the arm part:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> #arm



