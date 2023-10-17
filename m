Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9857CB7ED
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618018.961217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYon-000512-2K; Tue, 17 Oct 2023 01:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618018.961217; Tue, 17 Oct 2023 01:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYom-0004zM-Vc; Tue, 17 Oct 2023 01:24:20 +0000
Received: by outflank-mailman (input) for mailman id 618018;
 Tue, 17 Oct 2023 01:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsYgL-0000ji-K1
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:15:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac971896-6c8a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 03:15:35 +0200 (CEST)
Received: from DUZPR01CA0198.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::29) by DB4PR08MB9336.eurprd08.prod.outlook.com
 (2603:10a6:10:3f3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 01:15:32 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::66) by DUZPR01CA0198.outlook.office365.com
 (2603:10a6:10:4b6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 01:15:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 01:15:32 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Tue, 17 Oct 2023 01:15:32 +0000
Received: from 91a2f958c56f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C77DDE00-B591-4235-85A4-73748686904C.1; 
 Tue, 17 Oct 2023 01:15:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91a2f958c56f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 01:15:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 01:15:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:15:18 +0000
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
X-Inumbo-ID: ac971896-6c8a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0Qe752MZB4CTFUeNhrJEhLqxP6sgxdTF5/1tTj4gXo=;
 b=0yShSgclaGAzK9Us7EKJjgMBsP2t/t9kRsVMZDK4h1x0aqUlIfnpMnkyF/XIpu1OR+46aMWm1/Ym0EB/zW+jQAeVa0lDj3ttDU5vUWaAddlmZEAQzB3dccqTKauH1kiegVfhGk88l2fZpBxGmaRbKYE9jb/bsV7geV32dk238LQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8fadf9fd7ea02c22
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhag310WyLy5UFLCEHdVLiZ+lWfPfInOB+NFHY0UsPUC/0EWVVsm3rJrRlabw27tD2+BeGeTfM4wK5DoyTP5c4bH0XYMQ984E4ElRv8F6b8Xo+/wquq6AE+iCY8F5MmtTOcPal31DIOhrK6ZqAu8Wf/YLJeBZtB6RnhL7VclXmGUhA9Cz1kVAEjUKBnJGlNDscVP+95qb++rIKW0pRj/rQgV0QCBWao9AUhzRnI4JLoJCHNZKie9ISetFGD9CSYreaWU/UAEXnA8362Pua+EMDNxbBZx46/sCY/b5okk8r+yWbV8VIpvWQx9sX/mbApCm9QhC278/LKs7KluuYbX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0Qe752MZB4CTFUeNhrJEhLqxP6sgxdTF5/1tTj4gXo=;
 b=OZhiMeCL71UAMe+Iq5zmbHXVZtsmMZLH1BNcDFTPYIaS5jrhbOCoY5YLvHXAOLc5yetUB7WdMmMjKlwAXlI7NeWLc8FSWnwEF5eD8jlvVeN6NWMJky0at30L+kO4EqMDP7W1srzl2ixS3veBvgDedeCbIC8W7tlfw42WnOcEjNBJh+ohx9kC0CwNnwmZRdQx5fXEU78afaU9hCI7bDMZYcBktSNauJ9rQki0aCBngjImPxsQaabVGBIQVbaGYQT/wUEiVquf8Sw1+Ss7sZfYjBBWIQOxx4H6+SGwwwrsXmtTRY0yjOAMLMSS2q0myqMm8XXKOseZDyO07GjuhVtWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0Qe752MZB4CTFUeNhrJEhLqxP6sgxdTF5/1tTj4gXo=;
 b=0yShSgclaGAzK9Us7EKJjgMBsP2t/t9kRsVMZDK4h1x0aqUlIfnpMnkyF/XIpu1OR+46aMWm1/Ym0EB/zW+jQAeVa0lDj3ttDU5vUWaAddlmZEAQzB3dccqTKauH1kiegVfhGk88l2fZpBxGmaRbKYE9jb/bsV7geV32dk238LQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [for-4.18][PATCH] xen/arm: Check return code from recursive calls
 to scan_pfdt_node()
Thread-Topic: [for-4.18][PATCH] xen/arm: Check return code from recursive
 calls to scan_pfdt_node()
Thread-Index: AQHaAC7LgeSduU1uk0uBgC7r5iKuprBMaPIAgADFa4A=
Date: Tue, 17 Oct 2023 01:15:18 +0000
Message-ID: <32511345-F7E9-4687-9848-4692EDD53AC7@arm.com>
References: <20231016124559.8220-1-michal.orzel@amd.com>
 <18D03C43-2224-43EE-B9BA-B04802A7FF5F@arm.com>
In-Reply-To: <18D03C43-2224-43EE-B9BA-B04802A7FF5F@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7380:EE_|DBAEUR03FT043:EE_|DB4PR08MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 19669507-40e5-4fc4-b6cd-08dbceae8f2e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H7SR7HSfDr2s/L2/NhHwzj/ip04Joaf/kMu+GNIM7nAZRwUwd/gikSHO260OdWWF0Wnezfj0ENTXeAKpGfP/IcatAoQN4gxtBknvG5jDTPQDjHOUbkaN9+rzaF7pgy4SkPWCJsd4FIM+yq5STR6d9esGo2L/mb//AbJSyPDisxxaCDrju3NEc0E2dhXB9BY6agOBLGRN0ItZhheoMyAgPVSwpHGaJDKK4i6ES3i/Y6EzRVUkd3yZDX4K3x2rFdm1CmJ+OL2/z0+aimCmRwjrMPsl6iUuuBDvaaMEGMcub4GuIw8Lg6uSgt/9nT/TSd3pKLgwDQied08e2/JDm7An/vS3IwAbAGZiITsutBuwQWCuPaxkC3pqUjrrRJknlSn+yn0ZDBR/WB51n61334M1T0ZKMgg4i4mmRHgdusmhpasYmEw7SjnNXBTiz+ib25/M8cRmMxCls9liANXVU/WhZ27fzqM0Uo+ZmAvQphY4HHVnM/FuiCRdnjhb8TjpjkVUWTVNhfarbeRJ+iPvP+YW7i30HbIbjN8GfPq6Y+ehla/nSXsqnI3Emc2FRB32UGyGBOVtNLy+hJvI6wKEti0AQDdFvme/k5MjTy789FOulovvl88kXEIOMxYNLIbyOrMjAr0znOVQkX60EsbVoY+ztg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(66476007)(91956017)(6486002)(66556008)(110136005)(76116006)(66946007)(54906003)(64756008)(66446008)(71200400001)(26005)(53546011)(6506007)(41300700001)(2616005)(6512007)(8936002)(8676002)(2906002)(4326008)(5660300002)(38070700005)(36756003)(33656002)(122000001)(86362001)(83380400001)(38100700002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65BA0EDC40B7604DA7EAB62369839CA9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f412652-e562-44f3-9435-08dbceae86c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4BSWLabfE7hL8lc8zngqGvzC6c0tknfq4WLS56iJB8q+xgjEO5rs/a55qQi0HAnQzl9HTrpJpmkbqdTFUF2Vzv1e2ETy4GcFF6d+I+pSPCoF4JPocDOA/zMyhkv82PCB9t1g47uJrGsWGEJFn2NVHAM6uSR4df8fMXGx5MkYoh1WUUO8Cg5VNPd8Dwaqbx+Nc+Mheb0+y4xkP8NFiE40EHp+9ot23KIH1QqmDUXm+uuRdrt/nmlfU2plZ96xGZ58KM7sKmStWJnzl7XjoffFXyhiRj4iA69/bE/zq1XE0i+VgSHKW/s1G2oa3kjXF7j2g0pAkik1aanPqFMBLJGzCWI6mRu1d4erjsAFtLpcnZ9oELE0BXyTlDqxNu0wa1BtQJEzbwOJ1A//AIlsALjZ/LWzCtnYKPfmrkbEMeBbubiIp5BtZmQRZTOwfUh6Ay4tMRMkCkSpb5DzlXaOGXSv+tFK3J7QguvZtfOBp+0AoTpzjyn6o6og2yr4psliDW1rCx+estwkwEJqm1acvRQfn6ITDNOlhNG80SJeN5tFSovX+x1QGV7mzY7TgGMiOJzrDvXOl3K6zwSCvOVGR2lQALpFjEiC0ASnpikI0jNohDLn38YicRmVMQVae4zz7k+UkioWlyyI/ov/mbqF7IgeQsu3a1jaG5HGF5+uGEIVBJa8xLTI0jk43IJ8GUw6LW53EdEtgHa8JnEJHN/8C6ro3p0WEZ8oHPU8tZ88iE3/gM0ukPRR+iujeyoAO+UKnIwq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40460700003)(107886003)(26005)(2616005)(6506007)(336012)(6512007)(53546011)(47076005)(36860700001)(83380400001)(70586007)(41300700001)(5660300002)(4326008)(8676002)(2906002)(478600001)(6486002)(8936002)(70206006)(316002)(110136005)(54906003)(82740400003)(81166007)(356005)(86362001)(36756003)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 01:15:32.4579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19669507-40e5-4fc4-b6cd-08dbceae8f2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9336

Hi Michal,

> On Oct 16, 2023, at 21:28, Bertrand Marquis <Bertrand.Marquis@arm.com> wr=
ote:
>=20
> Hi Michal,
>=20
>> On 16 Oct 2023, at 14:45, Michal Orzel <michal.orzel@amd.com> wrote:
>>=20
>> At the moment, we do not check a return code from scan_pfdt_node()
>> called recursively. This means that any issue that may occur while
>> parsing and copying the passthrough nodes is hidden and Xen continues
>> to boot a domain despite errors. This may lead to incorrect device tree
>> generation and various guest issues (e.g. trap on attempt to access MMIO
>> not mapped in P2M). Fix it.
>>=20
>> Fixes: 669ecdf8d6cd ("xen/arm: copy dtb fragment to guest dtb")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>=20
> Good finding :-)
>=20
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
> Cheers
> Bertrand
>=20
>> ---
>> @Henry:
>> This is a bug fix, so I think we should have it in 4.18 given the possib=
le
>> consequences I described in the commit msg. I don't see any risks as thi=
s change
>> only checks the return code for an error.
>> ---
>> xen/arch/arm/domain_build.c | 7 +++++--
>> 1 file changed, 5 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 24c9019cc43c..49792dd590ee 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2872,8 +2872,11 @@ static int __init scan_pfdt_node(struct kernel_in=
fo *kinfo, const void *pfdt,
>>    node_next =3D fdt_first_subnode(pfdt, nodeoff);
>>    while ( node_next > 0 )
>>    {
>> -        scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cell=
s,
>> -                       scan_passthrough_prop);
>> +        rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, si=
ze_cells,
>> +                            scan_passthrough_prop);
>> +        if ( rc )
>> +            return rc;
>> +
>>        node_next =3D fdt_next_subnode(pfdt, node_next);
>>    }
>>=20
>> --
>> 2.25.1
>>=20
>=20


