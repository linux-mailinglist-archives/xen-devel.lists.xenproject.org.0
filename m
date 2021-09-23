Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25E415C23
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193652.344951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMC6-0004VG-LV; Thu, 23 Sep 2021 10:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193652.344951; Thu, 23 Sep 2021 10:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMC6-0004TF-Ho; Thu, 23 Sep 2021 10:43:10 +0000
Received: by outflank-mailman (input) for mailman id 193652;
 Thu, 23 Sep 2021 10:43:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBZb=ON=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mTMC4-0004T9-No
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:43:08 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 099f7838-1c5b-11ec-ba28-12813bfff9fa;
 Thu, 23 Sep 2021 10:43:07 +0000 (UTC)
Received: from AM3PR05CA0107.eurprd05.prod.outlook.com (2603:10a6:207:1::33)
 by AM6PR08MB3238.eurprd08.prod.outlook.com (2603:10a6:209:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 10:42:56 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:1:cafe::e0) by AM3PR05CA0107.outlook.office365.com
 (2603:10a6:207:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 10:42:56 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 10:42:55 +0000
Received: ("Tessian outbound 8b24208353e0:v103");
 Thu, 23 Sep 2021 10:42:52 +0000
Received: from 0d0de202793a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 859F5F06-91C3-4BA1-85D0-B8936D608975.1; 
 Thu, 23 Sep 2021 10:42:45 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d0de202793a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 10:42:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5579.eurprd08.prod.outlook.com (2603:10a6:102:82::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 10:42:43 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 10:42:42 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0415.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Thu, 23 Sep 2021 10:42:42 +0000
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
X-Inumbo-ID: 099f7838-1c5b-11ec-ba28-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moOsx1sdIhrnMVxdu08lygWSOT5+XJcJk6731bVt/Is=;
 b=0/BFkK3v++N0znxVo4we64NigCX9FqpyGm+1sV4NhcNBH32hzXrSMF9SXFie69MBRlwNULyhxd3rIaPn9mC8r6HEFF7TrwEmYVwKTFLpgLFUz8TuKg46HbXam+H1Jmyzf4ks99oaq5k4DgNL+RLtN1xAAwBBa5rXiPGOLZq0x8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a3034e2b863e2f3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo0PioaQrF27kWDzUpGDy3GkN3nXnN8VL5gCzfQpFr3excwjXJ3/yApVyPE0MTNKDkM6ZJNmIislekP7OpvLkPLP0OJIxKhLtJNNQrpkEN1/xPEEROVcLF/rAsTasHA2kzZ75tOZhxbnMZexn2TS9yIcBvPvP6LpD7QpQXb1Zu7RwxD3sY8AHkFW1hz5zuWkDoyllq0RYnawGG5+1i7l4AdgS3gdmF4jLnuzuVP+5GhMtaCqYjgnAPz/x4fdqHevjIQbs2gI+fiuednmrYnZh5ECGBBjH/eJqBjY6o4DyFohh85rZvRDywu+7uoF/dom8D+LlTrDUyaOIsSPCBKbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=moOsx1sdIhrnMVxdu08lygWSOT5+XJcJk6731bVt/Is=;
 b=g4svbwQs8HUZQ9eDWovYOQhbKRFFrjs54zuKDZSv/M+XzjUgvRoYuSwXjgCqZ1Gy8X28NZbz41S0Dcij5EYoQZo4TCX1tPY/3vSYxD94GJfdOdQ+5kIZ0mksbx0t5LOXHhN23RqRuYhXMN0GHlPLrqJv8aZwC+cJaj5uUA+Ul8iZTPHZFlPnvMIrsmHmrQSfPFK4rX9vewkv8fb9kz+9QORFks5YFizp8w66eSaGs8ifPrvlT5lN14LAydsOOatgGFqSM6G5ddWq8n1r98lfZW0mBzMRIRHpGOfkNpcWx000IAAnzn2QoSooUlc+na+RYob0FiKDJ56L1NQYL6FRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moOsx1sdIhrnMVxdu08lygWSOT5+XJcJk6731bVt/Is=;
 b=0/BFkK3v++N0znxVo4we64NigCX9FqpyGm+1sV4NhcNBH32hzXrSMF9SXFie69MBRlwNULyhxd3rIaPn9mC8r6HEFF7TrwEmYVwKTFLpgLFUz8TuKg46HbXam+H1Jmyzf4ks99oaq5k4DgNL+RLtN1xAAwBBa5rXiPGOLZq0x8E=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 1/2] arm/efi: Introduce uefi,cfg-load DT property
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109221411200.17979@sstabellini-ThinkPad-T480s>
Date: Thu, 23 Sep 2021 11:42:34 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4804F311-5341-4AC0-9408-1CFF1A2F23DE@arm.com>
References: <20210922141341.42288-1-luca.fancellu@arm.com>
 <20210922141341.42288-2-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109221411200.17979@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0415.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::6) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0408b62b-528c-4c7b-c98e-08d97e7ee742
