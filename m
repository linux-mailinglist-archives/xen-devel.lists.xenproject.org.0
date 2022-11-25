Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AAB638585
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 09:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448110.704969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUQV-0000XS-B4; Fri, 25 Nov 2022 08:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448110.704969; Fri, 25 Nov 2022 08:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyUQV-0000V9-8L; Fri, 25 Nov 2022 08:51:15 +0000
Received: by outflank-mailman (input) for mailman id 448110;
 Fri, 25 Nov 2022 08:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s7Aj=3Z=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oyUQT-0000V3-RH
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 08:51:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f1ac72c-6c9e-11ed-91b6-6bf2151ebd3b;
 Fri, 25 Nov 2022 09:51:11 +0100 (CET)
Received: from DB8P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::19)
 by AM0PR08MB5395.eurprd08.prod.outlook.com (2603:10a6:208:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.5; Fri, 25 Nov
 2022 08:51:04 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::f2) by DB8P191CA0009.outlook.office365.com
 (2603:10a6:10:130::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20 via Frontend
 Transport; Fri, 25 Nov 2022 08:51:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 25 Nov 2022 08:51:03 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Fri, 25 Nov 2022 08:51:03 +0000
Received: from 11c4c28e086e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1547AF5-BE9F-4FD1-8391-D110C6426808.1; 
 Fri, 25 Nov 2022 08:50:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11c4c28e086e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Nov 2022 08:50:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB8235.eurprd08.prod.outlook.com (2603:10a6:150:16::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 25 Nov
 2022 08:50:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 08:50:54 +0000
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
X-Inumbo-ID: 4f1ac72c-6c9e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nP+m/L6sHPWBEZmBJ7Mw8glI3XTHHbCVjP9Ri68fLM=;
 b=2XQelEL35Z6YQvCzDUs9t7TANEIktG3fuHaVnKpTs6CCC4PlYjgCA1KLqMi99WCQPHItR1r+cwqtuYCvUJSC24z+IV5LR06ZB4rJmw62ugmtVPN78ZrHYCjIeoiSXsTe98Cfn6xF/ZyjpgQFiAUAO5S1E+2YjbjoSySCmbB125w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1fe79e40b7fc69b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RI/aCIU3SxJDCM1a4+S/GVsCxsJQiKGXusVsUpHZeid/YGlYvIDeHvW5lZF/W8k2edU/q00ZYMuW98MwSZJZUVmFIOHZuI+BDQ3XW+Z+0HhPr3PhGnkCYqagEujpfQuxdN4EvD+O5sW+wtl5IfUosNjttqYEBEvmN+PbG8DvuUgkwJoCWkJxGgNHk1TBcfnlrUA367t8P1/tCcoUupi4x6hRt1N6LHNkVgGSMwg/Ai/6jciM1Vbel/cVl4avJPqLkP0c3WYsK6AGJeaMC3XK96H1kN8+74o2X00an6MX89IGh2YbRGOYaXtq8N/OdfYFQEqTn+z0NuvjW9aI4h0M+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nP+m/L6sHPWBEZmBJ7Mw8glI3XTHHbCVjP9Ri68fLM=;
 b=oanuKr/uPLQmyDM9D01Q8jrWPANmGcWBBTICsL8sVXCxxMeQKbH9XOcKHJZYDFBPXIRMYtvru1MdwWbR1GKCLEAjeGe3hG2UPxQzJ68yZGCVyaglxsbeNfmCMmCE9IiT5ekpY1k8EWP06G1+IG8oFhHKO5FxICDw1coUmTWJ7USyvpkUD0PhmK1E4cVzHdxEWDnaJDTLFYImGAQ4s9x10PRGEe6QUbgTFBjLukkXdWo0Asr4mm3VGRrfWeZ5S2Py4uWqLBOZFyRpypXNq+l3Qi3tpEzgHKma8t/CypE6b1rzuRp73Y0lUFiKW3pp8WiiyNQzBPE1z9JIS8KtQhZfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nP+m/L6sHPWBEZmBJ7Mw8glI3XTHHbCVjP9Ri68fLM=;
 b=2XQelEL35Z6YQvCzDUs9t7TANEIktG3fuHaVnKpTs6CCC4PlYjgCA1KLqMi99WCQPHItR1r+cwqtuYCvUJSC24z+IV5LR06ZB4rJmw62ugmtVPN78ZrHYCjIeoiSXsTe98Cfn6xF/ZyjpgQFiAUAO5S1E+2YjbjoSySCmbB125w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Thread-Topic: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Thread-Index: AQHY8pZ008DS0BACDkyhs+OWN8Oan64+plGAgBDKjwA=
Date: Fri, 25 Nov 2022 08:50:54 +0000
Message-ID: <804E4B68-A225-4D48-A7BA-F5DBBDFDA785@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
 <Y3JsCZYjwiTJSw7H@perard.uk.xensource.com>
In-Reply-To: <Y3JsCZYjwiTJSw7H@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB8235:EE_|DBAEUR03FT028:EE_|AM0PR08MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: d013d910-4509-4e09-cbef-08dacec22f13
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5/j1RJi8HfjVry+lmKeXeiSHuRRkbR7t48MBzt72O//NOsMfCwU6iVerDRsymX8y/CHwtExIe1WCtus5I2FqH038sFHuaoowDhFZLzs6FWvNF0gR++rKVeW8HTbPyBnhd2qCRZSFHtqTbzuATX5d0dcfJTqMZxIPEy/84PLqc/Sv7/Wve5/AiOncSVQP1B6a9OG2TEQRV8Mem8ra1dxY6Xzq7pdWDKhQ1+HrG8J6F09Ggi/R5y+id9nf/JztLkh8gyEo6DEzxQ0wSFweB6wgu5i5HSv9YFoSysN8SS2C6ktsjzoOBSM/qZG4dZ0m5RvTThKmYPUjUXVjuQWLTkT+AKTmawBcA6uSPa7iCY754BAvct7w/2PqDJzTSTwhU4LXd2P2hJTHDUXYTm2IjeUVGZsVod+3tPcLqLCva/7Fvv+TML0lBwaV20tzpBLYthhumDgG3RVFGjFJ2gYcNgZ+OivXPz3y+iJymyg0GrDY6PIe3TIAJLkBYIFBd2UL1utlvl/VGBFbL9BW+0t23iMdKQqAzRXroN6LCzrJ9etfdzih6kOHRbxr/DdzDQbs1klcpOURaZ6W1QM04mI5vlaW9JE/hIdyZMrOZtPFkq4YRH589+PXGJH3ztjP8sqRyzi6mrhQhNY7D+6Z7QKCyemVvwgzyYh7CMZH4BWp6pUkBL0xF65md8RI1HPVrr8nW8JXda/LUn8oVa5RSCr7QSUsP+t5MfOOF/81T8E1NbfGBJw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(6506007)(53546011)(316002)(6916009)(86362001)(38070700005)(54906003)(6486002)(71200400001)(33656002)(186003)(36756003)(2616005)(38100700002)(6512007)(8936002)(26005)(4326008)(478600001)(122000001)(91956017)(4744005)(41300700001)(76116006)(66446008)(64756008)(66556008)(2906002)(5660300002)(66476007)(8676002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57042E8A18C5944FB69BFAC57DF625FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8235
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f27289f-b6ce-4b26-5c87-08dacec229f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M6MS7Xf3V4G6ykxAiT8V9j5M5cDFBDsly46QJvw+BldPS6lDGscUOBv63qpYS+dAPYj0awPPr3CgiB+8pDl41lGrgkiujk7So0EHMLXzM/nT3ZIljyrUqeChzkBc/8wSvnc4LpogTX9cPIMlO7lo2Eoz40C84c1Y2p1JP9VCzdrd8RkYyf7Ck5DnCJpmjUaMYSmkOa0XECzw5CDChbkMUbsIwS0Qkz5xW46ndqmipszdi7E11Lr5Jk0HhwrSgXcO/Fhiij7yYavuyksw2Ly/vX6DRkg4LTHjaPQ745njj1rkSenoX8JKXgRUmC4DZ7a+9tCZckmVmu01bCWkVDKd2nRk5buPpc13/M28jpu861QTXwS+hUkXa2B6HiBy6fVhgcwcZESp7N1z3Jk3zbpF894VF7CWBlF57qbR9A+sHwbaxxnO8tRVDDSj/xL5pGtULD5KfTfCEMmLVX4hzsHIVZRqLHt3o0+5l/zpCxasEVQt698IMuL8opEKCMD9mOScFCi5414dUCjFSkYDCQMCvvvcjcg2TOPIxFNe86MREn89wINCnEPNHqT1wZmAWiWDewNom/Gtonj0tqxpq/rN2bnoy/BQVxkbY7VIwov4/CQeOnaiiIRRCx+a65kCBhCUCyi40claVIyJeKzWlzMqHtq6kbrT67t/ghwe079O0qj0NsdHL/KeROIIvUAjzOyyFqmH8FqmbwCJ89UjsEUC2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(70586007)(70206006)(36756003)(8936002)(6862004)(4744005)(33656002)(41300700001)(8676002)(4326008)(86362001)(5660300002)(36860700001)(82310400005)(26005)(6506007)(6512007)(53546011)(47076005)(2616005)(186003)(336012)(54906003)(81166007)(316002)(6486002)(478600001)(40480700001)(356005)(82740400003)(40460700003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 08:51:03.4994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d013d910-4509-4e09-cbef-08dacec22f13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5395



> On 14 Nov 2022, at 16:25, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> On Mon, Nov 07, 2022 at 10:47:36AM +0000, Luca Fancellu wrote:
>> xen/Makefile                            |  50 ++++++-
>=20
> Hi Luca,

Hi,

>=20
> Could you write a shell script which would probably be easier to
> read/modify than this rather complicated looking set of Makefile rules?

I admit the rules are a bit complicated

>=20
> As I see it, a potential `analysis` shell script would have a single
> interaction with make, it would just have to run `make build
> CC=3Dcppcheck-gcc` or other.
>=20
> Because I don't see how make is useful in this case. Or maybe you could
> explain how writing this in make help?
> Also non of this would work with out-of-tree builds, as you shouldn't
> make modification to the source tree.

They both are good points, I will rewrite the rules as a script.

>=20
> Cheers,
>=20
> --=20
> Anthony PERARD


