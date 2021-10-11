Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAF42986E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 22:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206578.362190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma2GX-0004Ec-N4; Mon, 11 Oct 2021 20:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206578.362190; Mon, 11 Oct 2021 20:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma2GX-0004C6-JT; Mon, 11 Oct 2021 20:51:21 +0000
Received: by outflank-mailman (input) for mailman id 206578;
 Mon, 11 Oct 2021 20:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1ma2GV-0004C0-Sz
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 20:51:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91d17c0b-df7e-42db-8734-6b7d7826bfe8;
 Mon, 11 Oct 2021 20:51:16 +0000 (UTC)
Received: from AS9PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:20b:463::9)
 by AM6PR08MB3558.eurprd08.prod.outlook.com (2603:10a6:20b:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 20:51:13 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::74) by AS9PR06CA0047.outlook.office365.com
 (2603:10a6:20b:463::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 20:51:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 20:51:12 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Mon, 11 Oct 2021 20:51:12 +0000
Received: from 9f7ae8fc2c5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7328E317-07D6-4FD6-A56B-78C6F9D1476A.1; 
 Mon, 11 Oct 2021 20:51:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f7ae8fc2c5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 20:51:01 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5737.eurprd08.prod.outlook.com (2603:10a6:102:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 20:50:57 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 20:50:56 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:193::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Mon, 11 Oct 2021 20:50:55 +0000
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
X-Inumbo-ID: 91d17c0b-df7e-42db-8734-6b7d7826bfe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNemV4gf7a+b81w5t+Zct0XOrs8mV92FZOXmLyMBxyc=;
 b=RUxyUkfz7F+tPd3PkU2HigOeh/CSomv0vQ1HGvYamndP4rXgoZSxXHIyxDHjIx9nErABlu7nD+pMUmgMBM7JeXQlzvj5qwbgGiSoiBrKJs8ZAHdOJAtj+ajbP4FcEshfK1BO0C4LF32vkFJTsaY/GEUU+dszowvfrbjv9KW81AI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c4bfe3572ff330e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPayyTSbwi3I/9sbw0FYUmXkx3uB1+UZo0k7wTf8Qp6UYR6x++OFrXPWIBX/LUaGM/WCrbMD/JYFTIqQAclnu6oZfADZr6cGNbA71vB0nQOTXUWKcRVKJK+P90yAC2vcbprOAjeW/lPH1egXj0V6CNuoml+JY7egTm2IwPJ2vJkAza9Kcqd1f5sZJW/M40/gM25DXd0J2lGBGbN1GB0ym4WmGERJgjTEITmERP3rAQNfPbIakE/JkkzLc3SrKopk0BMBNCVRV0WPO/qqfG59McjURE76XvKraC67Z+Vm3lwBfMy8J/rVhk9fSNFI8uCcDsypbIo0DjFTR6K7/BW41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNemV4gf7a+b81w5t+Zct0XOrs8mV92FZOXmLyMBxyc=;
 b=fshpUbghtzRoMM1lXpHYuz1a1IDMtRhKUJRgsmQ7XFkamAkHvJ2/wjmyy2Te/qlDuufITBu5mZtc/dhHuFroazEe/wO8/QLti7av68wv5y+foRXgl3WaduBgNvEsWNHdRDpMct7ZEuuOplTDJybUiHPkQ5yQQh8tkRUdixECqioSpqmcaJ9+YIlOEdi8VvuK6aTrm8S58/yhyqXazeKM6L8uBbuhYltvpOMk5aOZ9m3rusG9On4ruqYHl2UaYrmseaeppWPXh8nHvvZpqQcIx3zJAzTMIsvCgLgJmPAnPJRiX96hkiN6yoxS3yoPik/RhPKucPoNr5qAYcjN1eJIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNemV4gf7a+b81w5t+Zct0XOrs8mV92FZOXmLyMBxyc=;
 b=RUxyUkfz7F+tPd3PkU2HigOeh/CSomv0vQ1HGvYamndP4rXgoZSxXHIyxDHjIx9nErABlu7nD+pMUmgMBM7JeXQlzvj5qwbgGiSoiBrKJs8ZAHdOJAtj+ajbP4FcEshfK1BO0C4LF32vkFJTsaY/GEUU+dszowvfrbjv9KW81AI=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s>
Date: Mon, 11 Oct 2021 21:50:47 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC7165F9-09CE-4001-93ED-FA637F5ED36C@arm.com>
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dd67c1-8e87-48db-f45b-08d98cf8dc86
X-MS-TrafficTypeDiagnostic: PR3PR08MB5737:|AM6PR08MB3558:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3558C66BF68F9BCB3C51EE07E4B59@AM6PR08MB3558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2sb57jaub0CYBh7p+6Tw+xneRY901d+DA6IfXrE37RcMP/mL4QIFYqyYGV0WXsMQLjFUL9QxIV0ch7BK24oG6uyUNtsJnzLmLDD6rKOrAoGSWVswUU0RS3wTMqYoVek9bVZIU8NDRhAmne7xZbf4V8DFy4kNmEGnYHhzBGceqTFXzSpfHYgqKwdx1MKHj9mwqd8Rv+gIzhgJ7G1PilEyvNKiH5HuPjKBCeLMr12IQEHoZL/pkWOR124Pg+NeFtzsQn7aIdCJA7YgNAUyyYCETkwdb46QqkC+NrcvHoL2y9ssrGtL1phQWf9W2kHBc6f4/vlmLIai0K/A/Np8HhEWDyLjTjabM9GPvYPTALZI9yywrmIPpFkBlh8rcmxJjOkf1f4IU3qTLYGeH5w9fHLy/2O9UQivPyuDZpw3lyVVOG51YvkULsvtUGAtW+5p3h7vEDw+jBvjwGr2kr7bVUCUPZN6qrsmbeUKncJGEJehblMm5cJhkw9fwjkz0n7Keqlii5mS/bUCLoHPne4MPmgHSaK7tX5ssbMbS395LNxCvv4/R14V23MBxYsPJmpWQnIeqyT0NjICxmMyfsJBkbYJFUdJJz8sDmI7Qv4o49evBGSc0Rm3fOVg3n+dIJ427WZZCfb4+SlFwVTBALseAqSvO3rZ1GW19h4DobD6Bk28YS3XafHmzJt9N8CDkgCUXZtHWPtM3oHrt8iKIKq1qN2ZcH5pkzsQf5Q96T7/ce1xpdWFhQCiNWnaBySvYDdCv7uX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(38100700002)(8676002)(66476007)(6512007)(8936002)(6916009)(66556008)(86362001)(66946007)(6486002)(2906002)(6666004)(33656002)(36756003)(956004)(2616005)(186003)(53546011)(6506007)(4326008)(54906003)(26005)(508600001)(83380400001)(44832011)(316002)(5660300002)(52116002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5737
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	749ff1d2-8107-448d-3af0-08d98cf8d292
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mt6CNLl20y1eiUDqKBZ2LXuSfAi5fc4gP7rR1UR31ShIjqJ2cLC+5kAnwFpfmlqy5H4k167GLkAj8Tv4/Lzm5PPH+nIdrgmWMTEO89UPxwu+GCq5fYrEHg1ch0f1v1X4rXc+F498XW3S3dIFZkE2AuVm5wg7tsCmU2QxTsyMTUoZT2llGKkYZKIKwSePUJR0byI/lwhVT11rpMJATyBiYShwPzGC00eKu6P8cs0ht4dIdwqa0stGC4I32llf3QnHBaT3FHvTosPomrVMdHEZ2S7wSxvz+/cZoMCOqxW9ftFDlImexccmklhwxnIYrA8TIZt/QD2/4EkfGrrXxOJnkudKw6UjhsJREFBGSsUnJmO7QjRbZd0+j5xBF44HfHI8nYUz3YssppxZYukfrCqjm4ht6Do2Psqm1NWoJQ6Od+bd3QAf++vaLe5k9ORCsUzejj8aJkVRICW9Bv2+U0hCKqMKRww2I4uKS10HSN3rnqXVZjMXJdG5QnrmUYpOxAo/yBtTgQALPexrbA2RZI5T7JBbSyvoYkk7Pd0MZW6rGge7ovRVudnUpo6Sp1hc0jno4sznLOluX4IARrQFuISGpheKFKK6KPtcdKolnLKKXNkI6vgQ16wTb2A6hzAxBH4ZTm8BY5RmvJFAj6VFbWO9Td0ainuysNXkN85FLlBmL0U+TCGPYAmG1UdCIAbBR5bIrtCE9a4WnTcd40tQIuiL3A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(6506007)(33656002)(70586007)(26005)(2906002)(336012)(53546011)(8676002)(2616005)(8936002)(83380400001)(508600001)(44832011)(82310400003)(86362001)(6666004)(36860700001)(186003)(6486002)(956004)(47076005)(81166007)(36756003)(4326008)(316002)(5660300002)(6512007)(6862004)(54906003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 20:51:12.7426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dd67c1-8e87-48db-f45b-08d98cf8dc86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3558



> On 11 Oct 2021, at 20:53, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 11 Oct 2021, Luca Fancellu wrote:
>> Add support to load Dom0 boot modules from
>> the device tree using the xen,uefi-binary property.
>>=20
>> Update documentation about that.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20

Hi Stefano,

> Unfortunately, due to the change to the previous patch, this patch now
> has one issue, see below.
>=20
>=20
>> @@ -754,6 +760,41 @@ static int __init handle_module_node(EFI_FILE_HANDL=
E dir_handle,
>>         return ERROR_SET_REG_PROPERTY;
>>     }
>>=20
>> +    if ( !is_domu_module )
>> +    {
>> +        if ( (fdt_node_check_compatible(fdt, module_node_offset,
>> +                                    "multiboot,kernel") =3D=3D 0) )
>> +        {
>> +            /*
>> +            * This is the Dom0 kernel, wire it to the kernel variable b=
ecause it
>> +            * will be verified by the shim lock protocol later in the c=
ommon
>> +            * code.
>> +            */
>> +            if ( kernel.addr )
>> +            {
>> +                PrintMessage(L"Dom0 kernel already found in cfg file.")=
;
>> +                return ERROR_DOM0_ALREADY_FOUND;
>> +            }
>> +            kernel.need_to_free =3D false; /* Freed using the module ar=
ray */
>> +            kernel.addr =3D file->addr;
>> +            kernel.size =3D file->size;
>> +        }
>> +        else if ( ramdisk.addr &&
>> +                  (fdt_node_check_compatible(fdt, module_node_offset,
>> +                                             "multiboot,ramdisk") =3D=
=3D 0) )
>> +        {
>> +            PrintMessage(L"Dom0 ramdisk already found in cfg file.");
>> +            return ERROR_DOM0_RAMDISK_FOUND;
>> +        }
>> +        else if ( xsm.addr &&
>> +                  (fdt_node_check_compatible(fdt, module_node_offset,
>> +                                             "xen,xsm-policy") =3D=3D 0=
) )
>> +        {
>> +            PrintMessage(L"XSM policy already found in cfg file.");
>> +            return ERROR_XSM_ALREADY_FOUND;
>> +        }
>> +    }
>> +
>>     return 0;
>> }
>>=20
>> @@ -793,7 +834,7 @@ static int __init handle_dom0less_domain_node(EFI_FI=
LE_HANDLE dir_handle,
>>           module_node =3D fdt_next_subnode(fdt, module_node) )
>>     {
>>         int ret =3D handle_module_node(dir_handle, module_node, addr_cel=
ls,
>> -                                        size_cells);
>> +                                     size_cells, true);
>>         if ( ret < 0 )
>>             return ret;
>>     }
>> @@ -803,7 +844,7 @@ static int __init handle_dom0less_domain_node(EFI_FI=
LE_HANDLE dir_handle,
>>=20
>> /*
>>  * This function checks for xen domain nodes under the /chosen node for =
possible
>> - * domU guests to be loaded.
>> + * dom0 and domU guests to be loaded.
>>  * Returns the number of modules loaded or a negative number for error.
>>  */
>> static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>> @@ -830,6 +871,9 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE =
dir_handle)
>>             if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
>>                 return ERROR_DT_MODULE_DOMU;
>>         }
>> +        else if ( handle_module_node(dir_handle, node, addr_len, size_l=
en,
>> +                                     false) < 0 )
>> +                 return ERROR_DT_MODULE_DOM0;
>>     }
>=20
> handle_module_node comes with a "multiboot,module" compatible check now,
> which is fine for dom0less DomU modules, but it is not OK for dom0
> modules.
>=20
> That is because it is also possible to write the dom0 modules (kernel
> and ramdisk) with the following compabile strings:
>=20
> /chosen/dom0 compatible "xen,linux-zimage" "xen,multiboot-module"
> /chosen/dom0-ramdisk compatible "xen,linux-initrd" "xen,multiboot-module"

