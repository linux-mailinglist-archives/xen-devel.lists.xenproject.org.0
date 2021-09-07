Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47140280B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 13:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180869.327725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZdc-0008Mn-L0; Tue, 07 Sep 2021 11:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180869.327725; Tue, 07 Sep 2021 11:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZdc-0008L2-Hf; Tue, 07 Sep 2021 11:51:40 +0000
Received: by outflank-mailman (input) for mailman id 180869;
 Tue, 07 Sep 2021 11:51:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qx60=N5=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mNZdb-0008Kd-66
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 11:51:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2959572-0fd1-11ec-b0ea-12813bfff9fa;
 Tue, 07 Sep 2021 11:51:33 +0000 (UTC)
Received: from PR0P264CA0251.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::23) by
 DB7PR08MB3676.eurprd08.prod.outlook.com (2603:10a6:10:4d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.21; Tue, 7 Sep 2021 11:51:31 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:0:cafe::35) by PR0P264CA0251.outlook.office365.com
 (2603:10a6:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Tue, 7 Sep 2021 11:51:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:51:30 +0000
Received: ("Tessian outbound cc1d52552731:v105");
 Tue, 07 Sep 2021 11:51:30 +0000
Received: from b8a882c627c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79EECCEF-83AE-41BC-B5C3-3921D7D635D9.1; 
 Tue, 07 Sep 2021 11:51:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8a882c627c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 11:51:24 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6495.eurprd08.prod.outlook.com (2603:10a6:102:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 11:51:23 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 11:51:23 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0360.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:51:22 +0000
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
X-Inumbo-ID: f2959572-0fd1-11ec-b0ea-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXbgVi4E/l2ZD/q5CGFs38xQTqeIroaeLOOfdmS8cYs=;
 b=7WdKlKsnRA7wl/zP/nDSoYJr3eIvmQ39bTIpktYzCbPwSPj5AHZFkvnxFCZMFxQTVph8ziZNLsujmsrdOz4cxe6kX8hBzoui3BEWfTdUIt2/iCKth4s7ZF2kLT0c6IlPxzTaQVdR8MPwRPjyGucGu4/xqdnLTM8/dkltyooXx08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1291435db9ea3fac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEtMWMnpKSDwS1L7TybOURvfYta4G4YJGWTL8GuCXdsaZaCMfj8l39w8bKGVmbfGybAy/y4h1qKK875ion+qsFOddbmcV/VghnW6YWSCaeENWE0jWhM5GZEhmChK6q2M1Q9Ls36d2UNICb5M3bHMhYaZtrRqmlaGHx5DPqrJXDDznhdJ6Qis03fYzDM00CwbdsXHucukIle6vogzxnsRQ1GWv7SDDVb3kvtr/yrS9Af4TdxMHxWfTCAs8oRRiRACpMYb/4+aZ7tValP3itIm3CHbqVVGb3lo0pIbONos8OO3z3TWgXWHhczCKQTewHUswsquhhzadhawbdJQD3Aipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YXbgVi4E/l2ZD/q5CGFs38xQTqeIroaeLOOfdmS8cYs=;
 b=HNwMuNHGBr4f2073O/9E13JP+WrZwJgKCHrkjKlETechZbtL+obddVK04Scn8L/bCYcYUah6w0zXUXZtB8PlDHaXJ3B0RyaMMBmHKGNTQoagtxZEwW1rhDboqaakSVZW82Z1vVs0K1jyj0OtffJmHAeMVipSynGjr/5RMbH2+KQ0jCDDKtHaPmmj6HbYpm6nohjswyM5R2QLNTc7Zc1xfSlO+i863XUhChMM7EkkeLfZbfK+hLR/0eMj0WNYUQuGqSqbs4TaPNeP1W6C1ojNr0s+iGikPi0QOyKGJFi7TPG73RAnZNqW9n73Q7aHLGYaS7cuwmmuCB3NF6dbxdPKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXbgVi4E/l2ZD/q5CGFs38xQTqeIroaeLOOfdmS8cYs=;
 b=7WdKlKsnRA7wl/zP/nDSoYJr3eIvmQ39bTIpktYzCbPwSPj5AHZFkvnxFCZMFxQTVph8ziZNLsujmsrdOz4cxe6kX8hBzoui3BEWfTdUIt2/iCKth4s7ZF2kLT0c6IlPxzTaQVdR8MPwRPjyGucGu4/xqdnLTM8/dkltyooXx08=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
Date: Tue, 7 Sep 2021 12:51:16 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0360.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::36) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0f3c566-314d-4f1e-0341-08d971f5d551
X-MS-TrafficTypeDiagnostic: PAXPR08MB6495:|DB7PR08MB3676:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB367639A2574DEBEFE656E296E4D39@DB7PR08MB3676.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B6pcdUoi3zrAbyZl01n4VcVjdoctCxnIA6cQDfPj3nmQZiYC0JayfC9WERc1H7XAE14/vN1rL7db54c2TdKhxLbzVKYgBtNE7aY0RYgsNHP2yYOIgPEqYqc2KHbe0wCT84o00tHi2qvpHl6CgBhTGPpNZ1Qp+WfzCZUcYalnAJsOQzEtfDcgb7E/93krsrDHpyb4FRDRgs6ZtPK9LbT1uI5EpYmhNT5IYg6M8pmheYmdreVRV6RWuGzKecTIYdppvUtGWLdbJWOVtkf7+Xwn/C7N3wtEMWqQJRhnqz0lVmpssBm896rfhI6dIWd5z543DlgCFqtuf6qeCSIiZW/Iv66X6xyZWp1xOx4x+WMF65Bo3ATuntDM4yNIytPAD5nkzKzP+YWJWuQ097ZAOxaHTn6yKUQwVPvvLHYtHqNtqC7Y7aNX0YMqM773T/BYktzCxTfgcT9YHILhhn1WrTrysK6XL9+ulQ5+tq8nh4F3Dfr68vBLeq+9BrMbwL+E3t8SrHphtoyQQKCODgoEQGZcGEKpNhsYbkrxh4Jg5UJ3RVQ8RXVAp0UBGbaHLF+l5RSNBbbRML1E8pYolC720y3cbCeiAcVlPT+PfNQT8NsWp23/KczmK/i7/ZCxNUHuUCdPzgwZRJjoqGLCCk9DQYXc3IElaa0K5PztB+w4/hYXZccqzkophR2F+LL/G8WsTmh8Yzj5bwET32Ubjl1OmZA7PaOY9xclSNLeHDtP16i04iGzOIRnFok/qCUNajP3XeflD/c01W0UoWrotUL65p8gDg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(6666004)(26005)(186003)(6916009)(478600001)(36756003)(86362001)(6512007)(4326008)(33656002)(2616005)(956004)(5660300002)(316002)(54906003)(44832011)(2906002)(8676002)(38100700002)(38350700002)(66556008)(66476007)(8936002)(66946007)(53546011)(6506007)(52116002)(6486002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6495
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88256cac-c7e1-4d16-4b29-08d971f5d03a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	08Q23tub5dfGLpkAAd8Lc+DPNN1iVXOdKI+u1nZ/oAk9kVuPVRVTBUQFU+Pseklt42FpWGE8Q2yya+tOPIKnKuti3n3h6Af2YMl9n3UMlNMz+Ym4E+M7KiBK3HRGqM6/ULuq4OpRqR6lqLrpXKsfN1wv//uAgpSCyEMwi9M2x05X+MQeFXVeYScHSaPPBE7729M3xkc5/T4RznvXkbmk8ryAyoGek5qrkb7pW6IbCeJTAKCaIm2dSt5ylUDOrD5hD78KU58yVwjm76okDPv2iapdoiUwBlqzXUnkQo9qJWL0avPYKW8t10qw/UgwQA5+QERNifOyoXQyQoYDTl68owIr8P/35Cffflj4NaCj7GzMtnUhIPMW5sPrqV7iCZ3GBzQ2PffMZAAuYMNyzV4xTRvaTm2x2tcatr5tfSxHFby8QFDfVj20GZsAoEuAgeEbK48QtPRi+cfuVblhWoH+YbYdZDQBJhPyLXztHzNLAufKPBnsf2KvwYMXfGfGfIZMFDAXfVhLqRwpM7RNFWvRum2t/yW6LO0146KxMzsJ+7j3p0R7CHctZ6A3OssgjvY2DOQOT/89EzYdfVfxURXvhBf8kwsP8ek8eLpI5FZhyt+fn1Pu3pApvJVhhYc9eD6xigiknftFOcBr1gLtn3rYSbVMFtuMwIXIWa2x9Joyniob2hSAdjF3AYWbFprqXv9cj4o4iuXxlUG2QCzydD0AGlFxzzdpXNaGkHY1obBNz30=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(46966006)(36840700001)(44832011)(956004)(478600001)(336012)(6512007)(33656002)(2616005)(6862004)(8676002)(186003)(6486002)(70586007)(70206006)(82310400003)(26005)(6666004)(53546011)(82740400003)(47076005)(6506007)(86362001)(36756003)(4326008)(54906003)(2906002)(356005)(81166007)(36860700001)(8936002)(5660300002)(316002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:51:30.8328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f3c566-314d-4f1e-0341-08d971f5d551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3676



> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 07/09/2021 07:52, Luca Fancellu wrote:
>> Add a design describing a proposal to improve the EFI
>> configuration file, adding keywords to describe domU
>> guests and allowing to start a dom0less system.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++++
>>  1 file changed, 105 insertions(+)
>>  create mode 100644 docs/designs/efi-arm-dom0less.md
>> diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-dom=
0less.md
>> new file mode 100644
>> index 0000000000..8d8fa2243f
>> --- /dev/null
>> +++ b/docs/designs/efi-arm-dom0less.md
>> @@ -0,0 +1,105 @@
>> +# Xen EFI configuration file
>> +
>> +The current configuration file used by Xen when it is started as an EFI
>> +application is considering only the dom0 guest and doesn't have any
>> +property to describe and load in memory domU guests.
>=20
> From my understanding, the problem is less about properties (we already h=
ave them in the Device-Tree) but more about where are the binaries located =
in memory as we don't know in advance.

Hi Julien,

I think I used the wrong word there, I meant =E2=80=9Ckeyword=E2=80=9D inst=
ead of =E2=80=9Cproperty=E2=80=9D because I was referring about the
lack of keywords to describe a domu guest in the Xen EFI configuration file=
.

I agree with you that on systems with static allocation, the kernel and ram=
disk binaries must be at certain locations
that are out of control when we use the EFI boot services, the thing we can=
 do is provide a keyword to specify the
addresses and then use the CopyMem() function to relocate the kernel/ramdis=
k in the address we want.

>=20
> So I would like to propose something that build on top of the Device-Tree=
 work we did. Note this is early thoughts.
>=20
> The problematic nodes in the DT are:
>=20
>        module@0x4a000000 {
>            compatible =3D "multiboot,kernel", "multiboot,module";
>            reg =3D <0x0 0x4a000000 0xffffff>;
>            bootargs =3D "console=3DttyAMA0 init=3D/bin/sh";
>        };
>=20
>        module@0x4b000000 {
>            compatible =3D "multiboot,ramdisk", "multiboot,module";
>            reg =3D <0x0 0x4b000000 0xffffff>;
>        };
>=20
> In particular the property "reg" cannot be known in advance because the U=
EFI stub will be responsible to load the binaries in memory.

Yes that=E2=80=99s true, the UEFI stub is using from the UEFI boot service =
the AllocatePages function that is giving back an address out of our contro=
l,
then using another function the binary is read from the disk and copied at =
that address, finally the UEFI stub is writing the node in the device tree =
that
will be used by Xen later.

>=20
> What we could do is providing a list of binaries to load and associate a =
key for each of them. Something like:
>=20
> binary=3D<binary> <key>
> binary=3D<binary2> <key2>
> ....
>=20
> We can then replace the property "reg" with a new property "uefi,key" tha=
t will contain the name of the binary.
>=20
> What do you think?

Here I=E2=80=99m lost, because I don=E2=80=99t understand what we are going=
 to do with the name of the binary.

Cheers,

Luca

>=20
> Cheers,
>=20
> --=20
> Julien Grall


