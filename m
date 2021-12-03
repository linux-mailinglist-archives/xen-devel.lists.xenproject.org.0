Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741B6467B0A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 17:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237815.412453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtB9J-00064b-Aj; Fri, 03 Dec 2021 16:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237815.412453; Fri, 03 Dec 2021 16:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtB9J-00061h-5s; Fri, 03 Dec 2021 16:11:01 +0000
Received: by outflank-mailman (input) for mailman id 237815;
 Fri, 03 Dec 2021 16:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOtX=QU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mtB9H-0005Mw-AF
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 16:10:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98fe7aec-5453-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 17:10:57 +0100 (CET)
Received: from AS9PR06CA0082.eurprd06.prod.outlook.com (2603:10a6:20b:464::31)
 by AM6PR08MB5048.eurprd08.prod.outlook.com (2603:10a6:20b:ee::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 16:10:54 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::97) by AS9PR06CA0082.outlook.office365.com
 (2603:10a6:20b:464::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 16:10:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 16:10:54 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Fri, 03 Dec 2021 16:10:53 +0000
Received: from 786644f4d708.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4C4DF0D-9EDB-4F2D-8FA6-ABC070EE50B3.1; 
 Fri, 03 Dec 2021 16:10:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 786644f4d708.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 16:10:40 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6848.eurprd08.prod.outlook.com (2603:10a6:102:132::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 3 Dec
 2021 16:10:38 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.034; Fri, 3 Dec 2021
 16:10:37 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Fri, 3 Dec 2021 16:10:36 +0000
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
X-Inumbo-ID: 98fe7aec-5453-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qA4duZcbz/voKu+ZvOyNrnRJAO2jf+E917ADEEEhbk=;
 b=Aai+yfqi0bSiyAluC/Gkh1HB5zomGX9COWaxALOYhGJunttn7G7GJPPNQ6gxgnz5m67+fwSjXOCdlaGWtnYdJuFxzGmkYy1Wdqn3kBAYJmaiq0an9/kBupPWkpc3AI/2SEX4CKEm/Bi83FI9nmS3E3vIUFjHhjlluw8QdJiwbVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b4ab85f767c3478
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAWgdu/QP22UL0npSSywoU4DA3FMZnf0NeUBrRvk/c3ABVDKUi/thphtCXAcvII9+zIVJXfLP+fzLl8j9jwqc6A0tjjlAvWRMqGrxH5HU0G3AjI1ljXi+bE/kNzk+c5oosBx9/ZoBl2lBx1tx67WRxrUZmCW0pwtDy0eu7QTbaysvwKHuLSS/vWhdMHqn7An/Be2b9TV5pgw5/HAD7vLch7anYi9ncnytN5bsCaWhEtz4Y1rgcsa804mG7Sje+odU0UTUKiwAHvG/GAg1H/rRN34phW24Pekgm3k2n4gN3jAgY+u+s/f9eyAdZS9tTxWQw+9ve3d75IvCEuJeIWoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qA4duZcbz/voKu+ZvOyNrnRJAO2jf+E917ADEEEhbk=;
 b=NA79mNCAtt/2iWTsOJBw33QWUikQSWJdh16PICAnTlHHLCbz7k+8FoB+bpxAiuRRsv4dkqYGioUmMJdHpW+wzicRlcVXh5AdZdm7mViYiC8gy1+4/376vlm389/vG494FBjdYvf7gNxLPpmWeWohbtzvFF4ECdRr1DSI0joIEe8cmF8n+drqjjgHHDgah/Lee6KWU5EzKrCw7il5GtZP+eljqrzMDzRKQVqGbqIBW3x8iPaBIdc1iAgYmi9cawhCPKniJsdKgiuPGMRE/K/2ZTPhOziqDgfo4spbNMT3uyDNdTcP7uqLn7HQHAO+R5kLYPb8XXYiePmutnwKYzr++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qA4duZcbz/voKu+ZvOyNrnRJAO2jf+E917ADEEEhbk=;
 b=Aai+yfqi0bSiyAluC/Gkh1HB5zomGX9COWaxALOYhGJunttn7G7GJPPNQ6gxgnz5m67+fwSjXOCdlaGWtnYdJuFxzGmkYy1Wdqn3kBAYJmaiq0an9/kBupPWkpc3AI/2SEX4CKEm/Bi83FI9nmS3E3vIUFjHhjlluw8QdJiwbVE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/3] EFI: move efi-boot.h inclusion point
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
Date: Fri, 3 Dec 2021 16:10:35 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1FE39BE-191B-4245-84EE-1109B9762B54@arm.com>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <8b369fc8-8f9e-c350-95de-790d47fd9aae@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::18) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99dab915-204e-45ac-0c0d-08d9b6777bad
X-MS-TrafficTypeDiagnostic: PAXPR08MB6848:|AM6PR08MB5048:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5048924D68FAA0AD6332360FE46A9@AM6PR08MB5048.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TxHu5vpRt2FdB6GmdYbHS6FwhFbHAsl26boh5ygQ3jg+d4gPBiVUAApnSqvGWCh3ooJ4rTVDRBdEqOkD2t2kyOVmruAyWGn3y82zgeLfLtYIwEOFHumYPoxyaNtmGsPZuPLNvIN3YqAKbK0HVThSltBgKOsc0r+XDjXthsmdxT8DQhERh4pjXpi74w3a3o+X1El1ukmse2eyDE028251vxn78rW3FSrp1A5kOrbpk1jur64h3itDrRhdw2ojVyIabNmEok49KESQszwCUWzrJATzYvVOpjAnkPGP+VStRPfjJ2P6brRByIttiPMga7k85P4dpFEvBQMafZPq2c6JL97E8QbxM7ikF2idf38cVHrCtj4gT1F8dRUG38ZN6CONPdNpu374ckxp6aeQt3RKFZeYq4ndw7vu/j8ODSmdAsMlQTzQBUqyZULoJRHfbWO51BPkNtb7EnfXNUdW4cLwh9v2offx/8fPIF75pHcUjycamfjZTcy2S/Pb2g1iM2qLQW7CiriFzFzdibz40h68MfqNhqVfTs89aSKcQIyhBkXi/pqlw3vafifHfzaS3UdWtER/93wfDiKLYTmpYHgQ0v0efIBBOeDbc2AkuolziZZL/nkFXYiwzROWvjnwNW0zTjZYr9SDrou5wbD23SJMXTytCqj/N6Q+gw3u5ULrVgbeuYMybwHvO/TvFDcWkoAl7ixzyZZKyGXRcrmJ/ltWzWRb5NaeKeOsgQhaL3zpQ5z/2vc+4BGMx17Z50I4sOZt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(5660300002)(54906003)(86362001)(66946007)(66476007)(6916009)(6512007)(186003)(6486002)(52116002)(66556008)(44832011)(4326008)(83380400001)(36756003)(2906002)(26005)(38350700002)(2616005)(8936002)(33656002)(956004)(508600001)(6506007)(38100700002)(53546011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6848
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	452fddf9-8aa8-45da-e943-08d9b6777194
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MQGy1+zvQfmYXdZUlrzLMiQL4a/zTDrfXxibQ5kIeF693jHH+jtdHYNGfnGL5+Rt9VM4x2A6lz+zT+O79hRzFj4NZCnY+Q04fzro0V2ooZE3UTDTgsqpk7uD1/yUvjXGOae0eJjz7fCgSP413FvmvHDgEwB8bMOqpVGeKcYUmuhlmSHvGYFyfiGZh0APDgO4PYiRqjkTDo2izjdJ3//hyZ34Zmk5qe8me0IukrLx+T1MWAxD7UuT1COb1VI/3zE3goshEO+6qB0kblICjCZCp9Ljuzprrq7SlBXTNAA16C/76GubIPeTPWVVfriqzj/5DTNeHw1rtxff7o5KW0j3UUQ7MC5Q4zaytW0uUPrJpCzlRlOQt4GTgLjUVVfMttC352hGAYtQhWmwMUsIBo3bMO3WMIo231qu1Esu5NdfF233a7OuH8CpveYTXOGMBk8w6XxJC38HMaX6P6TcbIiM2EfPbKq27y6gopAsUiV0xt3CCLNo2dZ3fpUvozU8eLVZcqzaY6qoDrx8sSUPlaIKCctFQZpcMweQTuiMKbAIe53UA5gh4890mh2JZyLz4/DzbnIIfyi4iOSJbcIUHwWR7HPlqIt+SuFySQ4nQiYhSo2oMiWgK0aaMJI0/laqrbpX392wEX1XJ5yI8qURZeZHBcNAhn+p/+aOW8YbAHtplLVhdSqfmf4FDXq8CXOHY700dUX+vmlViTqtK3UlRQEODw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(186003)(81166007)(6862004)(336012)(2616005)(86362001)(36860700001)(44832011)(82310400004)(6512007)(54906003)(2906002)(956004)(26005)(70586007)(70206006)(33656002)(8936002)(36756003)(316002)(5660300002)(8676002)(53546011)(6486002)(6506007)(356005)(47076005)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 16:10:54.0530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99dab915-204e-45ac-0c0d-08d9b6777bad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5048



> On 3 Dec 2021, at 10:56, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When it was introduced, it was imo placed way too high up, making it
> necessary to forward-declare way too many static functions. Move it down
> together with
> - the efi_check_dt_boot() stub, which afaict was deliberately placed
>  immediately ahead of the #include,
> - blexit(), because of its use of the efi_arch_blexit() hook.
> Move up get_value() and set_color() to before the inclusion so their
> forward declarations can also be zapped.
>=20

With the =E2=80=9Cconst=E2=80=9D attribute now some function in this serie =
are above the char line
limit, however everything looks fine.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -111,25 +111,10 @@ struct file {
>     };
> };
>=20
> -static CHAR16 *FormatDec(UINT64 Val, CHAR16 *Buffer);
> -static CHAR16 *FormatHex(UINT64 Val, UINTN Width, CHAR16 *Buffer);
> -static void  DisplayUint(UINT64 Val, INTN Width);
> -static CHAR16 *wstrcpy(CHAR16 *d, const CHAR16 *s);
> -static void PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode);
> -static char *get_value(const struct file *cfg, const char *section,
> -                              const char *item);
> -static char *split_string(char *s);
> -static CHAR16 *s2w(union string *str);
> -static char *w2s(const union string *str);
> -static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> -                                         CHAR16 **leaf);
> static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                       struct file *file, const char *options);
> static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *nam=
e,
>                          struct file *file, const char *options);
> -static size_t wstrlen(const CHAR16 * s);
> -static int set_color(u32 mask, int bpp, u8 *pos, u8 *sz);
> -static bool match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2);
>=20
> static void efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl=
e);
> static void efi_console_set_mode(void);
> @@ -168,19 +153,6 @@ static void __init PrintErr(const CHAR16
>     StdErr->OutputString(StdErr, (CHAR16 *)s );
> }
>=20
> -#ifndef CONFIG_HAS_DEVICE_TREE
> -static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> -{
> -    return 0;
> -}
> -#endif
> -
> -/*
> - * Include architecture specific implementation here, which references t=
he
> - * static globals defined above.
> - */
> -#include "efi-boot.h"
> -
> static CHAR16 *__init FormatDec(UINT64 Val, CHAR16 *Buffer)
> {
>     if ( Val >=3D 10 )
> @@ -291,30 +263,6 @@ static bool __init match_guid(const EFI_
>            !memcmp(guid1->Data4, guid2->Data4, sizeof(guid1->Data4));
> }
>=20
> -void __init noreturn blexit(const CHAR16 *str)
> -{
> -    if ( str )
> -        PrintStr(str);
> -    PrintStr(newline);
> -
> -    if ( !efi_bs )
> -        efi_arch_halt();
> -
> -    if ( cfg.need_to_free )
> -        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -    if ( kernel.need_to_free )
> -        efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> -    if ( ramdisk.need_to_free )
> -        efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> -    if ( xsm.need_to_free )
> -        efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
> -
> -    efi_arch_blexit();
> -
> -    efi_bs->Exit(efi_ih, EFI_SUCCESS, 0, NULL);
> -    unreachable(); /* not reached */
> -}
> -
> /* generic routine for printing error messages */
> static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
> {
> @@ -542,6 +490,7 @@ static CHAR16 *__init point_tail(CHAR16
>             break;
>         }
> }
> +
> /*
>  * Truncate string at first space, and return pointer
>  * to remainder of string, if any/ NULL returned if
> @@ -559,6 +508,95 @@ static char * __init split_string(char *
>     return NULL;
> }
>=20
> +static char *__init get_value(const struct file *cfg, const char *sectio=
n,
> +                              const char *item)
> +{
> +    char *ptr =3D cfg->str, *end =3D ptr + cfg->size;
> +    size_t slen =3D section ? strlen(section) : 0, ilen =3D strlen(item)=
;
> +    bool match =3D !slen;
> +
> +    for ( ; ptr < end; ++ptr )
> +    {
> +        switch ( *ptr )
> +        {
> +        case 0:
> +            continue;
> +        case '[':
> +            if ( !slen )
> +                break;
> +            if ( match )
> +                return NULL;
> +            match =3D strncmp(++ptr, section, slen) =3D=3D 0 && ptr[slen=
] =3D=3D ']';
> +            break;
> +        default:
> +            if ( match && strncmp(ptr, item, ilen) =3D=3D 0 && ptr[ilen]=
 =3D=3D '=3D' )
> +            {
> +                ptr +=3D ilen + 1;
> +                /* strip off any leading spaces */
> +                while ( *ptr && isspace(*ptr) )
> +                    ptr++;
> +                return ptr;
> +            }
> +            break;
> +        }
> +        ptr +=3D strlen(ptr);
> +    }
> +    return NULL;
> +}
> +
> +static int __init __maybe_unused set_color(uint32_t mask, int bpp,
> +                                           uint8_t *pos, uint8_t *sz)
> +{
> +   if ( bpp < 0 )
> +       return bpp;
> +   if ( !mask )
> +       return -EINVAL;
> +   for ( *pos =3D 0; !(mask & 1); ++*pos )
> +       mask >>=3D 1;
> +   for ( *sz =3D 0; mask & 1; ++*sz)
> +       mask >>=3D 1;
> +   if ( mask )
> +       return -EINVAL;
> +   return max(*pos + *sz, bpp);
> +}
> +
> +#ifndef CONFIG_HAS_DEVICE_TREE
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> +{
> +    return 0;
> +}
> +#endif
> +
> +/*
> + * Include architecture specific implementation here, which references t=
he
> + * static globals defined above.
> + */
> +#include "efi-boot.h"
> +
> +void __init noreturn blexit(const CHAR16 *str)
> +{
> +    if ( str )
> +        PrintStr(str);
> +    PrintStr(newline);
> +
> +    if ( !efi_bs )
> +        efi_arch_halt();
> +
> +    if ( cfg.need_to_free )
> +        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> +    if ( kernel.need_to_free )
> +        efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> +    if ( ramdisk.need_to_free )
> +        efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> +    if ( xsm.need_to_free )
> +        efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
> +
> +    efi_arch_blexit();
> +
> +    efi_bs->Exit(efi_ih, EFI_SUCCESS, 0, NULL);
> +    unreachable(); /* not reached */
> +}
> +
> static void __init handle_file_info(const CHAR16 *name,
>                                     const struct file *file, const char *=
options)
> {
> @@ -685,42 +723,6 @@ static void __init pre_parse(const struc
>                    " last line will be ignored.\r\n");
> }
>=20
> -static char *__init get_value(const struct file *cfg, const char *sectio=
n,
> -                              const char *item)
> -{
> -    char *ptr =3D cfg->str, *end =3D ptr + cfg->size;
> -    size_t slen =3D section ? strlen(section) : 0, ilen =3D strlen(item)=
;
> -    bool match =3D !slen;
> -
> -    for ( ; ptr < end; ++ptr )
> -    {
> -        switch ( *ptr )
> -        {
> -        case 0:
> -            continue;
> -        case '[':
> -            if ( !slen )
> -                break;
> -            if ( match )
> -                return NULL;
> -            match =3D strncmp(++ptr, section, slen) =3D=3D 0 && ptr[slen=
] =3D=3D ']';
> -            break;
> -        default:
> -            if ( match && strncmp(ptr, item, ilen) =3D=3D 0 && ptr[ilen]=
 =3D=3D '=3D' )
> -            {
> -                ptr +=3D ilen + 1;
> -                /* strip off any leading spaces */
> -                while ( *ptr && isspace(*ptr) )
> -                    ptr++;
> -                return ptr;
> -            }
> -            break;
> -        }
> -        ptr +=3D strlen(ptr);
> -    }
> -    return NULL;
> -}
> -
> static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Sys=
temTable)
> {
>     efi_ih =3D ImageHandle;
> @@ -1114,21 +1116,6 @@ static void __init efi_exit_boot(EFI_HAN
>     efi_fw_vendor =3D (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
> }
>=20
> -static int __init __maybe_unused set_color(u32 mask, int bpp, u8 *pos, u=
8 *sz)
> -{
> -   if ( bpp < 0 )
> -       return bpp;
> -   if ( !mask )
> -       return -EINVAL;
> -   for ( *pos =3D 0; !(mask & 1); ++*pos )
> -       mask >>=3D 1;
> -   for ( *sz =3D 0; mask & 1; ++*sz)
> -       mask >>=3D 1;
> -   if ( mask )
> -       return -EINVAL;
> -   return max(*pos + *sz, bpp);
> -}
> -
> void EFIAPI __init noreturn
> efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> {
>=20
>=20