X-MS-TrafficTypeDiagnostic: PR3PR08MB5579:|AM6PR08MB3238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB323831C6E715C372C72EDBE1E4A39@AM6PR08MB3238.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nIzuknwvKsVFnLkIDpjXGKg7gHPaisuI1TxPiDf6fSeV+XYjWxwQ3Y/DoOKQLHU1Wn22esRqA1cZjZpiDj8MHoM6d5eFoEqx+tyyAH6tsQGsj9ilXej9nDGLtAZo2DV847091FdLrZPOhSr2qyWAMEBzaLsbtUGMM4NTTFR7a7+dphsO1raNEThjeDK3yNIeWk1hJ6fWc4AWuWoJ/2JO7Hc8F67p3sCX+6VCeoiVa6S0GuQZuzfbQ5vB3+9FxIZwHPKKTCFwJ3rSMUe2Tspv5DWZyyPXPg1DjxaB6orv+kHznsJ/rXvpjUcNg+QDEgb68FWFER70jUL/b8+9LNH1c30yYcrVUERE7DxVj/WDAXH55thVuWGPf9Mb5oZmBh9k+6liVu5XWtV+KYYBSwJrtnnk+kytdeC+0D7rQy//ulFwWZr+xijqi6KcyF7fHZH0s6LcjHJuuYgx/OSTXifXHmb08wcT/betIuiBqj9FHSyiJgQ+WclPBV6U3qzNsRiU+RcD9WND4eEuILAfS8v20JnXU90cjQ62SJ/t4yojkzgvk2xLYz8FrLkl9Cu6V+Y2le4rRczmqouoEYemg5xMD0hJbxCXuWzbFPDj7gHq+uagKoWRIrkwJYHOEmzQPBVDZ6BZvQdUk+l2FkL0Il1sSyBBHuwsVcq3Xou1S4Be4G9uX5vKSx1K1liF/kxSS/4IvBjjexUdNc26MXVeycid32IMuEUtc2X20RDByYzzKM4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(5660300002)(2616005)(86362001)(53546011)(956004)(508600001)(33656002)(6916009)(66556008)(66476007)(6512007)(54906003)(316002)(8936002)(83380400001)(4326008)(26005)(6486002)(8676002)(52116002)(186003)(36756003)(6506007)(38100700002)(6666004)(38350700002)(2906002)(44832011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5579
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f79a8db5-9464-4ce0-3357-08d97e7edf32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9pxrKaoU+d2XYvp0vqkQQJIQupSYSeC07aYxRtmnvpnOLF/ZU+jtg7N6jAnm9mSECjB+wX8d9x58uiMMm8JwjoDGaqJyP8zprm19Ws7v9abtBPwSLbPVhMCJmc+qZiHGEh9CL9j5b8FesoC1yGJFfor4t45mdvyi/HsEZ6QziWQkb6X+Q8A9Ls3fT7lYUUQP5x6VjvkKqZJ78UVVwm7D6lxJzeXlUA9h1EfIb5hW/tFO86ePUgkdU0YK6/LpYBemBUGJV268yZolKwg73ucWDgEhRahQodIBCkCQQ7Ckj3yyJvXPm2DLmbGLbdBU8xtjINWWk5Tn+eSsxDPyF4a0MKnQCMYWtIJOPMN2ux9OhmbyucfbGUlrfs3OxNbZgc8VBvhCqkV2Q3sxSjdrGtqnSjFeNmJqRipEq6mK3HtValitDviUrZXscO7IyhGMYFuzLJqjo4tBIaVHzYFNIR7FX/OQR732Ph+fhVWnxK1+tJQpKwiuQf3fLmait4fCNQfeZ55Agf6yhhzqpzqfOOLfv2Yf/5Az9TSzuo6jv2Fev0l7Jh2cZvnf/qib/q4aGW6wM5baxR3TvKGEXe+RtsXj60gMocTsgPTRF/ovREdLfP/iwWYEalzNIxn1yT26tF3aDrp6hE2BFRu/aFTperqzzrPhP1MP3x4scl6zv5VbkcWelxt1Btr3qmZ4HgcVjLBgUgGuQ4y7EhBP5hzOdHVw3g==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(316002)(36756003)(107886003)(44832011)(6862004)(47076005)(5660300002)(508600001)(86362001)(6666004)(81166007)(82310400003)(8936002)(956004)(26005)(8676002)(70206006)(70586007)(36860700001)(33656002)(53546011)(6506007)(186003)(6512007)(2616005)(336012)(356005)(83380400001)(6486002)(2906002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 10:42:55.9469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0408b62b-528c-4c7b-c98e-08d97e7ee742
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3238



> On 22 Sep 2021, at 22:19, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Wed, 22 Sep 2021, Luca Fancellu wrote:
>> Introduce the uefi,cfg-load DT property of /chosen
>> node for ARM whose presence decide whether to force
>> the load of the UEFI Xen configuration file.
>>=20
>> The logic is that if any multiboot,module is found in
>> the DT, then the uefi,cfg-load property is used to see
>> if the UEFI Xen configuration file is needed.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> The patch looks OK, just a couple of minor comments below.
>=20
>=20
>> ---
>> v2 changes:
>> - Introduced uefi,cfg-load property
>> - Add documentation about the property
>> ---
>> docs/misc/efi.pandoc        |  2 ++
>> xen/arch/arm/efi/efi-boot.h | 28 +++++++++++++++++++++++-----
>> 2 files changed, 25 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index ac3cd58cae..e289c5e7ba 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tr=
ee provided to Xen.  If a
>> bootloader provides a device tree containing modules then any configurat=
ion
>> files are ignored, and the bootloader is responsible for populating all
>> relevant device tree nodes.
>> +The property "uefi,cfg-load" can be specified in the /chosen node to fo=
rce Xen
>> +to load the configuration file even if multiboot modules are found.
>=20

Hi Stefano,

> I think that, in addition to this, we also need to add the property to
> docs/misc/arm/device-tree/booting.txt where our "official" device tree
> bindings are maintained. I would add it below "Command lines" and before
> "Creating Multiple Domains directly from Xen" maybe as a new chapter.
> It could be called "Other Options" but other ideas could be valid too.
>=20
> You can say that uefi,cfg-load is a boolean.

Sure, I will add in v3, what about this:

UEFI boot and DT
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

When Xen is booted using UEFI, it doesn't read the configuration file if an=
y
multiboot module is specified. To force Xen to load the configuration file,=
 the
boolean property uefi,cfg-load must be declared in the /chosen node.

>=20
>> Once built, `make install-xen` will place the resulting binary directly =
into
>> the EFI boot partition, provided `EFI_VENDOR` is set in the environment =
(and
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index cf9c37153f..8ceeba4ad1 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LO=
ADED_IMAGE *loaded_image)
>>=20
>> static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTabl=
e)
>> {
>> +    bool skip_cfg_file =3D false;
>>     /*
>>      * For arm, we may get a device tree from GRUB (or other bootloader)
>>      * that contains modules that have already been loaded into memory. =
 In
>> -     * this case, we do not use a configuration file, and rely on the
>> -     * bootloader to have loaded all required modules and appropriate
>> -     * options.
>> +     * this case, we search for the property uefi,cfg-load in the /chos=
en node
>> +     * to decide whether to skip the UEFI Xen configuration file or not=
.
>>      */
>>=20
>>     fdt =3D lookup_fdt_config_table(SystemTable);
>>     dtbfile.ptr =3D fdt;
>>     dtbfile.need_to_free =3D false; /* Config table memory can't be free=
d. */
>> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,modul=
e") < 0 )
>> +
>> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 =
)
>> +    {
>> +        /* Locate chosen node */
>> +        int node =3D fdt_subnode_offset(fdt, 0, "chosen");
>> +        const void *cfg_load_prop;
>> +        int cfg_load_len;
>> +
>> +        if ( node > 0 )
>> +        {
>> +            /* Check if uefi,cfg-load property exists */
>> +            cfg_load_prop =3D fdt_getprop(fdt, node, "uefi,cfg-load",
>> +                                        &cfg_load_len);
>> +            if ( !cfg_load_prop )
>> +                skip_cfg_file =3D true;
>> +        }
>> +    }
>> +
>> +    if ( !fdt || !skip_cfg_file )
>=20
> Just a suggestion, but rather than the double negative, wouldn't it be
> simpler to define it as
>=20
>    bool load_cfg_file =3D true;
>=20
> ?

Sure I will modify it.

>=20
>=20
>>     {
>>         /*
>>          * We either have no FDT, or one without modules, so we must hav=
e a
>> -         * Xen EFI configuration file to specify modules.  (dom0 requir=
ed)
>> +         * Xen EFI configuration file to specify modules.
>>          */
>=20
> Also mention in the commit message that you are taking the opportunity
> to update this comment do remove "dom0 required".

Yes I will add it in the commit message

Cheers,
Luca

>=20
>=20
>>         return true;
>>     }
>> --=20
>> 2.17.1


