Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF2748468
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 14:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559167.873897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1y7-0004O5-Qg; Wed, 05 Jul 2023 12:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559167.873897; Wed, 05 Jul 2023 12:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1y7-0004M3-No; Wed, 05 Jul 2023 12:50:51 +0000
Received: by outflank-mailman (input) for mailman id 559167;
 Wed, 05 Jul 2023 12:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cLSs=CX=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qH1y6-0004Lv-Io
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 12:50:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7d00::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 906736d7-1b32-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 14:50:48 +0200 (CEST)
Received: from AS9PR06CA0483.eurprd06.prod.outlook.com (2603:10a6:20b:49b::8)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:50:45 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::6a) by AS9PR06CA0483.outlook.office365.com
 (2603:10a6:20b:49b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 12:50:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 12:50:44 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Wed, 05 Jul 2023 12:50:44 +0000
Received: from 29feb8045175.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA9CD027-5B42-42CD-B11E-EF143E65577F.1; 
 Wed, 05 Jul 2023 12:50:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29feb8045175.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 12:50:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:50:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8f61:5b01:4db1:8363]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8f61:5b01:4db1:8363%6]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 12:50:36 +0000
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
X-Inumbo-ID: 906736d7-1b32-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxU1bv8hf79o9FM0D6C7G2JK7frg2Hk/AA2sHpts080=;
 b=jOboZZ2OGM48iHJowW8u8ed3ktAiX8C1b8ZA54GOfwlxyqeaEdsxb/Nubnv/4i4m/Dkvv1+bbrJYWT392T/VNSSi+aWfA36WYQlEN2xkh+1Wv3K5DpK/I3zoBmxAeDWwRUswnId1whLxKdpiHhNTS59uNve+g2vAcO4WkhtpWKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e2c3a50ea8dca21
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/JOKmI+lIUxUrHdAIqLlpBKBt08kep0Q0cTxRGMgIvacbJECvxS7MDE2FrrxUA7VRp1xeRVXFB+lGESJ3vJ849swb7mRXm8SpedDjYoL/kSb2dEV8PK7Phc1IcTkNlIjqSJFeXItcRmTNloko5A/RrB7ugRqf14p2ATSH2UvqkToycFFfwV/dX+qLJJCyvNLr73KgxbxU9IeMPdhNJ/6oosolqY6aIuQ5Ak2KkFPR9Zyb+BxgF+tWOorLu4/wnJYZOfh8se84RuETuG4+rOpEFERG4/8MEmXw861rbU1RgGqbIhoTpuh+9DrwjWAoy/0tyZZB10hRicqTeyjkroiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxU1bv8hf79o9FM0D6C7G2JK7frg2Hk/AA2sHpts080=;
 b=fEuHypBZC+T91QwynNq3XaNv70Y8CO1RL7k205WbljZM9tJUy4UB4o1ziBRhDd7siQcq4GhoaBadandU6EdB9QWOaj11v4xFbU1s4OL2BmrvQtFIAZxwK96DJ1bWmFE4YaypbbvdwE1CFX4GMqWcG5KORwWRM+j6ijCRbMcIGArOH7eXkecIJzAV240cZklpEC7/qfqagGK/nXfMwHx/ZbDHdPFAG9S2Xmcg1Hi3VY2kJYto2kR/LjywlYRHJaJMOZttl8afNhNo9VdWacfotw+3X5IQ7gJPMmCzRifmb3HRclD8NuFwJ4L3oMJwHmp8YaZiyyr6IHZrg+aUD2kylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxU1bv8hf79o9FM0D6C7G2JK7frg2Hk/AA2sHpts080=;
 b=jOboZZ2OGM48iHJowW8u8ed3ktAiX8C1b8ZA54GOfwlxyqeaEdsxb/Nubnv/4i4m/Dkvv1+bbrJYWT392T/VNSSi+aWfA36WYQlEN2xkh+1Wv3K5DpK/I3zoBmxAeDWwRUswnId1whLxKdpiHhNTS59uNve+g2vAcO4WkhtpWKA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Henry Wang <Henry.Wang@arm.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Thread-Topic: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Thread-Index: AQHZrzemFhjMGQXcTkKAEu+0mA/HSq+rE0UAgAAM0AA=
Date: Wed, 5 Jul 2023 12:50:33 +0000
Message-ID: <3C9C10E5-D5E0-4B4E-935D-80832BB795C4@arm.com>
References: <20230705115534.26004-1-julien@xen.org>
 <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
