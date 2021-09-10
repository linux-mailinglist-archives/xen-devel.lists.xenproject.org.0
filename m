Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452A406A2C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 12:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184249.332827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdqF-0000sv-KQ; Fri, 10 Sep 2021 10:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184249.332827; Fri, 10 Sep 2021 10:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdqF-0000q7-HJ; Fri, 10 Sep 2021 10:33:07 +0000
Received: by outflank-mailman (input) for mailman id 184249;
 Fri, 10 Sep 2021 10:33:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wql=OA=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mOdqD-0000q1-Ie
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:33:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eacb578a-e1aa-4dc3-a57f-378e6cd2c552;
 Fri, 10 Sep 2021 10:33:01 +0000 (UTC)
Received: from AM0PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:208:d2::41)
 by AS8PR08MB7281.eurprd08.prod.outlook.com (2603:10a6:20b:420::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 10:32:59 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:d2:cafe::76) by AM0PR08CA0028.outlook.office365.com
 (2603:10a6:208:d2::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 10:32:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 10:32:59 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 10 Sep 2021 10:32:59 +0000
Received: from 184721cf214e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BF4399AF-1EF1-4E0F-9CC5-18DFF5057E65.1; 
 Fri, 10 Sep 2021 10:32:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 184721cf214e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 10:32:38 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Fri, 10 Sep
 2021 10:32:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 10:32:27 +0000
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
X-Inumbo-ID: eacb578a-e1aa-4dc3-a57f-378e6cd2c552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBm663vIp1pIJh8pt/Vtbd5Q3WrEzvITnnu51uJ0R2Y=;
 b=bTolQo2BASwWRot2vZQvuWUf85AErznDi71zVoaVLpCpBav4BVlhDFtxd/jX9FCGAslD83OJ7n6CcmAN2BrdXTEEvrIG/+OWjk86IoFDCgHPA7BEI7xRXDo/5AP2SmL9/HVNXMVsGVpK4e0bNVei1IkeKMx26lhMd/WLQOLbqD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5de358e8ed07d05a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzcVefv7LhQLoi4XY+qc4QQBig07KD6LldaleyvF3RcNyAXRENsGXpV+Oe0PoqP7t1rGKY8k3Rpt1Ay+SS/bL9JCYBtDvZblOnD+yYvkhExd68Atj27sT844xh56t3pgKWUbbGv1GjEhYL1ol6S1FrG8OJDg1AEXKS7GuFu+lRvp0jSYAqTUB2t05RAveoOiMjddg2FG4aa92r8eDCrZxvkj29ZbQWLNZ8a0Xl8sWNrli8nQyl59N96gCxrDL5/PMQCj5347Hitw+OfBrpqwA7a3HjDDE/0XntO7FhUMLR/jTyArgUXwXwNinbjik80wJkEjNmm+OJ5IKVOf1XgLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBm663vIp1pIJh8pt/Vtbd5Q3WrEzvITnnu51uJ0R2Y=;
 b=FPzN66bWqXeR8080MtDtlRb+eAah0zxMUYDbk0OOHrAlzxXMa31MpHpxuTY/w3UB8N0CY75pZwm+G/rgteA01CFPuu+SLoflTIfZPUPtE87+Of5W2xMwBqHNkWkCwlta9H2UxujQhBVWaHwhq/DP529FznlWS9c3+kSlnqYD1kAb3ASWdmp9mW0bRK5E2MtJf3tpfWrNUpqU2vXj7qnpf3ybpYs80k9ojUy9BnCfPnXvwshA273ZQv0H6XQGyjElTcmYmsMaCGQ+6k44GuuNB/nX2O8XKs5fNaFrWVx5oAqgl26qBRMVuD8WtaOA+EJWGVikeCKljwvSIdeHk7B+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBm663vIp1pIJh8pt/Vtbd5Q3WrEzvITnnu51uJ0R2Y=;
 b=bTolQo2BASwWRot2vZQvuWUf85AErznDi71zVoaVLpCpBav4BVlhDFtxd/jX9FCGAslD83OJ7n6CcmAN2BrdXTEEvrIG/+OWjk86IoFDCgHPA7BEI7xRXDo/5AP2SmL9/HVNXMVsGVpK4e0bNVei1IkeKMx26lhMd/WLQOLbqD0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Topic: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Index: AQHXlPKX2eY2zjLj706Keqt9aql1MKubBqqAgAItu4A=
Date: Fri, 10 Sep 2021 10:32:26 +0000
Message-ID: <0805876C-EBC6-4B84-8D62-EC93EBA98F9D@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109081814120.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109081814120.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 65d62329-0f46-413e-39c7-08d974465c54
x-ms-traffictypediagnostic: AM6PR08MB2998:|AS8PR08MB7281:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB72812496001308B6DD43BFFDFCD69@AS8PR08MB7281.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pv7y3bN3Y8ts5olFp2ILAQgaWOFj1JwOke2gtnxaAESVhYaaOmLk2S7nTDRzpf0aD39LAd3D6vZNjgNAgPlJ6yd1TWNJKl0H/KlZrHIHYiV193LFAlsJ9DeWOLA7FdtA+4VCwC9cMtdbfCUtNxWbCFdFurgcWbRqJuncM+NfwkRX/XtgxFlxmbbMECUbzvxSPpKPShlnzznO7w1fe8Jtav0ThuL34M1H3M7V2AGUK1KSUc9oT/bm3tPyulRnpuSDirhhTnQC05XVrBG0sbhq83vCusbr0Ps/FvAjoLfPwnUSOorbmnAxC3dxPdUVz3xlZZ62DWRHyOcrIhXpqqUONMX+o+NrjXq+l8V92/pqtsaiR66RRDx1HNXohC10siu0441GhPu1DiceLMbkt5o0VrE4TGHp9lfvOfTADrvPyJgUmIRYNeb1by3BUS5hy6mKymsrb5UZkIVSJ2pnl+E5tV7QO6jOYQzXH4cCGhCrgbcmqOZZjtDeSwqOBG66sRiKxFusm/eFGfou9s1Tdx5rVLMAQuqxavi76cz3ugLJkvG/MtIR9+dL4+o4OTm9t01zQ6HgjbwbQKu3OGk8DTlr6HqBsn/WGYF13imagTiviv/s48OfBOBLfPWKe6S9RiXYSjkw6squ8rvW1WCLO7d1+Yr4MrxMXxqYTsnflzhD6IgbrlggCNJW6lj5nAXdmWemp970bdm8e+8VWvIKpUGzKruCD1y4/V5y+ltiQcJ3HWghnigm4YfyT+QBUqImmzFZCRCC5p0p4VVRxantVV8GLiintxKC37jUpFDV8rfcGcY53iPbOsZKrGMZKNr4OZ81
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(8936002)(26005)(6512007)(316002)(4326008)(478600001)(6486002)(6916009)(2616005)(2906002)(36756003)(8676002)(64756008)(66446008)(122000001)(66556008)(66946007)(53546011)(38100700002)(66476007)(54906003)(5660300002)(38070700005)(33656002)(91956017)(186003)(86362001)(71200400001)(6506007)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C382CDAB7B69AC4EAF33469541DB9A3A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7bbf11d3-e1be-4fdd-21e1-08d97446491f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMnRTV7YhnxzjzIzihaOx5HWfsZqCJUOBToki5CoYAxoaUOMDAzfW9iqFOpSYbJqJw6/LnJwR8lj+zASO4usVd9rbeAiPHMjjB1nWJLgv6amNVBamKP+UawMFmJIaIShVhlkGDxjphFy99W5GV5o6HKDg1Y+hX67BW+u9EpBt2Q5Q6AteL74rD55Hs7zQn0sZK5aXfMYR/dnfAnO2sYOPIHk5ptAOb8MGuS0BnU1PbgOYbhTXrR+trfuDSbTY/P0qKQKJCY7ws9UQsew4hBQMqrlHHtxBmUZKOnfTFm3rWXxePQjmeQMNzjDAehoXFNgN9TegdzN/8vJ1Me0N2sqMGjUpAzH06b3I+snb4iuWU/+4nWwB9AiytqDNEMTf1KNsNs+1m1g/Nj4LCFyHBG94pGWQm/IzY+IMA/LzW9tzUR+LwVcucdOBFdOc4lwWnK76LWvn79AY0mnC7Bi4W1lSTodsxlkQsaf+fRoI3apD1rW1nbGK1I/qj81nbKtoOhp9nVv9yQSNH/RrreeNZ7eeuxYBCsH6UpdIMXMztm/Kgc49rdJP4V+SoOV1ks/EbTe63vuGLa5fjAxabnYWEn9vK+e69J53CUBF+dDnbhUIbBQP5R/0uJtlMHZ/dPeubzQXV5UPznFt14A2umbEqGdVNfWWdR+4XuJGNGJrQYgvyovLVVdUlN4JCgXgkXdLUjhBkDrpPaHfHqw/eagvzWMijim6Ig0xt+enn05J8U0iGAc8sv/B25PRzaKVDF662Jl+1luR2IKyEEoD4ZYHWzBHslyaiM9sZdAXmMfT6b+pLQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(2616005)(4326008)(356005)(26005)(6862004)(81166007)(6506007)(82740400003)(54906003)(53546011)(2906002)(8936002)(33656002)(8676002)(336012)(186003)(70586007)(86362001)(36860700001)(36756003)(478600001)(5660300002)(47076005)(107886003)(6486002)(82310400003)(70206006)(316002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 10:32:59.4613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d62329-0f46-413e-39c7-08d974465c54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7281

Hi Stefano,

> On 9 Sep 2021, at 2:16 am, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Thu, 19 Aug 2021, Rahul Singh wrote:
>> pci_init(..) will be called during xen startup to initialize and probe
>> the PCI host-bridge driver.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
>> xen/include/asm-arm/device.h |  1 +
>> 2 files changed, 55 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
>> index dc55d23778..d1c9cf997d 100644
>> --- a/xen/arch/arm/pci/pci.c
>> +++ b/xen/arch/arm/pci/pci.c
>> @@ -14,13 +14,67 @@
>>  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>  */
>>=20
>> +#include <xen/acpi.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> #include <xen/pci.h>
>> +#include <xen/param.h>
>>=20
>> int arch_pci_clean_pirqs(struct domain *d)
>> {
>>     return 0;
>> }
>>=20
>> +static int __init dt_pci_init(void)
>> +{
>> +    struct dt_device_node *np;
>> +    int rc;
>> +
>> +    dt_for_each_device_node(dt_host, np)
>> +    {
>> +        rc =3D device_init(np, DEVICE_PCI, NULL);
>> +        if( !rc )
>> +            continue;
>> +        /*
>> +         * Ignore the following error codes:
>> +         *   - EBADF: Indicate the current is not an pci
>                                                     ^ a
>=20
>> +         *   - ENODEV: The pci device is not present or cannot be used =
by
>> +         *     Xen.
>> +         */
>> +        else if ( rc !=3D -EBADF && rc !=3D -ENODEV )
>> +        {
>> +            printk(XENLOG_ERR "No driver found in XEN or driver init er=
ror.\n");
>> +            return rc;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +#ifdef CONFIG_ACPI
>> +static void __init acpi_pci_init(void)
>=20
> If the DT init function returns int, then it would make sense for the
> ACPI init function to return int as well?

Ok. I will modify acpi_pci_init(..)  function to return int.

Regards,
Rahul

