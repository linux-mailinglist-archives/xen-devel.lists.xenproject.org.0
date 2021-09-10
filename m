Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5C406A56
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 12:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184269.332860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOe4C-0003tc-CZ; Fri, 10 Sep 2021 10:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184269.332860; Fri, 10 Sep 2021 10:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOe4C-0003rs-9A; Fri, 10 Sep 2021 10:47:32 +0000
Received: by outflank-mailman (input) for mailman id 184269;
 Fri, 10 Sep 2021 10:47:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wql=OA=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mOe4A-0003rm-KX
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:47:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b9f855e-89d1-4d69-8f28-02eeb98c7998;
 Fri, 10 Sep 2021 10:47:28 +0000 (UTC)
Received: from AM7PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:20b:100::38)
 by VE1PR08MB5709.eurprd08.prod.outlook.com (2603:10a6:800:1a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 10:47:17 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::6d) by AM7PR02CA0028.outlook.office365.com
 (2603:10a6:20b:100::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 10:47:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 10:47:16 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 10 Sep 2021 10:47:16 +0000
Received: from 354c5663a417.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D2C8A72-DFA3-4892-8622-3A8C51F9DC1A.1; 
 Fri, 10 Sep 2021 10:47:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 354c5663a417.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 10:47:09 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6390.eurprd08.prod.outlook.com (2603:10a6:20b:31b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 10:47:07 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 10:47:07 +0000
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
X-Inumbo-ID: 7b9f855e-89d1-4d69-8f28-02eeb98c7998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3T5QrqH9Wr/xr6+l3AdimKefw6fTFiBu4kjW1CQhac=;
 b=3v++o1eSxQ8b2jdIJQZfgT+RTXsruf4FfXp8i/K0w8ZFbMZOHvMbXem8tDGULiMNw3cEV0sGaGIXjpS6/6BDBo1FA95jFtSyvTO1S6k+3wV71XUril2OngyWS75OQIkA0n2zMh6Ux0cJiEUp2ivS3zcKCx3VpmwRm7E+HFC9L20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdf5c3c594e18989
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJAjMGGrD6WCvoK6/BPb8b9aiaupusvuqRbHqyll2ZR1YqoZ5EdrvmO/0rjQQeRDOXpOkmGF7cV/TpYr6tH7nlSgUTR3dOCcVo5y60YbqG/sEifZdszkv2NQ834BmoGD7FAYAV0qL2IDF+cWTxnuX5OfqxIIJr7W/AfrsZXiMQiH2C/0CbthvezvX2mY7JeLE0a9oAUXveyk1zMAwuz2iY9MJchcyV6ZMQTD3hPTgX6ltzDSP1Itpb38h5d/C9eOIYQRop6mX9fORoF9Eear2JZrLgu5lXJ8wtBT1wSeTbtNdXLGEUrJvcB8fOQ2GO97qsoVvnoKmFAziVuWXJpFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q3T5QrqH9Wr/xr6+l3AdimKefw6fTFiBu4kjW1CQhac=;
 b=cHHnqmISqrVadKZ03sCJqejBra6kzCbeZVCebWZBj8vsM1I5D7Ecro49rzDOZScWR2VodYZZ0bS3RMCHIpSim8pXil45/ib+T1VpWhby4c5Pvf1xVpNUD4dr+JQ5eR/Peemj9WqIpm1AOViGXrKkSCoaQTSjddlRB3RnXktY6zi4UyB6rbUoMl0MJZfGD3GNGQTrgJMhEyYsg9Mu909BRNqJ8Z9jw2/NThcRiSOnzyk1qDsgDFd9GIDsWfqWzMNBe3Z/zeE7qf+kGKFpktAUuJszJUAhbfSsfrqoJ3v9LxnmHavLfkwPIEgpgm8Y5uIE7L/HAANYWu62P3KBCcPbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3T5QrqH9Wr/xr6+l3AdimKefw6fTFiBu4kjW1CQhac=;
 b=3v++o1eSxQ8b2jdIJQZfgT+RTXsruf4FfXp8i/K0w8ZFbMZOHvMbXem8tDGULiMNw3cEV0sGaGIXjpS6/6BDBo1FA95jFtSyvTO1S6k+3wV71XUril2OngyWS75OQIkA0n2zMh6Ux0cJiEUp2ivS3zcKCx3VpmwRm7E+HFC9L20=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Topic: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize
 the PCI driver.
Thread-Index: AQHXlPKX2eY2zjLj706Keqt9aql1MKuYWIqAgATf9QA=
Date: Fri, 10 Sep 2021 10:47:06 +0000
Message-ID: <09B3A73D-9ABA-4145-94C6-9F3F621C98A8@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
 <9bbf553c-80ff-7a1a-a87e-e2162085caca@xen.org>
In-Reply-To: <9bbf553c-80ff-7a1a-a87e-e2162085caca@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0372bed3-2d86-40a9-97d8-08d974485b4e
x-ms-traffictypediagnostic: AS8PR08MB6390:|VE1PR08MB5709:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5709B3D5189D940980387449FCD69@VE1PR08MB5709.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XT+NYJpCqmd17FXLHCYWUtcUNEpthTgyIERLUzx8ldmuexnpFgd3JRo0/DWXm7NHyXWhecTbRfZUGFIhKTEfVa3hrP4V+SlEitGMKY9jnUPrKyMtLKywAn3dGC4kdp30PIsE7gt7OHSmRk4CdonUM+z+O0NApsjfV7Y0hOGzxGAJIHK+EfbHVOYFRoDGE1JQui3et4oogK7rMfJPmGKXLEKHUPLt+n3CbGUHthoZux6vEF/7xMwOK27MrXf1ZyRlZtRjJoiYUnXjmYY05woB+PNa6B2zS7qYQMKLJvvqIrvfPvIimBFRa+rtgvy+4jTEYhHOUyrD11967HjAqohsA6EX60UFdKPO8eSt4ZIfK08F57aDZ3pvrNOp+MsI9oFNpsOlBYaAbRt/jAsgUPk3F9nP+2nKBOb+HK3PZq1nP2uxT8OGEVWtFDzL2BsScIrsfaXahAOk+cfxmCBH8jph0yJQdOUhYasGdM7U4b0sM89xNPaNDv648QQzbCrTETrljT69IcNSesX6Ecyy1nxn1C2goqW0l9LPQEmFNSMvY5MWdDVyqD0Mj/QdayF0UxG34n4vKvYIjR7o6T34cjosjgHlowiD+kCSZHhmcijs/9H6TO6blgLD59rGxLGYb+vdwwtIhWZOp3rC+Gaaaz6MCC6wLJV0GxCNjTP+1h3b7SVwaAViApKFI9bEVt8gXT9BTQ1oQy1KOGUm6yIlDFcDYXeOgtbOE+IVKKVzA9BcNErbHEa/P/+urswal/uKvHAYiVvKgrJ2yi7IsO+ClNTeFsNdT/mt3F80v5lNV8RD+sqEiQJPxNW3c9Zmf52t2o3V
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(36756003)(5660300002)(64756008)(6486002)(478600001)(6512007)(54906003)(33656002)(122000001)(2616005)(38100700002)(86362001)(6916009)(186003)(4326008)(8676002)(38070700005)(316002)(66946007)(76116006)(91956017)(71200400001)(6506007)(8936002)(53546011)(66446008)(83380400001)(26005)(66556008)(2906002)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC18C9912B01C0448F98527967C2EF38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6390
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3c7bb96-5051-4bf3-add5-08d974485594
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QcNF6HM7Kxw4WHesrx4KEoO3A5xgca8eZabpEor5UTu1kd20gXKBLPOReW+9rynvgkjKUpKsbwdV/LYXZ0i50cHjAlmU1+frLdtEeHnCm9A8JktmY+BCc7scwZEbW2pdmXDi9dZJ94B7/mrtxerbBdsX8MK7TCz1sj34GjKlYV/6c41jdYgjBuTk8s7LZToFfNpy88duDwzoZOanep708axW+ehLMXFe77GtRmdEQ9Y02VUKSS15BnHgKFRFNw0Bky9SAeDifDqqF1aNuc8Dt7qVmDJ/KGupeR8ePoPQWe77ZLP0diJ7U/gzaxr7nnFtaMTrTgsqg5jfXrb/1ZnmXg34rCViFCe1vhLm8tQY0gnW2SSuSTofUaXpFpCkSNJA4tj44bMSwD60c2fMVsbwQjjmyQO42xsCdDZBlqYFJEnZTRGBD6EMc8YDxbtx5rbooFgxhu253mOjhf5zfTPU7gaHtc2VHCdMmoanGC1j2lmBZpFOK3pAW/5p6Hd1WiYi5ntYilY7XwSXliJenKV1yZPzMS/+CS6D4BAtvBkXBAl+TTfmPQeM4ivRvcv9wfJrhP9qXeRBcab0KVUX9/LxYj4f+cLnMFMl9l5TA+X4S0WbRqkzSDrUxjnvGXGCUJQ06Ph/1Vadvt0zilpsKZxKU3xM29+fQYveUQyD/gqsSL68bD6B4OBIYkvURF2wS9vvYolgncVSsCgWxFxkKJeOxTZd16qXQyIlhCs+wzFILw4yv0HB9xIN6cz75NVZrZbzEWKpx1yBaRZEMX1nTIYXf92Qw8c7ywmzKJ7kh5ssPXI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(36860700001)(5660300002)(70206006)(36756003)(8676002)(6506007)(53546011)(186003)(316002)(47076005)(83380400001)(33656002)(2616005)(70586007)(26005)(4326008)(82310400003)(336012)(2906002)(86362001)(478600001)(6486002)(82740400003)(81166007)(6512007)(107886003)(8936002)(356005)(6862004)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 10:47:16.7170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0372bed3-2d86-40a9-97d8-08d974485b4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5709

Hi Julien,

> On 7 Sep 2021, at 9:20 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 19/08/2021 13:02, Rahul Singh wrote:
>> pci_init(..) will be called during xen startup to initialize and probe
>> the PCI host-bridge driver.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
>>  xen/include/asm-arm/device.h |  1 +
>>  2 files changed, 55 insertions(+)
>> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
>> index dc55d23778..d1c9cf997d 100644
>> --- a/xen/arch/arm/pci/pci.c
>> +++ b/xen/arch/arm/pci/pci.c
>> @@ -14,13 +14,67 @@
>>   * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>>   */
>>  +#include <xen/acpi.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>>  #include <xen/pci.h>
>> +#include <xen/param.h>
>=20
> This include doesn't look to be necessary (yet?).
=20
Yes you are right this is not necessary .I will remove "param.h"
>=20
>>    int arch_pci_clean_pirqs(struct domain *d)
>>  {
>>      return 0;
>>  }
>>  +static int __init dt_pci_init(void)
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
>> +{
>> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
>> +    return;
>> +}
>> +#else
>> +static inline void __init acpi_pci_init(void) { }
>> +#endif
>> +
>> +static int __init pci_init(void)
>> +{
>> +    if ( acpi_disabled )
>> +        dt_pci_init();
>> +    else
>> +        acpi_pci_init();
>> +
>> +    pci_segments_init();
>=20
> Shouldn't this happen before the PCI initialization?

Calling pci_segment_init(..) before or after PCI initialization will not ma=
ke any=20
difference as this is independent call. Anyway I will move the pci_segment_=
init(..) =20
before PCI initialization.

Regards,
Rahul=