In-Reply-To: <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6588:EE_|AM7EUR03FT042:EE_|VE1PR08MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: fa38f0d3-cfae-444c-3472-08db7d567290
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vpkgcxEKLGNFbG69IFUA+PJOsX348qq8cq0/PZrDEdaSyoc3S3WrkFROXI4r/EtsM3YYROG9su6uRUXA9U83riox+E7nhOG+u9YjZNVQFSKG/M/CjS6RzFOV+fTacBj61gGUSNZF4rqwTie48Ob0GJWVV1wwpIfyYCaiVRea/3PXZbKsOuCvkFoGAo1Ii/ZK3L76swR2Xm+blzI41aQl1jyXMOTCRnC8xL5nhsXMFIPzg4QYMOUkj2a7ocmxpikXSbo/7BTF89P9JAOCmYydxwfj0rt7oZ22iVqCMdfluRIrqw9p6RvTCFdM+grxbBEdwZzvqwXeUwaquKz5aD5pRmICg9AUN1XjBPjR+k8zuZdhwgWL9/EvO0rTFcTqP1wvAUgna+jhdVIm1xcga+06C1QfZBpFfJgrZ91qRAl6fU2TobkbF4iuXojAivwtrkfOnXtFWX65ixzvnDdf9AvJpN2L4RmKPzoAVvmRP+QZrqjnrRXM3D8f+IJPJobTPSXX5masFc06iQtHOTj5y6etiSs+qefCpA/TYkEgWxlRj92O3TmDFwWW9jYIgbmRnBMhYAr3uweBKvsXGyusQ73URBGEQH1bpivxrdZEOM3IPoBbeH9h3hR+yaYuzj9qgEQqyX06B3gg0PdLEPrlzVSyXA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(36756003)(4744005)(38070700005)(86362001)(33656002)(2906002)(5660300002)(6512007)(186003)(6506007)(53546011)(91956017)(6666004)(54906003)(6486002)(122000001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(38100700002)(316002)(2616005)(66946007)(76116006)(478600001)(71200400001)(8936002)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FB128949C9A9564DBCB7C95568F75A26@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbb9d14a-3bcf-4cba-d6ee-08db7d566bed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zSnRcHuWwsLOMlvzl6wRStB2Wb/0rpoDEvGxjhVHLVuunir1rxinS4mSUaV/KX7iLFkrmGvmuX6jF4v1hxlN3U1oz3YDOM0Uf65IRAJv+NQfs6A3/fOIq2wf9wIUbFRG98SWLMfpjHiNeaytTKQPkIch2JRFFNC2r9+I9U4KGsLWb+i2SZ8nDDaKmMUneFwtz41OrpdMLCUkgGhLn+7Tks6SRxGbDYj9pjz6quKU6RuBnc+HWOgwAGovuaaZ7Na/Q/ZlkpJBsO2EmCrAcjW4MNT7S5qJ8s86V4ryjKj7o3JfIYC7Lcu4CBUbrChEUW46cLQrECkc7OISawFOFrlf5b0O/gHa7iCC8HwJdj4QN2N1b8yBXFMP1YkZsBpFUm1XYlwmd6AWgvYwez9tiGMgdh+Zsfqw7LK3YgOmwGLRghWZo+eeb3m4KMwpFnnDWvtrZ0PPYYRcNmYKYB46ObtY7xRUj7oMz5OKY9ztC3+sMjMXwqbByVXLZdkXgqNYVAn7o785q6vHfSf0iZykq1QFHQY+3ykXAtsHI3jkgJ6hYWjxSA5gpvOj8+q41YK5vDlFtsKaz74DXsJxGrTfF1kaqxymwAnlPZgNYuqjjUnkLa2yvZrKSRQ51L5ef0KnTTy+/3DvLhEAiV/g+5nBbra21NJWEdu1dk9VTB7Xqdr877G2rvvB6LfHjvi6evy/08o/MU347k+MSDykfX7TeDvT9bUzgcq16d3tiBjMeD2WFBES0gTwwn8HDw2jzeEhAK1r
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(40460700003)(70586007)(40480700001)(33656002)(316002)(86362001)(36756003)(36860700001)(82310400005)(81166007)(356005)(70206006)(47076005)(336012)(2616005)(6512007)(26005)(186003)(6506007)(53546011)(478600001)(6666004)(6486002)(41300700001)(4326008)(54906003)(5660300002)(8936002)(8676002)(2906002)(4744005)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 12:50:44.5301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa38f0d3-cfae-444c-3472-08db7d567290
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823

Hi Jan,

> On 5 Jul 2023, at 14:04, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.07.2023 13:55, Julien Grall wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -63,11 +63,11 @@ source "arch/Kconfig"
>>=20
>> config ACPI
>> bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPO=
RTED)" if UNSUPPORTED
>> - depends on ARM_64
>> + depends on ARM_64 && ARM_EFI
>=20
> Wouldn't it make sense to drop the ARM_64 dependency then? It's now
> redundant, and it seems quite likely that if EFI was ever support
> for 32-bit, ACPI could then be supported there as well.

I think we need to keep it.
If we add one day EFI support on arm32, we will probably not add ACPI suppo=
rt anyway.

Cheers
Bertrand

>=20
> Jan


