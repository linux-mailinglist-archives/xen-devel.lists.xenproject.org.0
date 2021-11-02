Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172CE443485
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 18:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220460.381740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhxXC-0001a7-2N; Tue, 02 Nov 2021 17:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220460.381740; Tue, 02 Nov 2021 17:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhxXB-0001XH-VF; Tue, 02 Nov 2021 17:25:17 +0000
Received: by outflank-mailman (input) for mailman id 220460;
 Tue, 02 Nov 2021 17:25:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zwst=PV=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mhxXA-0001XB-TJ
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 17:25:16 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7a37912-3c01-11ec-855a-12813bfff9fa;
 Tue, 02 Nov 2021 17:25:15 +0000 (UTC)
Received: from AS9PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:20b:463::12)
 by AM6PR08MB4311.eurprd08.prod.outlook.com (2603:10a6:20b:b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 17:25:14 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::1d) by AS9PR06CA0048.outlook.office365.com
 (2603:10a6:20b:463::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 17:25:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 17:25:13 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Tue, 02 Nov 2021 17:25:13 +0000
Received: from d0e6291d8e3f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C42236A1-18E6-4AAB-927F-6939A5F0C915.1; 
 Tue, 02 Nov 2021 17:25:07 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0e6291d8e3f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Nov 2021 17:25:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5952.eurprd08.prod.outlook.com (2603:10a6:102:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 17:25:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 17:25:05 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 17:25:04 +0000
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
X-Inumbo-ID: d7a37912-3c01-11ec-855a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgGEOf2yrrWlWZ4dCBkN+ubidTyXthqjZaIJs0xrf/8=;
 b=+De0jmJCTuJaZl3uAFbx57Sgzdz6DxdV3yoY04UPfPePgzax+aseH1MpLmsqWfWQLnJu2y3fZhNes9+k5A0njeTGKzNTSO7RijrQx9iZX8HnMzx49Qh18BBqeG/NG/2eg7NSubDcVFC9A6a9oS11+r59GXRGl8lBnTYFIH/D6As=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83d5bdb0efbf4c47
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUuU0vudO60TFWEoc6hoikGP/fhCQ6P10sA9JnWyodOlaayGMlmTlKSaHUDaVg4H+XGnP9ooF4IJWT/Qve38O2yFxizrEIyOLNtiOKa3UkPJfAIyCx0ufguAgLzL2BGMeVE/gjIbq2VrVbX5Pt2wcEXRCRA/IO3VQNG548UrrBlHG7h1SHOnv5saJ39NBhG8T5bKUbE4282PPHgDcrO0u4fyqMcBHSxO+8DN+IiLAF2X18HMEy5WrTCcbqJsVPr6hQ69tYsdRMBgZurZUjJq5Z4nP4FU+cPKZico8n6R+TV7NTK2MDRV3aGlRARr0Ghpf8PZWz3RFmNM7EDm3U+WdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgGEOf2yrrWlWZ4dCBkN+ubidTyXthqjZaIJs0xrf/8=;
 b=nSTjpmEugWFJZim4oXun088HU2KlTe5X82hdn8W4VF26G9wjH6AqdP/laB6pRThY8zeGUo4h8sWvng6A+ZdCQsxzEEzdtSHtjLMP2tor1zxU/9vS/sXxgRqKKHBoJBdbbPeW7PKA+LcFZSacT7/UdsjWygInjav/JaEzTEBXz1lBxgFGHyJ541vTIL5Gy+K5yUbl4z7f5SR9qQxJqKqofsvf1+4KOiGbwZ8Y5rxPpM+ZUZ/+bEIb6R4WeijyDvWv/nQxjjq3K/+2dk0//O12QHPAqD+IGXZrJqXPoyFrJEFIbpsytJIGl3P0IcoFZQuKwBA7bagYrmh6QV3F/sggkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgGEOf2yrrWlWZ4dCBkN+ubidTyXthqjZaIJs0xrf/8=;
 b=+De0jmJCTuJaZl3uAFbx57Sgzdz6DxdV3yoY04UPfPePgzax+aseH1MpLmsqWfWQLnJu2y3fZhNes9+k5A0njeTGKzNTSO7RijrQx9iZX8HnMzx49Qh18BBqeG/NG/2eg7NSubDcVFC9A6a9oS11+r59GXRGl8lBnTYFIH/D6As=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
From: Luca Fancellu <luca.fancellu@arm.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Arm EFI boot issue for Dom0 module listed inside subnode of chosen
Message-Id: <8A60FA62-2BAA-400B-BB53-AB3E8CCA67F1@arm.com>
Date: Tue, 2 Nov 2021 17:24:59 +0000
Cc: Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 wei.chen@arm.com
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0402.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::30) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7b2d6cd-8112-4d03-47e5-08d99e25bb01
X-MS-TrafficTypeDiagnostic: PA4PR08MB5952:|AM6PR08MB4311:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB431197DF56A5A321F5DF308CE48B9@AM6PR08MB4311.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nWp3hUQ+Mir0xM3zuqF+SkNFify8jsvHGZbn8qfWeUozwIwjNlLHMCPiv+XM/A8EXXkGIJfQt8yBY0Pxrr6oDUTZdmIIk8IKzTD1t+torAfpwPoyDPw/esxrNBLzyYJl0TMt8GbCf+1nrapLYLR3maD0mt+0NAoLjDAmnRQ79+HburwCc10gqst/9JkaBTfzuqKolOqSBF6xBmhAy3rqWZJ5evCB2FYBGdMJVr6AooDL7dp0UmPs9HbA1dttwQQXEaEA5IxjaTDOvvlRX/BOZBxvaOjLtrHbCYc5/R7xQTdTaikWge2qLxb6VdUS6Ec5QcLCsuBZHeC/cU7wtOze7NWB9lD42NkNM745f4lDzuNJEaRxHCmdUZxEaI/YMrQ3pMS57piFZXrVXapTMlJ+8r1rjCmr8Pf9KFUJoWtqfFDMTnU3ZSJiA7C9zsgvG62XrdOTKTyqyemRe8Kwal5P2eI/h4dJEgOHJaoNLyBkMsGiiZasMBn9pUpEPGeApqmiDO3yoe8AfMzNqthFSgDEfza3FDUPVgshkct1OSLcVkPP4hanDeS5Q+9S9kSeVdMVYDVpaZWPpHs0t1DK4BHNHQMVM6AaB3yb0cmDSbOhQkIDvVj5Mc6cec7zTtxXVssvTJoEwWG89vLUX9Aw9BFt6cwwshjl0sZUIFF4IgeNhoVY6nijS1ksvmsBsmgv+YHnO5f0XZnh+GUtykttCe4y9Vnc1J76NZWD88p02NIqqYGXzKuoNG2twXnGMxmnpUHFsNN6Jo7eqxcf8JxXJr0yoQe3JcaagfegnX78C67iSy2sM4VFDmpKwzZHovaigyWFlUo7ypotYMl9wi63+QH0wgS/+H2EyiXEvyMjnvCo7og=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(26005)(6506007)(2616005)(2906002)(8676002)(44832011)(5660300002)(6916009)(66556008)(66476007)(966005)(83380400001)(956004)(86362001)(316002)(4326008)(186003)(66946007)(6666004)(38350700002)(38100700002)(33656002)(6486002)(508600001)(8936002)(36756003)(52116002)(6512007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5952
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64b78c31-99cb-425d-5722-08d99e25b5cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GR2lMkmJ11krEqJi9rfwfY9hBUJ6gNcHdEE1uWGQIbc73zq8CSO5vTuly6qYUg5oZoYNNXds4Uiq/E6MvoA8ME88I8xZrHX2/QL9Lw3sJIumXN00HxX6nLNCKXj/fPy+7Ket5SUBsap1/peEoyeKqo5gGqaz6ds/m7w6KVFga3cbhlUks5ylyuYVsfJqH7mGvdT5n0jk0RgHCNMtvGdo95FRCstjdY0Omc4vvoQcbSNNJfEcNqvpvcExNaRLZlQ32zxh1Ner96kuUXWcMaWQ8lik98SSYPBIIugrw9mjm8y7iLWNA44PVJanufuRq1vIha3TsjxzpuWaDnpTx0KbxAsARG0Uh2SIvqOtmoOsnxEeMHTEzGQFbcfKd6frALCRpT6dQMfoTQHWQwCp/zgiWkuZllJSXpHxY8rcloROyGcc6LkF3DZ0wuuOviKpRKGAVs6zxFA+KrHMW2SzzFFuy8qrWJyMP1SlPcPutLH26hX4B25hWCCACDO/XaBga994M7pFUDGM4ujQqs782aJkYfImX5npR7ZwT6d8gPpFzQHjF1F77x10GgaaIXF7hN9d7FW9NAafn70Qvu2UkdS8w072Xvogu5qJtx5KIIA2HXEdRlBEt3ZgAwXDOB9FB999WdOid5z+an5Kb2Hz55OJApqv6j0VBWIBrdpw83fBndeZdOqUBMVmMxZKt7H28hoN792H47x+uxqE/p2mNfWsKDV/t5DeEPL/iPqqD/+CvKlvX5et/iABJat2uKq9LJmIbaWjQh2Vj14Xq38kLGNoYuqzE/0iHQGEFGwVoz3+2klrcVfsZH2fzdugrP8pxfMnKATfSBnl22Tgg124BTkf2A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(186003)(2906002)(36756003)(6486002)(26005)(5660300002)(6916009)(83380400001)(33656002)(4326008)(6506007)(6666004)(6512007)(81166007)(8676002)(54906003)(70206006)(966005)(336012)(8936002)(44832011)(956004)(356005)(86362001)(70586007)(508600001)(36860700001)(2616005)(47076005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 17:25:13.6839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b2d6cd-8112-4d03-47e5-08d99e25bb01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4311

Hi all,

We recently discovered that there is a way to list Dom0 modules that is not=
 supported by the EFI boot,
It=E2=80=99s happened browsing some Wiki pages like this one:
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Lag=
er

In that page the Dom0 modules are listed inside a subnode of the /chosen no=
de:

chosen {

    modules {
        #address-cells =3D <1>;
        #size-cells =3D <1>;

        module@0x72000000 {
            compatible =3D "multiboot,kernel", "multiboot,module";
            reg =3D <0x72000000 0x2fd158>;
        };

        module@0x74000000 {
            compatible =3D "xen,xsm-policy", "multiboot,module";
            reg =3D <0x74000000 0x2559>;
        };
    };
};

Instead for how it is implemented now in the EFI code and described in:
1) https://xenbits.xen.org/docs/unstable/misc/arm/device-tree/booting.txt
2) https://xenbits.xen.org/docs/unstable/misc/efi.html

Only the following approach is supported, so Dom0 modules must be a direct =
child of /chosen:

chosen {
    #address-cells =3D <1>;
    #size-cells =3D <1>;

    module@0x72000000 {
        compatible =3D "multiboot,kernel", "multiboot,module";
        reg =3D <0x72000000 0x2fd158>;
    };

    module@0x74000000 {
        compatible =3D "xen,xsm-policy", "multiboot,module";
        reg =3D <0x74000000 0x2559>;
    };
};

Is this a problem that needs a fix?

Thank you.

Cheers,
Luca=

