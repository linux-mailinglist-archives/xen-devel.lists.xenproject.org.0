Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C78A988F5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964511.1355288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YgT-0007pH-Ob; Wed, 23 Apr 2025 11:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964511.1355288; Wed, 23 Apr 2025 11:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YgT-0007n5-Kq; Wed, 23 Apr 2025 11:54:33 +0000
Received: by outflank-mailman (input) for mailman id 964511;
 Wed, 23 Apr 2025 11:54:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7YgS-0007mz-9m
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:54:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7243000-2039-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:54:30 +0200 (CEST)
Received: from MN2PR19CA0020.namprd19.prod.outlook.com (2603:10b6:208:178::33)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 11:54:23 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::64) by MN2PR19CA0020.outlook.office365.com
 (2603:10b6:208:178::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 11:54:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 11:54:23 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 06:54:20 -0500
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
X-Inumbo-ID: b7243000-2039-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQS6kq8wahfktLRDrmkpGd2gqEQ+Rg9EnjFR5rf1JdhjD/DL20bDYCqee6iv4k41KhW9ShVjlldllazxUpQTZZp9HMNalNy7JCMqgRcav0kJtH+0aoiXUkXxn2uXiXEzL22srl+bvGfhh29Eg4gQwQgRyHXQvb/w0X0sUbTbSSePZVYyXO2xY10a3FWpJ9DWZz7gj9rh1RS5vJHG3X0Zo3IJl1bBKev7XoS0FIg4cezxiuoWjndQ46yFk1r1WWqerlUJm6H3PPIanL+/eSBxNBn1TADNML0QoCPKfbKf5zD/5fkPV2lWefz8euVFI6tQfFnaSGSjBLZJN55yJXd5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oleSgYpvcA1EcD7hS+UrZHpjy9CXN1xUW5/vhHEvILo=;
 b=Dh7Sw2cvDY9YrOYI4BIFELztqfZHsnbU9F0D1aDv0Gnvq9CBYsj4SKbLELZuby4xPCaQvBl2iO2LmgpeTAbWE5j38lVuFywZTnxeoOdT6vCEIbVgys6RnqZngVeEQ17qNGX2lQEeo2NkeZBOC+UxHq+lwwIVVUsEJgdma2l7DvHpT35rnTo7ObVKmVrnUND90/ABIVND/qHwHHEflNbYOApb54QK3LYy657kLL8Ku1w9r4HiceUEUXK5yx9Ax/ycC1VLLOSAeBsLkM+dLhx321942Dmv+YQ5fKoeCyArQfMhq73XkVK70SwFpUuYlRcwzD2+I7jl03TKWRpzzGeqCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oleSgYpvcA1EcD7hS+UrZHpjy9CXN1xUW5/vhHEvILo=;
 b=Ipv+OCYlstjSR6lDwsWbOfii7uV3jTUcdv3Fv5vdU3XPRPYU+PsDPxYr4aMgO/VO0QWAh1u1a7fafB1gNT9wrsenHGp1cpzxoSIe7FpD+2w9ryEYnJwQYEK2sfT/qJG/9xDZIli+FZcuyQM4c9XtTe0zLhrvoTntGSyfR19iX/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 12:54:18 +0100
Message-ID: <D9DZXZRPA391.3SLSYKKAIR8OT@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 04/13] x86/hyperlaunch: initial support for
 hyperlaunch device tree
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-5-agarciav@amd.com> <aALN/46JGBJTBCMm@kraken>
In-Reply-To: <aALN/46JGBJTBCMm@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: c625d32d-4371-4e5e-9c6d-08dd825d96e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmNmZitxVzNSeFBibnBnemhodUpTUTgwMmkxS0JZSnV6eHI3Ti9acUVJR3Yz?=
 =?utf-8?B?Qm5uTTUraEZ6ckFsMjlzVzlVTnhzdzlHZE82b3ZORmFCY3RZSkx3aGpxNWl3?=
 =?utf-8?B?dW1TcFBabmVvZ3hQM1lBOXFJK1VndHUyeEZMU1lvZE1sdUxiRzFmNm56L1lr?=
 =?utf-8?B?U3NjN3JiNEpIQzNsVHVEUEhiak9GQTZiQWN1d1pzRmRhMmRiVWJMVFp6QjFX?=
 =?utf-8?B?RjIrbjliMDRuT0JkOHJWekJaUldJbXRFY3U5Rm9RZGtaMHVlNWdZN29CUDdv?=
 =?utf-8?B?UWpCMjNqQndlUWFWNEJhSWpYM1c3YnljZHRNYmllaXJ5Sno0b3Mvay9XaWF0?=
 =?utf-8?B?RFI4TDZCbW8wU0VNQU9XaHZwU0prUXNISEc1bS9xS2RSeFRueEhtdnFjVjNJ?=
 =?utf-8?B?N01oUWFvZm1PRHpKcXRGUzd1WUcyYzdZWWpxclZFWHdkYTcyT3hnT3o4N1h0?=
 =?utf-8?B?Y2NYS3hWZlk2dm1kWTROTXhPNnJ6eXBLTFN1Ym00Y1pZNFFkbmM0bkJiMFNx?=
 =?utf-8?B?Mjk2UUgwYnFRRW1jaWZGUlNpNml5dGs3WllQREF6USs2UWllY0pnNXFveU1v?=
 =?utf-8?B?amVJUTdRZDFQVC90UGFwS2lzY0plS21OUHlTY0NlZlhHcThaYmJ1UGpXUmNK?=
 =?utf-8?B?eUpEeVJJUUVpVE5jd05JakRyN2hKY3pHZmhHTDBlZzUrZ1JmNjJ1dnNnVVZm?=
 =?utf-8?B?RXVZTHdyRDMrb0ZVblNmQ2IrWVE3WmxtNjlOYThSNzNmTUpmaVA4T1NCYzVG?=
 =?utf-8?B?WUF2c2hUVDhaR3pyN2oxUldVSUo5bTZYbGNmNFI1REFUK240NFVxOVJHSkkx?=
 =?utf-8?B?N05vdXMvV1BhLzNGMTVBQmtKVkJ4M2ZrSTJLV1d0OXU0Z2h0Sk4ySzF5NzY3?=
 =?utf-8?B?SDJzU1RSRlJibkIzbDdsclZSbFNYaHZUNlRUbW9JZFU3aUd5ZlhZNjdXeVpp?=
 =?utf-8?B?MExJL29JY1pmS3RrSE5hTDVGaS9lc2o4UERSOGpjY296aysvRUt0MjBqNzlU?=
 =?utf-8?B?S1dhNndlTktGWlNUa1NzZGVqNnd2ZG9uWkZtdkk2VVQ5ZGJQbGR0RHhjMWdL?=
 =?utf-8?B?bFlVN2NOeitTenl5NHNGbXFENkZMYXpQYUJPR1UzSVZqeFBPbXpXdW9FT3Y2?=
 =?utf-8?B?dnpvamFvUDlUUk56M2FNMUFYL2prTVBJQ2tma2NuL0lxa0ROVWNEVjVJZy9R?=
 =?utf-8?B?N1BqU3ZpeU5jSmtuWFN0czBTeHZsNXRJZnRFNlNTRGVMVzZzSTVYOExYSEl2?=
 =?utf-8?B?NFhKdm1CZDU1cTVOTG9VWlVhTm1EN0JTNHR6NkRnTVBHRndDY3ZvK3FQM3JU?=
 =?utf-8?B?bW5mY3k5MExRem5pYUYyZnNCdlRMS1lPcVhYdmhHb0RxL2c0eUlpaThWdi9Z?=
 =?utf-8?B?Zzhsek1qU1hya0p4RTQxQ2lOdmRONjVaR3MxckNqMkE2NTJiTzloZDkyblFr?=
 =?utf-8?B?dGkySjVialRyWW02OWR5Z2NYcmN3UXk4Ui9QUDdBb0VzUFpCUHIrYXhiMUVu?=
 =?utf-8?B?TGMzeGxXV29QSmg2Q05HVzIxUDBMb0lXOEgzWk40Q3V6MjNwaW1pbXIzbnMz?=
 =?utf-8?B?M1ExdG9jWWUxNldiZUtGeHVQeG9aaVp3bEFxM0NoN0RFOHdJdnRpTXZiNEhh?=
 =?utf-8?B?cVV5ZVBQKzcrNzNGSVl2SzR1dnlUTkNKVmZlcGNyMjR3ZFdWemN1NlpIVEJ2?=
 =?utf-8?B?SHV5T3c0NWVoUXB6djh1UU54ZHQyTXhFeEV4dGhUVk94dmtiMjNxY0tDK2Rj?=
 =?utf-8?B?UkJvQzB2dXpTNENkQzlXTDIrcDIrT2tNVlRERUM5Rm5oeHZvYVBmVTJwREhI?=
 =?utf-8?B?Y1FsbkpNdTZWa3pISVZNTXM5dmZpMWVPa3dBSGk2NExGRExUczdNSmxmTEYw?=
 =?utf-8?B?eWhrZmNKUnUwTFpXL255ejlyWk4yZXo1SVhTdWh5TjFLc2NWbFNWVncvZUYz?=
 =?utf-8?B?SE00QXR6c3NGZCtrTG1pY0Nnb2U5cVVOMlcrYUxPS01kZjVxSFU5YmFSV2R3?=
 =?utf-8?B?dmZ1T0I4RkVRZUFqRllZdHMrY2V4ZzhDOE50MjR6NEFrd1h4c3ZxVDQ5L3Fv?=
 =?utf-8?Q?oOTOus?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 11:54:23.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c625d32d-4371-4e5e-9c6d-08dd825d96e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449

