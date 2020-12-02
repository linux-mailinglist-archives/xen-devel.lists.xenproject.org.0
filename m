Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE52D2CBDB5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 14:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42701.76827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRpA-0001Iu-OC; Wed, 02 Dec 2020 13:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42701.76827; Wed, 02 Dec 2020 13:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRpA-0001IY-Kd; Wed, 02 Dec 2020 13:05:36 +0000
Received: by outflank-mailman (input) for mailman id 42701;
 Wed, 02 Dec 2020 13:05:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zz6=FG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkRp9-0001IS-Dk
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:05:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::60d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e63074a3-836c-4070-a5ca-cef815297591;
 Wed, 02 Dec 2020 13:05:30 +0000 (UTC)
Received: from AS8PR04CA0087.eurprd04.prod.outlook.com (2603:10a6:20b:313::32)
 by AM9PR08MB6164.eurprd08.prod.outlook.com (2603:10a6:20b:287::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 13:05:28 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::1b) by AS8PR04CA0087.outlook.office365.com
 (2603:10a6:20b:313::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 13:05:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 13:05:27 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Wed, 02 Dec 2020 13:05:27 +0000
Received: from 46ad1ae9c926.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60F6284F-8363-4594-B93B-CD5670F6CEEA.1; 
 Wed, 02 Dec 2020 13:05:21 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46ad1ae9c926.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 13:05:21 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4281.eurprd08.prod.outlook.com (2603:10a6:10:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 13:05:19 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 13:05:19 +0000
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
X-Inumbo-ID: e63074a3-836c-4070-a5ca-cef815297591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5fbEqVvIGmniE5PW22DNYDWqoQ/SVmYTluU4rkW02I=;
 b=LKM39K6nMLGD0m+xKu1fKu1ziJqYwPjZ8TgPjaPc9QzUdzOMgJvXecVq+aO440XGTEHvAtwNstOEDC5JsQOfWjJapdZLxwVA26CCHW3txMGMNx3FUTrre3Mli47eNvL4+vIiOYe9TqItQhTbRWLd2KLZr58DFwE9ZW5D0mF2teM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b62aef3179c32c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5EEm7XixjnrT7LPcbyXA3N+d9FL6GaHxqD7kwRpGmk5ZDEHfFozfcq6tKF+YRpLVK1RZo4Cpsu0RovJQF3juO/RwQQQB4gzxopFBpopfl1151oInYSgzi77c27RfKw9MxrzV0Mr/TzI8mvParKboGdqpInFiX4V8UIM05d1tlDgaCT0T2uwFVta+a7x71vFWLVAsBc8V6qVwbnc9dcfj9SkE94TNdYjLPZSvVlcw4a57yRegI4zkOFQrvQ6yqo8+F3iApsSQoxuAqy82l0JgiEFaoct9NmsaHZxv3HECTj/KyAMLItUPZIqozRu6+hbXV/zpzE9yGKsr8ThCr/PiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5fbEqVvIGmniE5PW22DNYDWqoQ/SVmYTluU4rkW02I=;
 b=oPtWqtYZ97SSU/Bcev3cQysvIGtPr6rxnV4oJkMOZcUeSGTdeGHj335jV8duF30zE5KrTMAaCjFVD2wNGk2G2tZoGAGYuglHtxaFRp6B2x6VijMH1rzz/Lb88iSzAXG0V6lAOY+VFw/eZF8gv3kbDbE7cQB/6/nrK4VVGLuj/+jBlMn2YXTEOhkcJBXIxIFcpXlQHQkIFPc/2oxlP+OVuYO9dy+CfQPvTu3w7cWopMz5LZn+imu4zKSHp6+GF/HoxwSm6jdTFuJhCSzrTpiXfDEMOOXo9gNU6wySpgt9dGx7sY2HBWdQX5OrrFYGL1Gs/WoVFHKPlOOG/5ycxDm5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5fbEqVvIGmniE5PW22DNYDWqoQ/SVmYTluU4rkW02I=;
 b=LKM39K6nMLGD0m+xKu1fKu1ziJqYwPjZ8TgPjaPc9QzUdzOMgJvXecVq+aO440XGTEHvAtwNstOEDC5JsQOfWjJapdZLxwVA26CCHW3txMGMNx3FUTrre3Mli47eNvL4+vIiOYe9TqItQhTbRWLd2KLZr58DFwE9ZW5D0mF2teM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/8] xen/arm: revert atomic operation related
 command-queue insertion patch
Thread-Topic: [PATCH v2 2/8] xen/arm: revert atomic operation related
 command-queue insertion patch
Thread-Index: AQHWxBX9ux1e0/RKik+PTdn4Fk42F6ni2QmAgAD2WwA=
Date: Wed, 2 Dec 2020 13:05:18 +0000
Message-ID: <BEEC5554-0E05-4DD0-8164-710562DC4E71@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <4a0ca6d03b5f1f5b30c4cdbdff0688cea84d9e91.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011420520.1100@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012011420520.1100@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d157457f-71f9-438c-d35b-08d896c2f0c7
x-ms-traffictypediagnostic: DBBPR08MB4281:|AM9PR08MB6164:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB616423A4BB60477DD7967291FCF30@AM9PR08MB6164.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gG964mKdhgpBOdQAwWDXQtd7TUNxLZH46XszUy87Q1lD1C/XafxqrxnXPejyQmD+QalfJcoWpFHn0NbquqDxRYXYAEP8UPGeuAxRprmhnujr/NHoQFDEVk0aaa4ZzwlLuWaxjcRl81wzu2sQLvnn5nrO1zPHUd/2FtfFuwxONCJpDT41LqgSDZMp3d2zOtQCpJRaagc/GfKn0snY04vGgAGNPQZubOKoxSxHllKsXghwA14sOYZYYuTzGzdEm3DfkBmxSPy7jnNCMY3WSqUEE0rvCBOy1VP3rHOZVagxtNC5v3THKvSJBJIs/PyTYnR/KCmuCrJogqRyPvrxJLBiVR9h5X6Y6Rzlqt5jxdkumis3FPc7cjqFs0kWhAttypILq6dQAFoRXsLSDwsmkesGHeBaTd+K5UZ/ClmRRL0sWOM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(478600001)(36756003)(33656002)(8676002)(71200400001)(8936002)(316002)(83380400001)(6512007)(2906002)(4326008)(30864003)(6506007)(26005)(53546011)(5660300002)(54906003)(66946007)(91956017)(66446008)(66556008)(76116006)(186003)(2616005)(6486002)(86362001)(6916009)(64756008)(66476007)(45980500001)(579004)(559001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?g/jHN1cQH1Cjbz/X47w6bevLgPjnpmqoE+Cf+B8Lvcs3xGY9ar0GpoExa/W8?=
 =?us-ascii?Q?Keqaq+pu9Ujvr5lJaTQ691cW86qLZPCHoGnOduIwvoJiIKo8l+gknfm7f2Id?=
 =?us-ascii?Q?QsKvdafD1CIZCAdJ0SFV/lTiY9Ui0Qpzmv5gNJKE5enBxxHV2SwizT9TcVMf?=
 =?us-ascii?Q?gggar80gQw3StwRcZVWD7F6qNP9U7xnzfEI0Fyxb7TIiaw4dTwjsoqvN4BHN?=
 =?us-ascii?Q?t2uWgBWsoNOBy9srtPy/GRxgDadj+z0ClHV3DItXdqtalAQZejvAuDdGK5GC?=
 =?us-ascii?Q?RxiBSx3tgpAgkDl0g/LeCXxA/okqKLv9kemcOWeChjh3bUbg4xbNxsPpVS4U?=
 =?us-ascii?Q?FF3YwxMWfQfPaBTVUf68lr/dsX2r31/VV0onEfQxO3lJDgNtCiiJM+yFSO3b?=
 =?us-ascii?Q?qegzhQTAveWsR3TfFuqtswktDWCVKHb811H1AQMWPJwp3qVhFmNoPMmacOC+?=
 =?us-ascii?Q?tnvK4YvSWW60DUo4/mB6Vn2IGItPuVmAWhZ1qE3U6kSuI8lDjzjV+GdheRUj?=
 =?us-ascii?Q?Q7uSTYk50cQEZKrShR6Ffquntbx+rH9FAqojqz/hkg6QioAuSJvNei6nAfBg?=
 =?us-ascii?Q?sQn8gcrLWxoN7I+82+0J9ZZZAXfKeSmPfDPp8opMQx9Cm6pQoUrt7muYIqPY?=
 =?us-ascii?Q?oXGrB6CefvyTriTftAm8NIJyekBi0V/s+MF3Ch6Q9oKsdx++n7WDTsSPzSGX?=
 =?us-ascii?Q?SL2Yoi3YvVPx1xHzPZO4smQJ9OGvB6TopacwKNo8Yt/kTPz8zPl8SOa9C1a+?=
 =?us-ascii?Q?UJNbiK7OwWb8AHLiJ5QwUw4YwEqjvOtNfSVUWnPDw5sZ8qXFId+IlQadxbM1?=
 =?us-ascii?Q?TH4aN2ORQbsiMyXrpy//19Vtp/peLxzytC+UjD//ONM4kBOLUb+1C9/729dg?=
 =?us-ascii?Q?e7Naz+uDfJnnxQuVcOFiV/LQL5YT8ESnookQpg9dAaUsx+d9Cizql9OxL8aD?=
 =?us-ascii?Q?nkPbWLSuRP+TtFJMUL1/yix+aTRGdg27X3VRsQtqOQhSY0VpxO13N3112+Lc?=
 =?us-ascii?Q?O6Zv?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <95E4BCF7159C3343A106C79159F63608@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4281
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	877d5131-a17e-4916-f164-08d896c2eb71
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r1BUlE3tFvq86r2f59oOtkti2O/TFH4MbrXONPAI9Be7c0/IlgQWCmShpUqW3Y26yoCvLmmj0I3uRc5TM8MA7FJhOD5AF6w8rQJJVsyF/n1nwyRgLnnKxyfX9eNcFSQ5s427Hz5Hqn34cfHF2T7ILpZdTrDxGWUWFxGxXyPHkTShFK+8xupkSQ0Vya3aQndhBxQ2GG7SircfaEFICXBBe2j/CTOqMvIlITjw+RarOir9MIhyETn82O4z4NYtqsjjrBpBCl2KYlTcyWylA4rOlcqbJ3uUBLv8JwDDy3svMEgcX3FF+jATEjavIHXumxFCXmw2VduQY3cvR8z9U4Mm/79HViVCZfUnkieaFalEd5PKUjXB71UeOIbxmtGTfxIH0DOEBVqTX9DRaJ0ydZU6LcJcbwNr/FZ1RPaa7gmNnA0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(70206006)(356005)(47076004)(4326008)(86362001)(82740400003)(36756003)(81166007)(70586007)(478600001)(6862004)(83380400001)(82310400003)(6486002)(26005)(54906003)(8676002)(186003)(8936002)(36906005)(33656002)(30864003)(107886003)(336012)(316002)(2616005)(6512007)(5660300002)(53546011)(2906002)(6506007)(579004)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 13:05:27.9524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d157457f-71f9-438c-d35b-08d896c2f0c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6164

Hello Stefano,

Thanks for reviewing the code.

> On 1 Dec 2020, at 10:23 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 26 Nov 2020, Rahul Singh wrote:
>> Linux SMMUv3 code implements the commands-queue insertion based on
>> atomic operations implemented in Linux. Atomic functions used by the
>> commands-queue insertion is not implemented in XEN therefore revert the
>> patch that implemented the commands-queue insertion based on atomic
>> operations.
>>=20
>> Once the proper atomic operations will be available in XEN the driver
>> can be updated.
>>=20
>> Reverted the commit 587e6c10a7ce89a5924fdbeff2ec524fbd6a124b
>> iommu/arm-smmu-v3: Reduce contention during command-queue insertion
>=20
> I checked 587e6c10a7ce89a5924fdbeff2ec524fbd6a124b: this patch does more
> than just reverting 587e6c10a7ce89a5924fdbeff2ec524fbd6a124b. It looks
> like it is also reverting edd0351e7bc49555d8b5ad8438a65a7ca262c9f0 and
> some other commits.
>=20
> Please can you provide a complete list of reverted commits? I would like
> to be able to do the reverts myself on the linux tree and see that the
> driver textually matches the one on the xen tree with this patch
> applied.
>=20
>=20

Yes this patch is also reverting the commits that is based on the code that=
 introduced the atomic-operations. I will add all the commit id in next ver=
sion of the patch in commit msg.=20

Patches that are reverted in this patch are as follows:

9e773aee8c3e1b3ba019c5c7f8435aaa836c6130  iommu/arm-smmu-v3: Batch ATC inva=
lidation commands
edd0351e7bc49555d8b5ad8438a65a7ca262c9f0  iommu/arm-smmu-v3: Batch context =
descriptor invalidation
4ce8da453640147101bda418640394637c1a7cfc  iommu/arm-smmu-v3: Add command qu=
eue batching helpers
2af2e72b18b499fa36d3f7379fd010ff25d2a984.      iommu/arm-smmu-v3: Defer TLB=
 invalidation until ->iotlb_sync()=20
587e6c10a7ce89a5924fdbeff2ec524fbd6a124b      iommu/arm-smmu-v3: Reduce con=
tention during command-queue insertion


Regards,
Rahul

>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/drivers/passthrough/arm/smmu-v3.c | 847 ++++++--------------------
>> 1 file changed, 180 insertions(+), 667 deletions(-)
>>=20
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index c192544e87..97eac61ea4 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -330,15 +330,6 @@
>> #define CMDQ_ERR_CERROR_ABT_IDX		2
>> #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
>>=20
>> -#define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
>> -
>> -/*
>> - * This is used to size the command queue and therefore must be at leas=
t
>> - * BITS_PER_LONG so that the valid_map works correctly (it relies on th=
e
>> - * total number of queue entries being a multiple of BITS_PER_LONG).
>> - */
>> -#define CMDQ_BATCH_ENTRIES		BITS_PER_LONG
>> -
>> #define CMDQ_0_OP			GENMASK_ULL(7, 0)
>> #define CMDQ_0_SSV			(1UL << 11)
>>=20
>> @@ -407,8 +398,9 @@
>> #define PRIQ_1_ADDR_MASK		GENMASK_ULL(63, 12)
>>=20
>> /* High-level queue structures */
>> -#define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
>> -#define ARM_SMMU_POLL_SPIN_COUNT	10
>> +#define ARM_SMMU_POLL_TIMEOUT_US	100
>> +#define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
>> +#define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
>>=20
>> #define MSI_IOVA_BASE			0x8000000
>> #define MSI_IOVA_LENGTH			0x100000
>> @@ -513,24 +505,15 @@ struct arm_smmu_cmdq_ent {
>>=20
>> 		#define CMDQ_OP_CMD_SYNC	0x46
>> 		struct {
>> +			u32			msidata;
>> 			u64			msiaddr;
>> 		} sync;
>> 	};
>> };
>>=20
>> struct arm_smmu_ll_queue {
>> -	union {
>> -		u64			val;
>> -		struct {
>> -			u32		prod;
>> -			u32		cons;
>> -		};
>> -		struct {
>> -			atomic_t	prod;
>> -			atomic_t	cons;
>> -		} atomic;
>> -		u8			__pad[SMP_CACHE_BYTES];
>> -	} ____cacheline_aligned_in_smp;
>> +	u32				prod;
>> +	u32				cons;
>> 	u32				max_n_shift;
>> };
>>=20
>> @@ -548,23 +531,9 @@ struct arm_smmu_queue {
>> 	u32 __iomem			*cons_reg;
>> };
>>=20
>> -struct arm_smmu_queue_poll {
>> -	ktime_t				timeout;
>> -	unsigned int			delay;
>> -	unsigned int			spin_cnt;
>> -	bool				wfe;
>> -};
>> -
>> struct arm_smmu_cmdq {
>> 	struct arm_smmu_queue		q;
>> -	atomic_long_t			*valid_map;
>> -	atomic_t			owner_prod;
>> -	atomic_t			lock;
>> -};
>> -
>> -struct arm_smmu_cmdq_batch {
>> -	u64				cmds[CMDQ_BATCH_ENTRIES * CMDQ_ENT_DWORDS];
>> -	int				num;
>> +	spinlock_t			lock;
>> };
>>=20
>> struct arm_smmu_evtq {
>> @@ -660,6 +629,8 @@ struct arm_smmu_device {
>>=20
>> 	int				gerr_irq;
>> 	int				combined_irq;
>> +	u32				sync_nr;
>> +	u8				prev_cmd_opcode;
>>=20
>> 	unsigned long			ias; /* IPA */
>> 	unsigned long			oas; /* PA */
>> @@ -677,6 +648,12 @@ struct arm_smmu_device {
>>=20
>> 	struct arm_smmu_strtab_cfg	strtab_cfg;
>>=20
>> +	/* Hi16xx adds an extra 32 bits of goodness to its MSI payload */
>> +	union {
>> +		u32			sync_count;
>> +		u64			padding;
>> +	};
>> +
>> 	/* IOMMU core code handle */
>> 	struct iommu_device		iommu;
>> };
>> @@ -763,21 +740,6 @@ static void parse_driver_options(struct arm_smmu_de=
vice *smmu)
>> }
>>=20
>> /* Low-level queue manipulation functions */
>> -static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
>> -{
>> -	u32 space, prod, cons;
>> -
>> -	prod =3D Q_IDX(q, q->prod);
>> -	cons =3D Q_IDX(q, q->cons);
>> -
>> -	if (Q_WRP(q, q->prod) =3D=3D Q_WRP(q, q->cons))
>> -		space =3D (1 << q->max_n_shift) - (prod - cons);
>> -	else
>> -		space =3D cons - prod;
>> -
>> -	return space >=3D n;
>> -}
>> -
>> static bool queue_full(struct arm_smmu_ll_queue *q)
>> {
>> 	return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
>> @@ -790,12 +752,9 @@ static bool queue_empty(struct arm_smmu_ll_queue *q=
)
>> 	       Q_WRP(q, q->prod) =3D=3D Q_WRP(q, q->cons);
>> }
>>=20
>> -static bool queue_consumed(struct arm_smmu_ll_queue *q, u32 prod)
>> +static void queue_sync_cons_in(struct arm_smmu_queue *q)
>> {
>> -	return ((Q_WRP(q, q->cons) =3D=3D Q_WRP(q, prod)) &&
>> -		(Q_IDX(q, q->cons) > Q_IDX(q, prod))) ||
>> -	       ((Q_WRP(q, q->cons) !=3D Q_WRP(q, prod)) &&
>> -		(Q_IDX(q, q->cons) <=3D Q_IDX(q, prod)));
>> +	q->llq.cons =3D readl_relaxed(q->cons_reg);
>> }
>>=20
>> static void queue_sync_cons_out(struct arm_smmu_queue *q)
>> @@ -826,34 +785,46 @@ static int queue_sync_prod_in(struct arm_smmu_queu=
e *q)
>> 	return ret;
>> }
>>=20
>> -static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
>> +static void queue_sync_prod_out(struct arm_smmu_queue *q)
>> {
>> -	u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
>> -	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
>> +	writel(q->llq.prod, q->prod_reg);
>> }
>>=20
>> -static void queue_poll_init(struct arm_smmu_device *smmu,
>> -			    struct arm_smmu_queue_poll *qp)
>> +static void queue_inc_prod(struct arm_smmu_ll_queue *q)
>> {
>> -	qp->delay =3D 1;
>> -	qp->spin_cnt =3D 0;
>> -	qp->wfe =3D !!(smmu->features & ARM_SMMU_FEAT_SEV);
>> -	qp->timeout =3D ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
>> +	u32 prod =3D (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
>> +	q->prod =3D Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
>> }
>>=20
>> -static int queue_poll(struct arm_smmu_queue_poll *qp)
>> +/*
>> + * Wait for the SMMU to consume items. If sync is true, wait until the =
queue
>> + * is empty. Otherwise, wait until there is at least one free slot.
>> + */
>> +static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wf=
e)
>> {
>> -	if (ktime_compare(ktime_get(), qp->timeout) > 0)
>> -		return -ETIMEDOUT;
>> +	ktime_t timeout;
>> +	unsigned int delay =3D 1, spin_cnt =3D 0;
>>=20
>> -	if (qp->wfe) {
>> -		wfe();
>> -	} else if (++qp->spin_cnt < ARM_SMMU_POLL_SPIN_COUNT) {
>> -		cpu_relax();
>> -	} else {
>> -		udelay(qp->delay);
>> -		qp->delay *=3D 2;
>> -		qp->spin_cnt =3D 0;
>> +	/* Wait longer if it's a CMD_SYNC */
>> +	timeout =3D ktime_add_us(ktime_get(), sync ?
>> +					    ARM_SMMU_CMDQ_SYNC_TIMEOUT_US :
>> +					    ARM_SMMU_POLL_TIMEOUT_US);
>> +
>> +	while (queue_sync_cons_in(q),
>> +	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
>> +		if (ktime_compare(ktime_get(), timeout) > 0)
>> +			return -ETIMEDOUT;
>> +
>> +		if (wfe) {
>> +			wfe();
>> +		} else if (++spin_cnt < ARM_SMMU_CMDQ_SYNC_SPIN_COUNT) {
>> +			cpu_relax();
>> +			continue;
>> +		} else {
>> +			udelay(delay);
>> +			delay *=3D 2;
>> +			spin_cnt =3D 0;
>> +		}
>> 	}
>>=20
>> 	return 0;
>> @@ -867,6 +838,17 @@ static void queue_write(__le64 *dst, u64 *src, size=
_t n_dwords)
>> 		*dst++ =3D cpu_to_le64(*src++);
>> }
>>=20
>> +static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
>> +{
>> +	if (queue_full(&q->llq))
>> +		return -ENOSPC;
>> +
>> +	queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
>> +	queue_inc_prod(&q->llq);
>> +	queue_sync_prod_out(q);
>> +	return 0;
>> +}
>> +
>> static void queue_read(__le64 *dst, u64 *src, size_t n_dwords)
>> {
>> 	int i;
>> @@ -964,14 +946,20 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struc=
t arm_smmu_cmdq_ent *ent)
>> 		cmd[1] |=3D FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
>> 		break;
>> 	case CMDQ_OP_CMD_SYNC:
>> -		if (ent->sync.msiaddr) {
>> +		if (ent->sync.msiaddr)
>> 			cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
>> -			cmd[1] |=3D ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
>> -		} else {
>> +		else
>> 			cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
>> -		}
>> 		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
>> 		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
>> +		/*
>> +		 * Commands are written little-endian, but we want the SMMU to
>> +		 * receive MSIData, and thus write it back to memory, in CPU
>> +		 * byte order, so big-endian needs an extra byteswap here.
>> +		 */
>> +		cmd[0] |=3D FIELD_PREP(CMDQ_SYNC_0_MSIDATA,
>> +				     cpu_to_le32(ent->sync.msidata));
>> +		cmd[1] |=3D ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
>> 		break;
>> 	default:
>> 		return -ENOENT;
>> @@ -980,27 +968,6 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct=
 arm_smmu_cmdq_ent *ent)
>> 	return 0;
>> }
>>=20
>> -static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_devi=
ce *smmu,
>> -					 u32 prod)
>> -{
>> -	struct arm_smmu_queue *q =3D &smmu->cmdq.q;
>> -	struct arm_smmu_cmdq_ent ent =3D {
>> -		.opcode =3D CMDQ_OP_CMD_SYNC,
>> -	};
>> -
>> -	/*
>> -	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
>> -	 * payload, so the write will zero the entire command on that platform=
.
>> -	 */
>> -	if (smmu->features & ARM_SMMU_FEAT_MSI &&
>> -	    smmu->features & ARM_SMMU_FEAT_COHERENCY) {
>> -		ent.sync.msiaddr =3D q->base_dma + Q_IDX(&q->llq, prod) *
>> -				   q->ent_dwords * 8;
>> -	}
>> -
>> -	arm_smmu_cmdq_build_cmd(cmd, &ent);
>> -}
>> -
>> static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>> {
>> 	static const char *cerror_str[] =3D {
>> @@ -1058,474 +1025,109 @@ static void arm_smmu_cmdq_skip_err(struct arm_=
smmu_device *smmu)
>> 	queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
>> }
>>=20
>> -/*
>> - * Command queue locking.
>> - * This is a form of bastardised rwlock with the following major change=
s:
>> - *
>> - * - The only LOCK routines are exclusive_trylock() and shared_lock().
>> - *   Neither have barrier semantics, and instead provide only a control
>> - *   dependency.
>> - *
>> - * - The UNLOCK routines are supplemented with shared_tryunlock(), whic=
h
>> - *   fails if the caller appears to be the last lock holder (yes, this =
is
>> - *   racy). All successful UNLOCK routines have RELEASE semantics.
>> - */
>> -static void arm_smmu_cmdq_shared_lock(struct arm_smmu_cmdq *cmdq)
>> +static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, u64 =
*cmd)
>> {
>> -	int val;
>> -
>> -	/*
>> -	 * We can try to avoid the cmpxchg() loop by simply incrementing the
>> -	 * lock counter. When held in exclusive state, the lock counter is set
>> -	 * to INT_MIN so these increments won't hurt as the value will remain
>> -	 * negative.
>> -	 */
>> -	if (atomic_fetch_inc_relaxed(&cmdq->lock) >=3D 0)
>> -		return;
>> -
>> -	do {
>> -		val =3D atomic_cond_read_relaxed(&cmdq->lock, VAL >=3D 0);
>> -	} while (atomic_cmpxchg_relaxed(&cmdq->lock, val, val + 1) !=3D val);
>> -}
>> -
>> -static void arm_smmu_cmdq_shared_unlock(struct arm_smmu_cmdq *cmdq)
>> -{
>> -	(void)atomic_dec_return_release(&cmdq->lock);
>> -}
>> -
>> -static bool arm_smmu_cmdq_shared_tryunlock(struct arm_smmu_cmdq *cmdq)
>> -{
>> -	if (atomic_read(&cmdq->lock) =3D=3D 1)
>> -		return false;
>> -
>> -	arm_smmu_cmdq_shared_unlock(cmdq);
>> -	return true;
>> -}
>> -
>> -#define arm_smmu_cmdq_exclusive_trylock_irqsave(cmdq, flags)		\
>> -({									\
>> -	bool __ret;							\
>> -	local_irq_save(flags);						\
>> -	__ret =3D !atomic_cmpxchg_relaxed(&cmdq->lock, 0, INT_MIN);	\
>> -	if (!__ret)							\
>> -		local_irq_restore(flags);				\
>> -	__ret;								\
>> -})
>> -
>> -#define arm_smmu_cmdq_exclusive_unlock_irqrestore(cmdq, flags)		\
>> -({									\
>> -	atomic_set_release(&cmdq->lock, 0);				\
>> -	local_irq_restore(flags);					\
>> -})
>> -
>> -
>> -/*
>> - * Command queue insertion.
>> - * This is made fiddly by our attempts to achieve some sort of scalabil=
ity
>> - * since there is one queue shared amongst all of the CPUs in the syste=
m.  If
>> - * you like mixed-size concurrency, dependency ordering and relaxed ato=
mics,
>> - * then you'll *love* this monstrosity.
>> - *
>> - * The basic idea is to split the queue up into ranges of commands that=
 are
>> - * owned by a given CPU; the owner may not have written all of the comm=
ands
>> - * itself, but is responsible for advancing the hardware prod pointer w=
hen
>> - * the time comes. The algorithm is roughly:
>> - *
>> - * 	1. Allocate some space in the queue. At this point we also discover
>> - *	   whether the head of the queue is currently owned by another CPU,
>> - *	   or whether we are the owner.
>> - *
>> - *	2. Write our commands into our allocated slots in the queue.
>> - *
>> - *	3. Mark our slots as valid in arm_smmu_cmdq.valid_map.
>> - *
>> - *	4. If we are an owner:
>> - *		a. Wait for the previous owner to finish.
>> - *		b. Mark the queue head as unowned, which tells us the range
>> - *		   that we are responsible for publishing.
>> - *		c. Wait for all commands in our owned range to become valid.
>> - *		d. Advance the hardware prod pointer.
>> - *		e. Tell the next owner we've finished.
>> - *
>> - *	5. If we are inserting a CMD_SYNC (we may or may not have been an
>> - *	   owner), then we need to stick around until it has completed:
>> - *		a. If we have MSIs, the SMMU can write back into the CMD_SYNC
>> - *		   to clear the first 4 bytes.
>> - *		b. Otherwise, we spin waiting for the hardware cons pointer to
>> - *		   advance past our command.
>> - *
>> - * The devil is in the details, particularly the use of locking for han=
dling
>> - * SYNC completion and freeing up space in the queue before we think th=
at it is
>> - * full.
>> - */
>> -static void __arm_smmu_cmdq_poll_set_valid_map(struct arm_smmu_cmdq *cm=
dq,
>> -					       u32 sprod, u32 eprod, bool set)
>> -{
>> -	u32 swidx, sbidx, ewidx, ebidx;
>> -	struct arm_smmu_ll_queue llq =3D {
>> -		.max_n_shift	=3D cmdq->q.llq.max_n_shift,
>> -		.prod		=3D sprod,
>> -	};
>> -
>> -	ewidx =3D BIT_WORD(Q_IDX(&llq, eprod));
>> -	ebidx =3D Q_IDX(&llq, eprod) % BITS_PER_LONG;
>> -
>> -	while (llq.prod !=3D eprod) {
>> -		unsigned long mask;
>> -		atomic_long_t *ptr;
>> -		u32 limit =3D BITS_PER_LONG;
>> -
>> -		swidx =3D BIT_WORD(Q_IDX(&llq, llq.prod));
>> -		sbidx =3D Q_IDX(&llq, llq.prod) % BITS_PER_LONG;
>> -
>> -		ptr =3D &cmdq->valid_map[swidx];
>> -
>> -		if ((swidx =3D=3D ewidx) && (sbidx < ebidx))
>> -			limit =3D ebidx;
>> -
>> -		mask =3D GENMASK(limit - 1, sbidx);
>> -
>> -		/*
>> -		 * The valid bit is the inverse of the wrap bit. This means
>> -		 * that a zero-initialised queue is invalid and, after marking
>> -		 * all entries as valid, they become invalid again when we
>> -		 * wrap.
>> -		 */
>> -		if (set) {
>> -			atomic_long_xor(mask, ptr);
>> -		} else { /* Poll */
>> -			unsigned long valid;
>> +	struct arm_smmu_queue *q =3D &smmu->cmdq.q;
>> +	bool wfe =3D !!(smmu->features & ARM_SMMU_FEAT_SEV);
>>=20
>> -			valid =3D (ULONG_MAX + !!Q_WRP(&llq, llq.prod)) & mask;
>> -			atomic_long_cond_read_relaxed(ptr, (VAL & mask) =3D=3D valid);
>> -		}
>> +	smmu->prev_cmd_opcode =3D FIELD_GET(CMDQ_0_OP, cmd[0]);
>>=20
>> -		llq.prod =3D queue_inc_prod_n(&llq, limit - sbidx);
>> +	while (queue_insert_raw(q, cmd) =3D=3D -ENOSPC) {
>> +		if (queue_poll_cons(q, false, wfe))
>> +			dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
>> 	}
>> }
>>=20
>> -/* Mark all entries in the range [sprod, eprod) as valid */
>> -static void arm_smmu_cmdq_set_valid_map(struct arm_smmu_cmdq *cmdq,
>> -					u32 sprod, u32 eprod)
>> -{
>> -	__arm_smmu_cmdq_poll_set_valid_map(cmdq, sprod, eprod, true);
>> -}
>> -
>> -/* Wait for all entries in the range [sprod, eprod) to become valid */
>> -static void arm_smmu_cmdq_poll_valid_map(struct arm_smmu_cmdq *cmdq,
>> -					 u32 sprod, u32 eprod)
>> -{
>> -	__arm_smmu_cmdq_poll_set_valid_map(cmdq, sprod, eprod, false);
>> -}
>> -
>> -/* Wait for the command queue to become non-full */
>> -static int arm_smmu_cmdq_poll_until_not_full(struct arm_smmu_device *sm=
mu,
>> -					     struct arm_smmu_ll_queue *llq)
>> +static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>> +				    struct arm_smmu_cmdq_ent *ent)
>> {
>> +	u64 cmd[CMDQ_ENT_DWORDS];
>> 	unsigned long flags;
>> -	struct arm_smmu_queue_poll qp;
>> -	struct arm_smmu_cmdq *cmdq =3D &smmu->cmdq;
>> -	int ret =3D 0;
>>=20
>> -	/*
>> -	 * Try to update our copy of cons by grabbing exclusive cmdq access. I=
f
>> -	 * that fails, spin until somebody else updates it for us.
>> -	 */
>> -	if (arm_smmu_cmdq_exclusive_trylock_irqsave(cmdq, flags)) {
>> -		WRITE_ONCE(cmdq->q.llq.cons, readl_relaxed(cmdq->q.cons_reg));
>> -		arm_smmu_cmdq_exclusive_unlock_irqrestore(cmdq, flags);
>> -		llq->val =3D READ_ONCE(cmdq->q.llq.val);
>> -		return 0;
>> +	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
>> +		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>> +			 ent->opcode);
>> +		return;
>> 	}
>>=20
>> -	queue_poll_init(smmu, &qp);
>> -	do {
>> -		llq->val =3D READ_ONCE(smmu->cmdq.q.llq.val);
>> -		if (!queue_full(llq))
>> -			break;
>> -
>> -		ret =3D queue_poll(&qp);
>> -	} while (!ret);
>> -
>> -	return ret;
>> -}
>> -
>> -/*
>> - * Wait until the SMMU signals a CMD_SYNC completion MSI.
>> - * Must be called with the cmdq lock held in some capacity.
>> - */
>> -static int __arm_smmu_cmdq_poll_until_msi(struct arm_smmu_device *smmu,
>> -					  struct arm_smmu_ll_queue *llq)
>> -{
>> -	int ret =3D 0;
>> -	struct arm_smmu_queue_poll qp;
>> -	struct arm_smmu_cmdq *cmdq =3D &smmu->cmdq;
>> -	u32 *cmd =3D (u32 *)(Q_ENT(&cmdq->q, llq->prod));
>> -
>> -	queue_poll_init(smmu, &qp);
>> -
>> -	/*
>> -	 * The MSI won't generate an event, since it's being written back
>> -	 * into the command queue.
>> -	 */
>> -	qp.wfe =3D false;
>> -	smp_cond_load_relaxed(cmd, !VAL || (ret =3D queue_poll(&qp)));
>> -	llq->cons =3D ret ? llq->prod : queue_inc_prod_n(llq, 1);
>> -	return ret;
>> +	spin_lock_irqsave(&smmu->cmdq.lock, flags);
>> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
>> +	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>> }
>>=20
>> /*
>> - * Wait until the SMMU cons index passes llq->prod.
>> - * Must be called with the cmdq lock held in some capacity.
>> + * The difference between val and sync_idx is bounded by the maximum si=
ze of
>> + * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmet=
ic.
>>  */
>> -static int __arm_smmu_cmdq_poll_until_consumed(struct arm_smmu_device *=
smmu,
>> -					       struct arm_smmu_ll_queue *llq)
>> +static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 s=
ync_idx)
>> {
>> -	struct arm_smmu_queue_poll qp;
>> -	struct arm_smmu_cmdq *cmdq =3D &smmu->cmdq;
>> -	u32 prod =3D llq->prod;
>> -	int ret =3D 0;
>> +	ktime_t timeout;
>> +	u32 val;
>>=20
>> -	queue_poll_init(smmu, &qp);
>> -	llq->val =3D READ_ONCE(smmu->cmdq.q.llq.val);
>> -	do {
>> -		if (queue_consumed(llq, prod))
>> -			break;
>> -
>> -		ret =3D queue_poll(&qp);
>> -
>> -		/*
>> -		 * This needs to be a readl() so that our subsequent call
>> -		 * to arm_smmu_cmdq_shared_tryunlock() can fail accurately.
>> -		 *
>> -		 * Specifically, we need to ensure that we observe all
>> -		 * shared_lock()s by other CMD_SYNCs that share our owner,
>> -		 * so that a failing call to tryunlock() means that we're
>> -		 * the last one out and therefore we can safely advance
>> -		 * cmdq->q.llq.cons. Roughly speaking:
>> -		 *
>> -		 * CPU 0		CPU1			CPU2 (us)
>> -		 *
>> -		 * if (sync)
>> -		 * 	shared_lock();
>> -		 *
>> -		 * dma_wmb();
>> -		 * set_valid_map();
>> -		 *
>> -		 * 			if (owner) {
>> -		 *				poll_valid_map();
>> -		 *				<control dependency>
>> -		 *				writel(prod_reg);
>> -		 *
>> -		 *						readl(cons_reg);
>> -		 *						tryunlock();
>> -		 *
>> -		 * Requires us to see CPU 0's shared_lock() acquisition.
>> -		 */
>> -		llq->cons =3D readl(cmdq->q.cons_reg);
>> -	} while (!ret);
>> +	timeout =3D ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
>> +	val =3D smp_cond_load_acquire(&smmu->sync_count,
>> +				    (int)(VAL - sync_idx) >=3D 0 ||
>> +				    !ktime_before(ktime_get(), timeout));
>>=20
>> -	return ret;
>> +	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
>> }
>>=20
>> -static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
>> -					 struct arm_smmu_ll_queue *llq)
>> +static int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
>> {
>> -	if (smmu->features & ARM_SMMU_FEAT_MSI &&
>> -	    smmu->features & ARM_SMMU_FEAT_COHERENCY)
>> -		return __arm_smmu_cmdq_poll_until_msi(smmu, llq);
>> -
>> -	return __arm_smmu_cmdq_poll_until_consumed(smmu, llq);
>> -}
>> -
>> -static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq, u64=
 *cmds,
