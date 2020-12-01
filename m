Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874442CA1AE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 12:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41856.75349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk43h-0001lN-07; Tue, 01 Dec 2020 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41856.75349; Tue, 01 Dec 2020 11:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk43g-0001l0-Rx; Tue, 01 Dec 2020 11:43:00 +0000
Received: by outflank-mailman (input) for mailman id 41856;
 Tue, 01 Dec 2020 11:42:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dt7S=FF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kk43f-0001kr-6z
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 11:42:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce46dd19-659b-4ca8-8c4f-a87b3e13be48;
 Tue, 01 Dec 2020 11:42:58 +0000 (UTC)
Received: from DB3PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:8::34) by
 DB8PR08MB5082.eurprd08.prod.outlook.com (2603:10a6:10:ec::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.22; Tue, 1 Dec 2020 11:42:55 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::f7) by DB3PR08CA0021.outlook.office365.com
 (2603:10a6:8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25 via Frontend
 Transport; Tue, 1 Dec 2020 11:42:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Tue, 1 Dec 2020 11:42:54 +0000
Received: ("Tessian outbound d6c201accd3c:v71");
 Tue, 01 Dec 2020 11:42:54 +0000
Received: from e2e1f31a7dca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F59A5E5-A5C6-4304-9B78-3FF0416475EE.1; 
 Tue, 01 Dec 2020 11:42:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2e1f31a7dca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Dec 2020 11:42:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Tue, 1 Dec
 2020 11:42:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 11:42:47 +0000
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
X-Inumbo-ID: ce46dd19-659b-4ca8-8c4f-a87b3e13be48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIOOQ/imLr5HgpYZ1fL2CY0xohUVU/AwB1bge8XGEII=;
 b=9O1ltqiLA7Xf041On5qsOieA20KY80sgy8RXcmiMWCTALavU6jm8ifv6XUj+li6i/olP+JjU0DvcsgH4GWTu1QL3rqU3A0fMvdpTvePHSM5MZa5rnbyLF5GwBJ8nokkwVNp5x9PGdkH/yszxjHPesQ3WFar4l+TsVgAumNp+5lg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6eb451a31a243c7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNWMOIbmj9aWoHyt7SjKwlyhWH8lji+zkMDv6ktD/tSM1gWZWAy/egjlDMKmyWaO6sMdQgTUOHobyS8inpRtr4AxJGz4+QaV5eZNFAQU0ZTQn7num4IJ/L4/5Qpzs/4o5tL76WggV2+XHjy5AwVF2SG3R+v7DbvHc7fI++sLW9kmYxLCkcaguf0QhnWqyumKwdrxoef0fttI5R8YsT1qWfzPHPRg3gpJIGwjYhNtp2OzuWJ5yG16fkYzlyHNNcNt1NAIaY6EKVYyPwdPVeu3RdF20nYgBtUnQiSVZzpNnSlIeMgQp80fVVghYnEngop8ujdSd0JvQ9N1qbHS6+9BsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIOOQ/imLr5HgpYZ1fL2CY0xohUVU/AwB1bge8XGEII=;
 b=ifI6Kzj772L1vsGaKuEtEb0ughCPZLwfIR4oBd/3q+ecnqnq8y2URZvehDlPC/QdzM9aA4z5yHCblxkTdo4/bWaDHn+1JIgGvksp9Nkp3ip+6796P2X0qeR6VT7BZpLCR/S/+HwM1idGhLX0dEqIqNMb/hA9yskF57Bp8V9XC+33xwLKAlxCKFIM9P+oa/ImCctbrCmU+Cp3s0kaGYZz4eyXyZHAJbW0MSzZaQ4QOBeuhop8n9VR8ypqQg6lWT1NAdlUuhJY/OkFXVyEkrntkjioZIKUuggyN0O0WDBd7PYbJgM6mxqUQ+CZl8yIH6H+b3wdI6oUrqsQ2dlyI4fvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIOOQ/imLr5HgpYZ1fL2CY0xohUVU/AwB1bge8XGEII=;
 b=9O1ltqiLA7Xf041On5qsOieA20KY80sgy8RXcmiMWCTALavU6jm8ifv6XUj+li6i/olP+JjU0DvcsgH4GWTu1QL3rqU3A0fMvdpTvePHSM5MZa5rnbyLF5GwBJ8nokkwVNp5x9PGdkH/yszxjHPesQ3WFar4l+TsVgAumNp+5lg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Topic: [PATCH v2 4/7] xen/arm: Add handler for ID registers on arm64
Thread-Index: AQHWxyRh5FtYFTYJ+ESi9Xe847KlxqnhHqgAgAEBOwA=
Date: Tue, 1 Dec 2020 11:42:46 +0000
Message-ID: <C561BBE3-796C-4A29-B24D-188D792757CB@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <6db611491b25591829b9408267bd9bd50e266fe2.1606742184.git.bertrand.marquis@arm.com>
 <87pn3u7fyp.fsf@epam.com>
In-Reply-To: <87pn3u7fyp.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa69a774-83fb-4871-fd6c-08d895ee3e16
x-ms-traffictypediagnostic: DBAPR08MB5558:|DB8PR08MB5082:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB508202EA628305FD5BAB9FC79DF40@DB8PR08MB5082.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FlJelYZEapVTbea0Fv0VjlmRq+IbYNkzS6/4f9KeDlX31oRth0uR6/wKJyCEKJB0a3Uqic5Ij7u0IM1CXLAk1Vizk1q+iQ1e0INijPckbVhz24+TC+fEiEXawkXc+G3zCzGhHa4NdJKQ8goDCr3tsGr2sJbKfMSpAWfarxyoAP2ObScKI192PCQRObzy5MQxS783yv32QfSGBFhMqvVSfQ7n1c9uU/uMecObyzGM4SjokGAk2wSfOSXuzT7gGv75RSawj92rSJTPpvetfAFKmWNPY4h4ZtUsUtMiddBAwpLPDdg9TDLOocJXV4V5uPpFeqhm70/6tVV5/AX97vgAzA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(66476007)(6916009)(66556008)(91956017)(6486002)(83380400001)(86362001)(76116006)(64756008)(4326008)(5660300002)(66446008)(2616005)(71200400001)(2906002)(316002)(6506007)(66946007)(36756003)(6512007)(186003)(33656002)(478600001)(26005)(53546011)(54906003)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?7CMJD2+rgNlAmEd+mqDh1Mt7z6aU+IzCaoGllcLSwJk65j+o+TOF7eRAAVN1?=
 =?us-ascii?Q?6E0HGzYvwCV6ZS/Ze042IFbyNvmXqPwkwnke/40mlb9vZ+3wGTOOAhXTCRTR?=
 =?us-ascii?Q?i2onpljfCUwVrQZp1ygjOceh91bIab6knKaPjWrSJb/PNYdHMdI6IweidxOR?=
 =?us-ascii?Q?BA35AlH62z6IZyowfiNRNOvnhYrVjrOZRC4tkUnieDnYH3n3c4pmGWa+TWb4?=
 =?us-ascii?Q?TxngmHWsROJwIhoGHlfoKNbR9snTJEmNnk7cUBnUtAHHET4p0vWLfZUbT7/Y?=
 =?us-ascii?Q?T88DwQQk/UBOS7Q892vy49RE3kxwKolcYGQo/QJEtAXoe4RRhF5UrpWXIW3w?=
 =?us-ascii?Q?C6MPQ4KsuK5NJDpRZZz1BfMbLviq0N7zqvWIpuIngtvvM7k2k2MAET0ATOkE?=
 =?us-ascii?Q?NxsybP9suDOf5tPAN54ZYWEBoLSD8UFYKXLVY5p//dbr82pXZOX0gXdalttF?=
 =?us-ascii?Q?aPrbP/IlDWo6+5zdt3NW6hbA+3AITJYtdF/COMEakRuZJ/13ZiwYSyPimzbY?=
 =?us-ascii?Q?7fig3YmkrjtizTJ2p2Zu2Y8tMzpbSNdD8GBvzBmZBb5/zNVJrRd/DjIISVv1?=
 =?us-ascii?Q?3JSyXXu2IXxWiKCHrPJGoIxa/aGCKB1BlhfHCbrqkMEZbbgUqSsYJ506Gbjb?=
 =?us-ascii?Q?vZSWPYn0580ouHY+tqE4jkIjr/lN6uBO1Cfbm7QWkgYMrOQoTLQgHHjMStZm?=
 =?us-ascii?Q?63v4+UVDJ57QaDB5ot6YfiMt9/k0zkvwnRmFSz7c+OAh6IYED57N9j1IEhu8?=
 =?us-ascii?Q?XmLv7vCFVxj5sWkHvv40EnOf7d24cH3A1+8VgXGbBH7AlEnhebhfSPQZIaVS?=
 =?us-ascii?Q?3poxTry93whppYeF+xjch7Vn0B1/IluVSd9dX9zHHd4v4SvHtIJGd+6oL53U?=
 =?us-ascii?Q?EHxmaOMcJhe9hVMhJ4N7X5g3SLswULWgqz3u3s4anmGG1ruRXMqqGbEO1ueR?=
 =?us-ascii?Q?ElCX2FhxuDylH933xqnGR+Y+ZMr1//SODH/qoqE/9+dVHrCIvM3NCD4XZatR?=
 =?us-ascii?Q?k/fs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DD8BCC8FDEB644BB2EECA334B020D17@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f51460f9-5be8-41f4-aa61-08d895ee3968
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZkHVxQOQcrQc5fK3i615VYRSNlJWCBwpjwHjogSJ88U2TeM8c+gjG77J0tEGopJLHWfydLLjwv0TQRo70LCSP5f9wLZupsA+RQHpp/GyuploWfBnasrx1HchH1zXE4JTw4v7qkFZPu10at6BncucJhsN365mE9nW5jVYUoeQOAaBFzlsnRqP+wZtCudR1r4mTYx/maL3LkMUsbKDqsWtLFIGT4ohczyY1+yHXVoxXncNuvEjG1g/nlS6PSeE6CoLrwQqPg8aY9q3TIevPgXc8WcqpZR0uFzyn6yCBmORR5ep0DKSjcn3pLcol0+wbFHHPAqadzqbyNLGaceWShNGRZ0F+9tRDGtIinBFsfhKcCLB4Fh6AkNekXsuKoZu/YyERp7StZXMaMwXrLUt1zVzxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(6512007)(336012)(356005)(8676002)(36756003)(47076004)(70206006)(81166007)(2616005)(5660300002)(2906002)(26005)(4326008)(8936002)(6486002)(6862004)(53546011)(186003)(70586007)(82740400003)(54906003)(316002)(33656002)(6506007)(478600001)(82310400003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 11:42:54.9314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa69a774-83fb-4871-fd6c-08d895ee3e16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5082

Hi Volodymyr,

> On 30 Nov 2020, at 20:22, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> =
wrote:
>=20
>=20
>=20
> Bertrand Marquis writes:
>=20
>> Add vsysreg emulation for registers trapped when TID3 bit is activated
>> in HSR.
>> The emulation is returning the value stored in cpuinfo_guest structure
>> for most values and the hardware value for registers not stored in the
>> structure (those are mostly registers existing only as a provision for
>> feature use but who have no definition right now).
>=20
> I can't see the code that returns values for the registers not stored in
> the guest_cpuinfo. Perhaps you need to update the commit description?

You are right, i modified my code lately to handle all possible registers s=
o
this case does not exist anymore.
I will update the commit message to fix this.

Cheers
Bertrand

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: rebase
>> ---
>> xen/arch/arm/arm64/vsysreg.c | 49 ++++++++++++++++++++++++++++++++++++
>> 1 file changed, 49 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
>> index 8a85507d9d..970ef51603 100644
>> --- a/xen/arch/arm/arm64/vsysreg.c
>> +++ b/xen/arch/arm/arm64/vsysreg.c
>> @@ -69,6 +69,14 @@ TVM_REG(CONTEXTIDR_EL1)
>>         break;                                                          =
\
>>     }
>>=20
>> +/* Macro to generate easily case for ID co-processor emulation */
>> +#define GENERATE_TID3_INFO(reg,field,offset)                           =
 \
>> +    case HSR_SYSREG_##reg:                                             =
 \
>> +    {                                                                  =
 \
>> +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,  =
 \
>> +                          1, guest_cpuinfo.field.bits[offset]);        =
 \
>> +    }
>> +
>> void do_sysreg(struct cpu_user_regs *regs,
>>                const union hsr hsr)
>> {
>> @@ -259,6 +267,47 @@ void do_sysreg(struct cpu_user_regs *regs,
>>          */
>>         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>=20
>> +    /*
>> +     * HCR_EL2.TID3
>> +     *
>> +     * This is trapping most Identification registers used by a guest
>> +     * to identify the processor features
>> +     */
>> +    GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
>> +    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
>> +    GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
>> +    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
>> +    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
>> +    GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
>> +    GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
>> +    GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
>> +    GENERATE_TID3_INFO(ID_MMFR2_EL1, mm32, 2)
>> +    GENERATE_TID3_INFO(ID_MMFR3_EL1, mm32, 3)
>> +    GENERATE_TID3_INFO(ID_MMFR4_EL1, mm32, 4)
>> +    GENERATE_TID3_INFO(ID_MMFR5_EL1, mm32, 5)
>> +    GENERATE_TID3_INFO(ID_ISAR0_EL1, isa32, 0)
>> +    GENERATE_TID3_INFO(ID_ISAR1_EL1, isa32, 1)
>> +    GENERATE_TID3_INFO(ID_ISAR2_EL1, isa32, 2)
>> +    GENERATE_TID3_INFO(ID_ISAR3_EL1, isa32, 3)
>> +    GENERATE_TID3_INFO(ID_ISAR4_EL1, isa32, 4)
>> +    GENERATE_TID3_INFO(ID_ISAR5_EL1, isa32, 5)
>> +    GENERATE_TID3_INFO(ID_ISAR6_EL1, isa32, 6)
>> +    GENERATE_TID3_INFO(MVFR0_EL1, mvfr, 0)
>> +    GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
>> +    GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
>> +    GENERATE_TID3_INFO(ID_AA64PFR0_EL1, pfr64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64MMFR1_EL1, mm64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64MMFR2_EL1, mm64, 2)
>> +    GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
>> +    GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
>> +    GENERATE_TID3_INFO(ID_AA64ZFR0_EL1, zfr64, 0)
>> +
>>     /*
>>      * HCR_EL2.TIDCP
>>      *
>=20
>=20
> --=20
> Volodymyr Babchuk at EPAM