On Fri Apr 18, 2025 at 11:11 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:26PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add the ability to detect both a formal hyperlaunch device tree or a dom=
0less
>> device tree. If the hyperlaunch device tree is found, then count the num=
ber of
>> domain entries, reporting an error if more than one is found.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * Panic if we're booting on hyperlaunch, but walking the DTB fails.
>>   * Remove inconsequential "else" clause in fdt.c
>>   * Remove stub, as it's not required due to DCE
>>   * Use min() rather than open-code it
>> ---
>>  xen/arch/x86/include/asm/bootinfo.h |  1 +
>>  xen/common/domain-builder/core.c    | 11 +++++
>>  xen/common/domain-builder/fdt.c     | 63 +++++++++++++++++++++++++++++
>>  xen/common/domain-builder/fdt.h     |  1 +
>>  4 files changed, 76 insertions(+)
>>=20
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/=
asm/bootinfo.h
>> index 82c2650fcf..1e3d582e45 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -84,6 +84,7 @@ struct boot_info {
>>      bool hyperlaunch_enabled;
>>=20
>>      unsigned int nr_modules;
>> +    unsigned int nr_domains;
>>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
>>      struct boot_domain domains[MAX_NR_BOOTDOMS];
>>  };
>> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builde=
r/core.c
>> index a5b21fc179..3b062e85ec 100644
>> --- a/xen/common/domain-builder/core.c
>> +++ b/xen/common/domain-builder/core.c
>> @@ -43,6 +43,17 @@ void __init builder_init(struct boot_info *bi)
>>              break;
>>          }
>>      }
>> +
>> +    if ( bi->hyperlaunch_enabled )
>> +    {
>> +        int ret;
>> +
>> +        printk(XENLOG_INFO "Hyperlaunch configuration:\n");
>> +        if ( (ret =3D walk_hyperlaunch_fdt(bi)) < 0 )
>> +            panic("Walk of device tree failed (%d)\n", ret);
>> +
>> +        printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains)=
;
>> +    }
>>  }
>>=20
>>  /*
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index aaf8c1cc16..b5ff8220da 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -13,6 +13,36 @@
>>=20
>>  #include "fdt.h"
>>=20
>> +static int __init find_hyperlaunch_node(const void *fdt)
>> +{
>> +    int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
>> +
>> +    if ( hv_node >=3D 0 )
>> +    {
>> +        /* Anything other than zero indicates no match */
>> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") =
)
>> +            return -ENODATA;
>> +
>> +        return hv_node;
>> +    }
>> +    else
>> +    {
>> +        /* Look for dom0less config */
>> +        int node, chosen_node =3D fdt_path_offset(fdt, "/chosen");
>> +
>> +        if ( chosen_node < 0 )
>> +            return -ENOENT;
>> +
>> +        fdt_for_each_subnode(node, fdt, chosen_node)
>> +        {
>> +            if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
>> +                return chosen_node;
>> +        }
>> +    }
>> +
>> +    return -ENODATA;
>> +}
>> +
>>  int __init has_hyperlaunch_fdt(const struct boot_info *bi)
>>  {
>>      int ret =3D 0;
>> @@ -20,7 +50,40 @@ int __init has_hyperlaunch_fdt(const struct boot_info=
 *bi)
>>=20
>>      if ( !fdt || fdt_check_header(fdt) < 0 )
>>          ret =3D -EINVAL;
>> +    else
>> +        ret =3D find_hyperlaunch_node(fdt);
>> +
>> +    bootstrap_unmap();
>> +
>> +    return min(0, ret);
>> +}
>> +
>> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>> +{
>> +    int ret =3D 0, hv_node, node;
>> +    const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_I=
DX]);
>> +
>> +    if ( unlikely(!fdt) )
>> +        return -EINVAL;
>
> I think this check can be converted to ASSERT() since walk_hyperlaunch_fd=
t()
> will be called after has_hyperlaunch_fdt() where condition is checked.

True that.

Cheers,
Alejandro