>> -					u32 prod, int n)
>> -{
>> -	int i;
>> -	struct arm_smmu_ll_queue llq =3D {
>> -		.max_n_shift	=3D cmdq->q.llq.max_n_shift,
>> -		.prod		=3D prod,
>> -	};
>> -
>> -	for (i =3D 0; i < n; ++i) {
>> -		u64 *cmd =3D &cmds[i * CMDQ_ENT_DWORDS];
>> -
>> -		prod =3D queue_inc_prod_n(&llq, i);
>> -		queue_write(Q_ENT(&cmdq->q, prod), cmd, CMDQ_ENT_DWORDS);
>> -	}
>> -}
>> -
>> -/*
>> - * This is the actual insertion function, and provides the following
>> - * ordering guarantees to callers:
>> - *
>> - * - There is a dma_wmb() before publishing any commands to the queue.
>> - *   This can be relied upon to order prior writes to data structures
>> - *   in memory (such as a CD or an STE) before the command.
>> - *
>> - * - On completion of a CMD_SYNC, there is a control dependency.
>> - *   This can be relied upon to order subsequent writes to memory (e.g.
>> - *   freeing an IOVA) after completion of the CMD_SYNC.
>> - *
>> - * - Command insertion is totally ordered, so if two CPUs each race to
>> - *   insert their own list of commands then all of the commands from on=
e
>> - *   CPU will appear before any of the commands from the other CPU.
>> - */
>> -static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>> -				       u64 *cmds, int n, bool sync)
>> -{
>> -	u64 cmd_sync[CMDQ_ENT_DWORDS];
>> -	u32 prod;
>> +	u64 cmd[CMDQ_ENT_DWORDS];
>> 	unsigned long flags;
>> -	bool owner;
>> -	struct arm_smmu_cmdq *cmdq =3D &smmu->cmdq;
>> -	struct arm_smmu_ll_queue llq =3D {
>> -		.max_n_shift =3D cmdq->q.llq.max_n_shift,
>> -	}, head =3D llq;
>> -	int ret =3D 0;
>> -
>> -	/* 1. Allocate some space in the queue */
>> -	local_irq_save(flags);
>> -	llq.val =3D READ_ONCE(cmdq->q.llq.val);
>> -	do {
>> -		u64 old;
>> -
>> -		while (!queue_has_space(&llq, n + sync)) {
>> -			local_irq_restore(flags);
>> -			if (arm_smmu_cmdq_poll_until_not_full(smmu, &llq))
>> -				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
>> -			local_irq_save(flags);
>> -		}
>> -
>> -		head.cons =3D llq.cons;
>> -		head.prod =3D queue_inc_prod_n(&llq, n + sync) |
>> -					     CMDQ_PROD_OWNED_FLAG;
>> -
>> -		old =3D cmpxchg_relaxed(&cmdq->q.llq.val, llq.val, head.val);
>> -		if (old =3D=3D llq.val)
>> -			break;
>> -
>> -		llq.val =3D old;
>> -	} while (1);
>> -	owner =3D !(llq.prod & CMDQ_PROD_OWNED_FLAG);
>> -	head.prod &=3D ~CMDQ_PROD_OWNED_FLAG;
>> -	llq.prod &=3D ~CMDQ_PROD_OWNED_FLAG;
>> -
>> -	/*
>> -	 * 2. Write our commands into the queue
>> -	 * Dependency ordering from the cmpxchg() loop above.
>> -	 */
>> -	arm_smmu_cmdq_write_entries(cmdq, cmds, llq.prod, n);
>> -	if (sync) {
>> -		prod =3D queue_inc_prod_n(&llq, n);
>> -		arm_smmu_cmdq_build_sync_cmd(cmd_sync, smmu, prod);
>> -		queue_write(Q_ENT(&cmdq->q, prod), cmd_sync, CMDQ_ENT_DWORDS);
>> -
>> -		/*
>> -		 * In order to determine completion of our CMD_SYNC, we must
>> -		 * ensure that the queue can't wrap twice without us noticing.
>> -		 * We achieve that by taking the cmdq lock as shared before
>> -		 * marking our slot as valid.
>> -		 */
>> -		arm_smmu_cmdq_shared_lock(cmdq);
>> -	}
>> -
>> -	/* 3. Mark our slots as valid, ensuring commands are visible first */
>> -	dma_wmb();
>> -	arm_smmu_cmdq_set_valid_map(cmdq, llq.prod, head.prod);
>> -
>> -	/* 4. If we are the owner, take control of the SMMU hardware */
>> -	if (owner) {
>> -		/* a. Wait for previous owner to finish */
>> -		atomic_cond_read_relaxed(&cmdq->owner_prod, VAL =3D=3D llq.prod);
>> -
>> -		/* b. Stop gathering work by clearing the owned flag */
>> -		prod =3D atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
>> -						   &cmdq->q.llq.atomic.prod);
>> -		prod &=3D ~CMDQ_PROD_OWNED_FLAG;
>> +	struct arm_smmu_cmdq_ent  ent =3D {
>> +		.opcode =3D CMDQ_OP_CMD_SYNC,
>> +		.sync	=3D {
>> +			.msiaddr =3D virt_to_phys(&smmu->sync_count),
>> +		},
>> +	};
>>=20
>> -		/*
>> -		 * c. Wait for any gathered work to be written to the queue.
>> -		 * Note that we read our own entries so that we have the control
>> -		 * dependency required by (d).
>> -		 */
>> -		arm_smmu_cmdq_poll_valid_map(cmdq, llq.prod, prod);
>> +	spin_lock_irqsave(&smmu->cmdq.lock, flags);
>>=20
>> -		/*
>> -		 * d. Advance the hardware prod pointer
>> -		 * Control dependency ordering from the entries becoming valid.
>> -		 */
>> -		writel_relaxed(prod, cmdq->q.prod_reg);
>> -
>> -		/*
>> -		 * e. Tell the next owner we're done
>> -		 * Make sure we've updated the hardware first, so that we don't
>> -		 * race to update prod and potentially move it backwards.
>> -		 */
>> -		atomic_set_release(&cmdq->owner_prod, prod);
>> +	/* Piggy-back on the previous command if it's a SYNC */
>> +	if (smmu->prev_cmd_opcode =3D=3D CMDQ_OP_CMD_SYNC) {
>> +		ent.sync.msidata =3D smmu->sync_nr;
>> +	} else {
>> +		ent.sync.msidata =3D ++smmu->sync_nr;
>> +		arm_smmu_cmdq_build_cmd(cmd, &ent);
>> +		arm_smmu_cmdq_insert_cmd(smmu, cmd);
>> 	}
>>=20
>> -	/* 5. If we are inserting a CMD_SYNC, we must wait for it to complete =
*/
>> -	if (sync) {
>> -		llq.prod =3D queue_inc_prod_n(&llq, n);
>> -		ret =3D arm_smmu_cmdq_poll_until_sync(smmu, &llq);
>> -		if (ret) {
>> -			dev_err_ratelimited(smmu->dev,
>> -					    "CMD_SYNC timeout at 0x%08x [hwprod 0x%08x, hwcons 0x%08x]\n",
>> -					    llq.prod,
>> -					    readl_relaxed(cmdq->q.prod_reg),
>> -					    readl_relaxed(cmdq->q.cons_reg));
>> -		}
>> -
>> -		/*
>> -		 * Try to unlock the cmdq lock. This will fail if we're the last
>> -		 * reader, in which case we can safely update cmdq->q.llq.cons
>> -		 */
>> -		if (!arm_smmu_cmdq_shared_tryunlock(cmdq)) {
>> -			WRITE_ONCE(cmdq->q.llq.cons, llq.cons);
>> -			arm_smmu_cmdq_shared_unlock(cmdq);
>> -		}
>> -	}
>> +	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>>=20
>> -	local_irq_restore(flags);
>> -	return ret;
>> +	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>> }
>>=20
>> -static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>> -				   struct arm_smmu_cmdq_ent *ent)
>> +static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>> {
>> 	u64 cmd[CMDQ_ENT_DWORDS];
>> +	unsigned long flags;
>> +	bool wfe =3D !!(smmu->features & ARM_SMMU_FEAT_SEV);
>> +	struct arm_smmu_cmdq_ent ent =3D { .opcode =3D CMDQ_OP_CMD_SYNC };
>> +	int ret;
>>=20
>> -	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
>> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
>> -			 ent->opcode);
>> -		return -EINVAL;
>> -	}
>> +	arm_smmu_cmdq_build_cmd(cmd, &ent);
>>=20
>> -	return arm_smmu_cmdq_issue_cmdlist(smmu, cmd, 1, false);
>> -}
>> +	spin_lock_irqsave(&smmu->cmdq.lock, flags);
>> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
>> +	ret =3D queue_poll_cons(&smmu->cmdq.q, true, wfe);
>> +	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>>=20
>> -static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>> -{
>> -	return arm_smmu_cmdq_issue_cmdlist(smmu, NULL, 0, true);
>> +	return ret;
>> }
>>=20
>> -static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
>> -				    struct arm_smmu_cmdq_batch *cmds,
>> -				    struct arm_smmu_cmdq_ent *cmd)
>> +static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>> {
>> -	if (cmds->num =3D=3D CMDQ_BATCH_ENTRIES) {
>> -		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmds, cmds->num, false);
>> -		cmds->num =3D 0;
>> -	}
>> -	arm_smmu_cmdq_build_cmd(&cmds->cmds[cmds->num * CMDQ_ENT_DWORDS], cmd)=
;
>> -	cmds->num++;
>> -}
>> +	int ret;
>> +	bool msi =3D (smmu->features & ARM_SMMU_FEAT_MSI) &&
>> +		   (smmu->features & ARM_SMMU_FEAT_COHERENCY);
>>=20
>> -static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
>> -				      struct arm_smmu_cmdq_batch *cmds)
>> -{
>> -	return arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmds, cmds->num, true);
>> +	ret =3D msi ? __arm_smmu_cmdq_issue_sync_msi(smmu)
>> +		  : __arm_smmu_cmdq_issue_sync(smmu);
>> +	if (ret)
>> +		dev_err_ratelimited(smmu->dev, "CMD_SYNC timeout\n");
>> +	return ret;
>> }
>>=20
>> /* Context descriptor manipulation functions */
>> @@ -1535,7 +1137,6 @@ static void arm_smmu_sync_cd(struct arm_smmu_domai=
n *smmu_domain,
>> 	size_t i;
>> 	unsigned long flags;
>> 	struct arm_smmu_master *master;
>> -	struct arm_smmu_cmdq_batch cmds =3D {};
>> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> 	struct arm_smmu_cmdq_ent cmd =3D {
>> 		.opcode	=3D CMDQ_OP_CFGI_CD,
>> @@ -1549,12 +1150,12 @@ static void arm_smmu_sync_cd(struct arm_smmu_dom=
ain *smmu_domain,
>> 	list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>> 		for (i =3D 0; i < master->num_sids; i++) {
>> 			cmd.cfgi.sid =3D master->sids[i];
>> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
>> +			arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> 		}
>> 	}
>> 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>>=20
>> -	arm_smmu_cmdq_batch_submit(smmu, &cmds);
>> +	arm_smmu_cmdq_issue_sync(smmu);
>> }
>>=20
>> static int arm_smmu_alloc_cd_leaf_table(struct arm_smmu_device *smmu,
>> @@ -2189,16 +1790,17 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long =
iova, size_t size,
>> 	cmd->atc.size	=3D log2_span;
>> }
>>=20
>> -static int arm_smmu_atc_inv_master(struct arm_smmu_master *master)
>> +static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
>> +				   struct arm_smmu_cmdq_ent *cmd)
>> {
>> 	int i;
>> -	struct arm_smmu_cmdq_ent cmd;
>>=20
>> -	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
>> +	if (!master->ats_enabled)
>> +		return 0;
>>=20
>> 	for (i =3D 0; i < master->num_sids; i++) {
>> -		cmd.atc.sid =3D master->sids[i];
>> -		arm_smmu_cmdq_issue_cmd(master->smmu, &cmd);
>> +		cmd->atc.sid =3D master->sids[i];
>> +		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
>> 	}
>>=20
>> 	return arm_smmu_cmdq_issue_sync(master->smmu);
>> @@ -2207,11 +1809,10 @@ static int arm_smmu_atc_inv_master(struct arm_sm=
mu_master *master)
>> static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>> 				   int ssid, unsigned long iova, size_t size)
>> {
>> -	int i;
>> +	int ret =3D 0;
>> 	unsigned long flags;
>> 	struct arm_smmu_cmdq_ent cmd;
>> 	struct arm_smmu_master *master;
>> -	struct arm_smmu_cmdq_batch cmds =3D {};
>>=20
>> 	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
>> 		return 0;
>> @@ -2236,18 +1837,11 @@ static int arm_smmu_atc_inv_domain(struct arm_sm=
mu_domain *smmu_domain,
>> 	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
>>=20
>> 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>> -	list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>> -		if (!master->ats_enabled)
>> -			continue;
>> -
>> -		for (i =3D 0; i < master->num_sids; i++) {
>> -			cmd.atc.sid =3D master->sids[i];
>> -			arm_smmu_cmdq_batch_add(smmu_domain->smmu, &cmds, &cmd);
>> -		}
>> -	}
>> +	list_for_each_entry(master, &smmu_domain->devices, domain_head)
>> +		ret |=3D arm_smmu_atc_inv_master(master, &cmd);
>> 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>>=20
>> -	return arm_smmu_cmdq_batch_submit(smmu_domain->smmu, &cmds);
>> +	return ret ? -ETIMEDOUT : 0;
>> }
>>=20
>> /* IO_PGTABLE API */
>> @@ -2269,32 +1863,27 @@ static void arm_smmu_tlb_inv_context(void *cooki=
e)
>> 	/*
>> 	 * NOTE: when io-pgtable is in non-strict mode, we may get here with
>> 	 * PTEs previously cleared by unmaps on the current CPU not yet visible
>> -	 * to the SMMU. We are relying on the dma_wmb() implicit during cmd
>> -	 * insertion to guarantee those are observed before the TLBI. Do be
>> -	 * careful, 007.
>> +	 * to the SMMU. We are relying on the DSB implicit in
>> +	 * queue_sync_prod_out() to guarantee those are observed before the
>> +	 * TLBI. Do be careful, 007.
>> 	 */
>> 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> 	arm_smmu_cmdq_issue_sync(smmu);
>> 	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
>> }
>>=20
>> -static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
>> -				   size_t granule, bool leaf,
>> -				   struct arm_smmu_domain *smmu_domain)
>> +static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t si=
ze,
>> +					  size_t granule, bool leaf, void *cookie)
>> {
>> +	struct arm_smmu_domain *smmu_domain =3D cookie;
>> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -	unsigned long start =3D iova, end =3D iova + size, num_pages =3D 0, tg=
 =3D 0;
>> -	size_t inv_range =3D granule;
>> -	struct arm_smmu_cmdq_batch cmds =3D {};
>> 	struct arm_smmu_cmdq_ent cmd =3D {
>> 		.tlbi =3D {
>> 			.leaf	=3D leaf,
>> +			.addr	=3D iova,
>> 		},
>> 	};
>>=20
>> -	if (!size)
>> -		return;
>> -
>> 	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_S1) {
>> 		cmd.opcode	=3D CMDQ_OP_TLBI_NH_VA;
>> 		cmd.tlbi.asid	=3D smmu_domain->s1_cfg.cd.asid;
>> @@ -2303,78 +1892,37 @@ static void arm_smmu_tlb_inv_range(unsigned long=
 iova, size_t size,
>> 		cmd.tlbi.vmid	=3D smmu_domain->s2_cfg.vmid;
>> 	}
>>=20
>> -	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
>> -		/* Get the leaf page size */
>> -		tg =3D __ffs(smmu_domain->domain.pgsize_bitmap);
>> -
>> -		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
>> -		cmd.tlbi.tg =3D (tg - 10) / 2;
>> -
>> -		/* Determine what level the granule is at */
>> -		cmd.tlbi.ttl =3D 4 - ((ilog2(granule) - 3) / (tg - 3));
>> -
>> -		num_pages =3D size >> tg;
>> -	}
>> -
>> -	while (iova < end) {
>> -		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
>> -			/*
>> -			 * On each iteration of the loop, the range is 5 bits
>> -			 * worth of the aligned size remaining.
>> -			 * The range in pages is:
>> -			 *
>> -			 * range =3D (num_pages & (0x1f << __ffs(num_pages)))
>> -			 */
>> -			unsigned long scale, num;
>> -
>> -			/* Determine the power of 2 multiple number of pages */
>> -			scale =3D __ffs(num_pages);
>> -			cmd.tlbi.scale =3D scale;
>> -
>> -			/* Determine how many chunks of 2^scale size we have */
>> -			num =3D (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
>> -			cmd.tlbi.num =3D num - 1;
>> -
>> -			/* range is num * 2^scale * pgsize */
>> -			inv_range =3D num << (scale + tg);
>> -
>> -			/* Clear out the lower order bits for the next iteration */
>> -			num_pages -=3D num << scale;
>> -		}
>> -
>> -		cmd.tlbi.addr =3D iova;
>> -		arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
>> -		iova +=3D inv_range;
>> -	}
>> -	arm_smmu_cmdq_batch_submit(smmu, &cmds);
>> -
>> -	/*
>> -	 * Unfortunately, this can't be leaf-only since we may have
>> -	 * zapped an entire table.
>> -	 */
>> -	arm_smmu_atc_inv_domain(smmu_domain, 0, start, size);
>> +	do {
>> +		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> +		cmd.tlbi.addr +=3D granule;
>> +	} while (size -=3D granule);
>> }
>>=20
>> static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gath=
er,
>> 					 unsigned long iova, size_t granule,
>> 					 void *cookie)
>> {
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct iommu_domain *domain =3D &smmu_domain->domain;
>> -
>> -	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
>> +	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
>> }
>>=20
>> static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
>> 				  size_t granule, void *cookie)
>> {
>> -	arm_smmu_tlb_inv_range(iova, size, granule, false, cookie);
>> +	struct arm_smmu_domain *smmu_domain =3D cookie;
>> +	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> +
>> +	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
>> +	arm_smmu_cmdq_issue_sync(smmu);
>> }
>>=20
>> static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
>> 				  size_t granule, void *cookie)
>> {
>> -	arm_smmu_tlb_inv_range(iova, size, granule, true, cookie);
>> +	struct arm_smmu_domain *smmu_domain =3D cookie;
>> +	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> +
>> +	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
>> +	arm_smmu_cmdq_issue_sync(smmu);
>> }
>>=20
>> static const struct iommu_flush_ops arm_smmu_flush_ops =3D {
>> @@ -2700,6 +2248,7 @@ static void arm_smmu_enable_ats(struct arm_smmu_ma=
ster *master)
>>=20
>> static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>> {
>> +	struct arm_smmu_cmdq_ent cmd;
>> 	struct arm_smmu_domain *smmu_domain =3D master->domain;
>>=20
>> 	if (!master->ats_enabled)
>> @@ -2711,8 +2260,9 @@ static void arm_smmu_disable_ats(struct arm_smmu_m=
aster *master)
>> 	 * ATC invalidation via the SMMU.
>> 	 */
>> 	wmb();
>> -	arm_smmu_atc_inv_master(master);
>> -	atomic_dec(&smmu_domain->nr_ats_masters);
>> +	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
>> +	arm_smmu_atc_inv_master(master, &cmd);
>> +    atomic_dec(&smmu_domain->nr_ats_masters);
>> }
>>=20
>> static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>> @@ -2875,10 +2425,10 @@ static void arm_smmu_flush_iotlb_all(struct iomm=
u_domain *domain)
>> static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
>> 				struct iommu_iotlb_gather *gather)
>> {
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> +	struct arm_smmu_device *smmu =3D to_smmu_domain(domain)->smmu;
>>=20
>> -	arm_smmu_tlb_inv_range(gather->start, gather->end - gather->start,
>> -			       gather->pgsize, true, smmu_domain);
>> +	if (smmu)
>> +		arm_smmu_cmdq_issue_sync(smmu);
>> }
>>=20
>> static phys_addr_t
>> @@ -3176,49 +2726,18 @@ static int arm_smmu_init_one_queue(struct arm_sm=
mu_device *smmu,
>> 	return 0;
>> }
>>=20
>> -static void arm_smmu_cmdq_free_bitmap(void *data)
>> -{
>> -	unsigned long *bitmap =3D data;
>> -	bitmap_free(bitmap);
>> -}
>> -
>> -static int arm_smmu_cmdq_init(struct arm_smmu_device *smmu)
>> -{
>> -	int ret =3D 0;
>> -	struct arm_smmu_cmdq *cmdq =3D &smmu->cmdq;
>> -	unsigned int nents =3D 1 << cmdq->q.llq.max_n_shift;
>> -	atomic_long_t *bitmap;
>> -
>> -	atomic_set(&cmdq->owner_prod, 0);
>> -	atomic_set(&cmdq->lock, 0);
>> -
>> -	bitmap =3D (atomic_long_t *)bitmap_zalloc(nents, GFP_KERNEL);
>> -	if (!bitmap) {
>> -		dev_err(smmu->dev, "failed to allocate cmdq bitmap\n");
>> -		ret =3D -ENOMEM;
>> -	} else {
>> -		cmdq->valid_map =3D bitmap;
>> -		devm_add_action(smmu->dev, arm_smmu_cmdq_free_bitmap, bitmap);
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>> static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>> {
>> 	int ret;
>>=20
>> 	/* cmdq */
>> +	spin_lock_init(&smmu->cmdq.lock);
>> 	ret =3D arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, ARM_SMMU_CMDQ_PROD=
,
>> 				      ARM_SMMU_CMDQ_CONS, CMDQ_ENT_DWORDS,
>> 				      "cmdq");
>> 	if (ret)
>> 		return ret;
>>=20
>> -	ret =3D arm_smmu_cmdq_init(smmu);
>> -	if (ret)
>> -		return ret;
>> -
>> 	/* evtq */
>> 	ret =3D arm_smmu_init_one_queue(smmu, &smmu->evtq.q, ARM_SMMU_EVTQ_PROD=
,
>> 				      ARM_SMMU_EVTQ_CONS, EVTQ_ENT_DWORDS,
>> @@ -3799,15 +3318,9 @@ static int arm_smmu_device_hw_probe(struct arm_sm=
mu_device *smmu)
>> 	/* Queue sizes, capped to ensure natural alignment */
>> 	smmu->cmdq.q.llq.max_n_shift =3D min_t(u32, CMDQ_MAX_SZ_SHIFT,
>> 					     FIELD_GET(IDR1_CMDQS, reg));
>> -	if (smmu->cmdq.q.llq.max_n_shift <=3D ilog2(CMDQ_BATCH_ENTRIES)) {
>> -		/*
>> -		 * We don't support splitting up batches, so one batch of
>> -		 * commands plus an extra sync needs to fit inside the command
>> -		 * queue. There's also no way we can handle the weird alignment
>> -		 * restrictions on the base pointer for a unit-length queue.
>> -		 */
>> -		dev_err(smmu->dev, "command queue size <=3D %d entries not supported\=
n",
>> -			CMDQ_BATCH_ENTRIES);
>> +	if (!smmu->cmdq.q.llq.max_n_shift) {
>> +		/* Odd alignment restrictions on the base, so ignore for now */
>> +		dev_err(smmu->dev, "unit-length command queue not supported\n");
>> 		return -ENXIO;
>> 	}
>>=20
>> --=20
>> 2.17.1
>>=20