Oh ok I=E2=80=99m surprised because I think even before I was not managing =
any module
with =E2=80=9Cxen,multiboot-module=E2=80=9D, just any multiboot,{kernel,ram=
disk,device-tree}

>=20
> They are legacy but we are not meant to break support for them. Also
> third party tools might still use them -- I checked and even
> ImageBuilder still uses them.
>=20
> One way to solve the problem is to make the "multiboot,module"
> compatible check at the beginning of handle_module_node conditional on
> !is_domu_module.
>=20
> Or maybe just ignore compabible errors if !is_domu_module. Something like=
:
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 840728d6c0..cbfcd55449 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -721,7 +721,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE =
dir_handle,
>         /* Error while checking the compatible string */
>         return ERROR_CHECK_MODULE_COMPAT;
>=20
> -    if ( module_compat !=3D 0 )
> +    if ( is_domu_module && module_compat !=3D 0 )
>         /* Module is not a multiboot,module */
>         return 0;
>=20

I can be ok with this change but it means that any node under chosen that i=
s not a =E2=80=9Cxen,domain=E2=80=9D
will be handled as it is a Dom0 boot module (if it has xen,uefi-binary), is=
 it always true?

Otherwise I can do these changes:

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -721,10 +721,19 @@ static int __init handle_module_node(EFI_FILE_HANDLE =
dir_handle,
         /* Error while checking the compatible string */
         return ERROR_CHECK_MODULE_COMPAT;
=20
-    if ( module_compat !=3D 0 )
+    if ( is_domu_module && (module_compat !=3D 0) )
         /* Module is not a multiboot,module */
         return 0;
=20
+    /*
+     * For Dom0 boot modules can be specified also using the legacy compat=
ible
+     * xen,multiboot-module
+     */
+    if ( !is_domu_module && module_compat &&
+         (fdt_node_check_compatible(fdt, module_node_offset,
+                                    "xen,multiboot-module") !=3D 0) )
+         return 0;
+
     /* Read xen,uefi-binary property to get the file name. */
     uefi_name_prop =3D fdt_getprop(fdt, module_node_offset, "xen,uefi-bina=
ry",
                                  &uefi_name_len);
@@ -763,7 +772,9 @@ static int __init handle_module_node(EFI_FILE_HANDLE di=
r_handle,
     if ( !is_domu_module )
     {
         if ( (fdt_node_check_compatible(fdt, module_node_offset,
-                                    "multiboot,kernel") =3D=3D 0) )
+                                        "multiboot,kernel") =3D=3D 0) ||
+             (fdt_node_check_compatible(fdt, module_node_offset,
+                                        "xen,linux-zimage") =3D=3D 0) )
         {
             /*
             * This is the Dom0 kernel, wire it to the kernel variable beca=
use it
@@ -780,8 +791,10 @@ static int __init handle_module_node(EFI_FILE_HANDLE d=
ir_handle,
             kernel.size =3D file->size;
         }
         else if ( ramdisk.addr &&
-                  (fdt_node_check_compatible(fdt, module_node_offset,
-                                             "multiboot,ramdisk") =3D=3D 0=
) )
+                  ((fdt_node_check_compatible(fdt, module_node_offset,
+                                              "multiboot,ramdisk") =3D=3D =
0) ||
+                   (fdt_node_check_compatible(fdt, module_node_offset,
+                                              "xen,linux-initrd") =3D=3D 0=
)) )
         {
             PrintMessage(L"Dom0 ramdisk already found in cfg file.");
             return ERROR_DOM0_RAMDISK_FOUND;


I would need to check for =E2=80=9Cxen,linux-zimage=E2=80=9D and =E2=80=9Cx=
en,linux-initrd=E2=80=9D however
to be sure the user is not specifying the kernel and ramdisk twice.

Please let me know if you agree or if there is some issue with them.

Cheers,
Luca



