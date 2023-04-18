Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752766E674C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 16:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522945.812616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomU1-0005aS-Ad; Tue, 18 Apr 2023 14:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522945.812616; Tue, 18 Apr 2023 14:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomU1-0005Xi-6n; Tue, 18 Apr 2023 14:39:01 +0000
Received: by outflank-mailman (input) for mailman id 522945;
 Tue, 18 Apr 2023 14:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pomTz-0005XB-C6
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 14:38:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0ad611f-ddf6-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 16:38:58 +0200 (CEST)
Received: from AS9PR06CA0394.eurprd06.prod.outlook.com (2603:10a6:20b:461::27)
 by DU0PR08MB8090.eurprd08.prod.outlook.com (2603:10a6:10:3e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:38:56 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::b5) by AS9PR06CA0394.outlook.office365.com
 (2603:10a6:20b:461::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 14:38:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 14:38:56 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Tue, 18 Apr 2023 14:38:56 +0000
Received: from fbd32eaa3ee3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CEF2662-0269-499D-A059-62FD0BF2E09B.1; 
 Tue, 18 Apr 2023 14:38:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbd32eaa3ee3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 14:38:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8069.eurprd08.prod.outlook.com (2603:10a6:20b:588::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:38:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 14:38:36 +0000
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
X-Inumbo-ID: c0ad611f-ddf6-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EljlqRfyBN5u+AH1HiyHn2aQySznZuUmDSCl1CQLBk=;
 b=WgJDP4m2tu+uq9RO4gSQiIzM4YXBb9SUy/d6sZSXrBowyRXIRhU56nJvZvgPBOSUM8Ha1zo+urqBuyH16evPmgfWi555+m6UjjwPQyYJGHHFF2XEyI0CyoqqgY3ZTjLQIGuLKAwFCGz95udU9PKPJ/JLS7opFT6ZVoXtC+vcQEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0baeb10b0392f62e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJQLbCLWUn9N0l2FtTkWuWDoi2XLZluyPrjtfa0w2wDmnF2nB+UKTAzQOWFRgRE6hw5+LaE+PLNqd1a8QRfz/ihVozllX7LI2NQnQ335ik1Ymb9bS1GB93SncBD9HEfmTcDk2nA+9hc9u4iHqAqfDl0UylUiwlfPIOjy823SDMmQfKt8ayndDtRAhZriwzptguQfUvluMmJWNT3aaybMZ+2wuP61ljv064bdxxx7WnWA+pTAwvtct2kD2qyjLrp1eecFEXHfEvmoWgX9Ii8HKekT3WVE/2FcxZ0FA2QqKIkL5Mc2BgjbHhgfsPVuM+jHA7c9VScMMFvx6o4cSrRLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EljlqRfyBN5u+AH1HiyHn2aQySznZuUmDSCl1CQLBk=;
 b=T8uFi8y9Q8DzJ1/KYjhPu6Yjn4LTi7qKHKanKjhxTMeCB1wR688EtFPdvFpLpFRACraPCRUf3G2SCCe9EAG6VrZmXwbY0/O2cMJsw/ATmBwWfr1uksc2mbssep6M5vWW24rDmDH5bLkaDQw05R1YVaDzM6+nGba4waCD9Hj2ScIAE/+M1dvq1on0Ubp7Ky/Ou5hFNTeDUqhMLjLB4lr7GI16ppVRycTHTXGvfp5mug0yq5GKiuD5Vx8iIrKGhYst6qNWG8LRAUhLLuUPUjQuSnYQnYK4D/+NDt5qjENqh5yrgzGJvw2a/vn19vUWt48fqjKk20FRrjegAa2crQDmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EljlqRfyBN5u+AH1HiyHn2aQySznZuUmDSCl1CQLBk=;
 b=WgJDP4m2tu+uq9RO4gSQiIzM4YXBb9SUy/d6sZSXrBowyRXIRhU56nJvZvgPBOSUM8Ha1zo+urqBuyH16evPmgfWi555+m6UjjwPQyYJGHHFF2XEyI0CyoqqgY3ZTjLQIGuLKAwFCGz95udU9PKPJ/JLS7opFT6ZVoXtC+vcQEY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>, Community
 Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Thread-Topic: [PATCH v5 00/12] SVE feature for arm guests
Thread-Index: AQHZbSQqKlfgrZX3xkqta7+H+1gq3K8xFMoAgAAUHYCAAAOtgA==
Date: Tue, 18 Apr 2023 14:38:36 +0000
Message-ID: <5D0FF62F-AA83-4A35-8A39-74A2F0D29603@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
 <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
In-Reply-To: <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB8069:EE_|AM7EUR03FT034:EE_|DU0PR08MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: ca23d725-2619-4928-afa1-08db401aa3eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kVcGjBNITfnxNSGldypT5wSQRC9ndBI5T/e/PgT+BdWRCHDGktDgLLEAM2i0rbM7C3Wg84kdWXynMHHJlnGi8olzzt6Iar4bGSWA9l30C+g3fFKLZgfStlZurDqy7njHFzNkrjliAZbNHLGbCOrcNy0Kgjx95Y5FvG/LmrYl3xF5B15cOvBhQV1jkSMm7j3WNB4Wk6D5MvqowDhidYEKyY1uGQo7z5mAnoOcsTsW1oDv9t8jFd+6ovW47oP3GR/joB35ZdYl6SysLx6g/3zzDjbc4e2DxLOHcgdsc0GTEan2rL56UN7/HG6tAog/Q2dO5/+9UcZHpUHgMIln6iGR0M0UPbSQsZUEMun3YVHEjP/ys1fFCRuN9lQUdWTv70XvwX/NwBCI2Arn2RjTl5EvNnbwoNOzAlFhj3YznRWyTp5uP9hlPMc64bGUeiWw48ToEl3do1L2nJPKt0ML03ShPRCB/ObIVdECKFWj3b6gpRtzr0xSAZT5Ou23GzRzlB1QeMWyegGspREDPUChODroPlN/3dE3blM8UxcM0/vsoRJ7xx00OTnsBokSHNbw7274ECFs099HFAkfAV99Okwv3hrzaUoLa4ny+kQxeK1cWkNBnG22fHcdMo3HOlNbNYvW8RrIn5ceqYBXXHa7rG2cqQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(36756003)(33656002)(76116006)(4326008)(6916009)(54906003)(316002)(66446008)(64756008)(66946007)(66556008)(66476007)(91956017)(71200400001)(478600001)(41300700001)(5660300002)(6486002)(8676002)(8936002)(2906002)(7416002)(38070700005)(86362001)(122000001)(38100700002)(2616005)(6506007)(186003)(53546011)(6512007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ACDD050DF8166744A46582275E683BEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8069
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2983b8be-a258-4754-a81a-08db401a97d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dS2kg1GjWOwdN0kzSb09dDT0narfyD+b2gTB5hEQjeGY5b4sFE7r7DMPoFS6RUQyseD1yRkG12TwEGdwoJSMMwsz5yimdn2n48DbnvXnEi9Eo16Dh0I1Epelk/8agKr80p0CnaicVb0MlRlz6Izxpokar/B8Su4McMO2oFqtj9+XhqpM9LH8BCFDldS2scYAK3yk58fpfsYwlBUY6TyT3IkrxA8a9orxt6KS6MwtczgwMINkmzdKEIEXoeCSuP6Ie/y4W0Duv0Bn976yrSs1egYgW/gjCyBRous4GroJ8UN+DtQiu9PD73aOpjl/vX2yYyen/mC1igdjZhXJZZOR3Byg2UL1L/HZkBvct7sBviZeffJRQZz2rH8Au+pJgbfgagtQHPYhQhfq6yjauSejDWXMsmxdTw/ZFRywmzWuZVjV7DuakJ7EtK0s7eGsG6dRSg/xoxi8zpD/ga0RccZDZsASd6LytgBTbVQsg9VZqvCh+4Pd/HpALR6lGVX+Dc4lvnLwkzxWBD/+zFZKfnx1VTI7oyn4Z3G5Cg/qiP6W1YTkx9eQe3EyE5/Yyx0KKC9M6nrwrj6QRySUoqP4sNCTrJfcFxaqxEmIzh4vZXyi4BOPaUjCOxk5ZpHAygQEa5t2OsODd/MkrvI/jlDbZBHbDvZ4HEQHRXjr6QoClIaEqX3HoKmEBQzhT25n6MB2BUihoR1OCCY4/cpOOUopHylR4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(6486002)(478600001)(54906003)(2616005)(82310400005)(186003)(53546011)(6512007)(26005)(336012)(6506007)(5660300002)(2906002)(6862004)(8676002)(70586007)(70206006)(8936002)(4326008)(41300700001)(33656002)(86362001)(40480700001)(316002)(36756003)(40460700003)(36860700001)(83380400001)(47076005)(356005)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:38:56.5891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca23d725-2619-4928-afa1-08db401aa3eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8090

Hi Julien,

> On 18 Apr 2023, at 16:25, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 18/04/2023 14:13, Bertrand Marquis wrote:
>> Hi Luca,
>=20
> Hi,
>=20
>> On this serie I would like to open a discussion on how to handle the vec=
tor size
>> and the corresponding command line / configuration / device tree paramet=
ers.
>> In general the user must either give a vector size it wants or has a sol=
ution to
>> just request the maximum supported size.
>> In the current implementation if a size bigger than the supported one is=
 provided:
>> - we silently disable SVE for dom0
>> - we silently disable SVE for dom0less
>> - we do not create a guest when done through tools
>> This is not completely coherent and i think we should aim for a coherent=
 behaviour
>> unless we have arguments for this status.
>=20
> +1.
>=20
>> Is there any good reason to silently disable for Dom0 and dom0less only =
?
>> I see some possible solutions here:
>> - modify parameter behaviour to use the supported size if parameter is b=
igger than
>> it. This would at least keep SVE enabled if a VM depends on it and could=
 simplify
>> some of the handling by using 2048 to use the maximum supported size.
>=20
> My concern with this approach and the third one is the user may take some=
 time to realize the problem in the xl.cfg. So...

Good point

>=20
>> - coherently stop if the parameter value is not supported (including if =
sve is
>> not supported)
>=20
> ... this is my preferred approach because it would be clear that the valu=
e passed to Xen is bogus.

I agree: we should not silently ignore configuration parameters or try to "=
fix" them.

Cheers
Bertrand


