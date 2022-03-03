Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17394CB45F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 02:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282664.481457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPaO5-0000ga-26; Thu, 03 Mar 2022 01:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282664.481457; Thu, 03 Mar 2022 01:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPaO4-0000d9-Th; Thu, 03 Mar 2022 01:36:12 +0000
Received: by outflank-mailman (input) for mailman id 282664;
 Thu, 03 Mar 2022 01:36:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HbtR=TO=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nPaO3-0000XN-A2
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 01:36:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49475f57-9a92-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 02:36:02 +0100 (CET)
Received: from DB6PR0802CA0035.eurprd08.prod.outlook.com (2603:10a6:4:a3::21)
 by VI1PR0802MB2221.eurprd08.prod.outlook.com (2603:10a6:800:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 01:36:00 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::5c) by DB6PR0802CA0035.outlook.office365.com
 (2603:10a6:4:a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21 via Frontend
 Transport; Thu, 3 Mar 2022 01:36:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 01:35:59 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 03 Mar 2022 01:35:59 +0000
Received: from 0ab8b9c61e81.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74C92DCE-74BC-408E-8456-B35EB1F17433.1; 
 Thu, 03 Mar 2022 01:35:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ab8b9c61e81.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 01:35:54 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB3575.eurprd08.prod.outlook.com (2603:10a6:20b:48::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Thu, 3 Mar
 2022 01:35:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 01:35:50 +0000
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
X-Inumbo-ID: 49475f57-9a92-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcsEOKu715kcgR7lt6oNR1CEjCILmSXWRmq1U6wvokQ=;
 b=vUDphmIicYpI3lDYXdJSJ+fgsCuN9wpuLldTt4RP3IIUcT5k+3CAUmFaJYtnDfdj0mJfAgyw4eaiuN0N4Ue+gZRBj8hIBOZs5uG62OS7sza9iehY7/IID6dhjEEBnO5HNyo+O41p7ps2pThLzQJaa9R/9bnL1neS5JcfPA+6OL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfjgsUR573a7ReE5gDJI5M84e4hQsotJL407fSh/54LmM1GCtW0aIxQ9dsMkwRfepDCs5fzt0DxUPwLNQjRJ6egIMtPlHVF4SjW9bM8AMLTVRgJM1Vr58LmLpp12/+0kEYI0xd4zIefe431xUcfvE6/V0dkw6te6Y9ySdWSxmesEb76j5xBZF2ScQ1223LNHeuAgV0pqGhfn8SQnuLNnUnqJRZZaTnq4Q/9JZQaVDh3y2/rMP987Uhks7rp3cXxx4yfC0Oz9qEEeR6LmTPUKgPfnIlquUPFh+cjCdpvNGDfbkHBPBsckLk81QoQC1oIpup7a2TGofwGoTjasTgK8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcsEOKu715kcgR7lt6oNR1CEjCILmSXWRmq1U6wvokQ=;
 b=bFc0FcRj885C8ktvpZFb2KcVS57dAq3qFhuk2cCWcQpsyQriNyTEltnle0m23YThuj50PzTBrXWrbMYVCELep8ty4t5+HBy6FZsV3UinDnghIhLna0USPcaUNnbgubKO6NFIsHZqO9F/TrVD/BAeEcFkC41psltMHLZhZbs0q6QWcV6HIklqG00NM7iO3H8mcZGcGdrvBMrGxKUFgNy9ZTIg3hGrdtuv0b/k4PDUZ8W8d3lTKsDU9jYZ/R9m1W9JDH0iD2Zk7EXngflT2UJ8IrZrPuANJGxCjzSsF36ztsCPx/3j8WxC71StTZ9xUcBVk9SZRIaCG8rNPRYfy0FH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcsEOKu715kcgR7lt6oNR1CEjCILmSXWRmq1U6wvokQ=;
 b=vUDphmIicYpI3lDYXdJSJ+fgsCuN9wpuLldTt4RP3IIUcT5k+3CAUmFaJYtnDfdj0mJfAgyw4eaiuN0N4Ue+gZRBj8hIBOZs5uG62OS7sza9iehY7/IID6dhjEEBnO5HNyo+O41p7ps2pThLzQJaa9R/9bnL1neS5JcfPA+6OL4=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UAAF1ylAACsO9YwAA5uZgAAI3g7sAAIzZgAAB9QTKA=
Date: Thu, 3 Mar 2022 01:35:50 +0000
Message-ID:
 <PAXPR08MB7420836458E512FE375B8F199E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
 <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
 <PAXPR08MB7420B367FFEB4FD3A7C88EB79E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <5eb5fe51-9ef7-affe-06e1-b15da512a76c@xen.org>
In-Reply-To: <5eb5fe51-9ef7-affe-06e1-b15da512a76c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6E58D46329831C48A482985C7259F316.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0f9ad8ba-9e7a-4af1-57a4-08d9fcb62bcb
x-ms-traffictypediagnostic:
	AM6PR08MB3575:EE_|DB5EUR03FT029:EE_|VI1PR0802MB2221:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2221B2BEC3F5FA6D18FD6AB89E049@VI1PR0802MB2221.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 z8SWODiUvI4dvyEPcsUn3RU8L3R9zSYpt9zqRVFQ1U2EXocSJaiHwRk1x3VfIJ0Smo43o5fqHz28VxeE2aIt1vDyxxj1eGRG1Utd9G188cG4xnYT6uc+Z1x4b04/fNSRuodqEL176TP2Ceu1lJqK73ypMmmjBNnFfphN+xVrAWG0bM/Ypkhy6y9yXO6zf/H6LI/Gx21z/ulqZLYcbaq5ROrgx78jV6HLCuRtplQGT2JNcLQX53+JY9lLzwB+rfhSZW7me3SUWOC3QtwAcAA6dFgOARmB+DrI8aC4RIbOpHFLYWwWMGZjZTPt0QvrjSD9s0BBJia7oTX7Fm0vBFRXbWQbos0aS/V/2VymEGezrWZpEIjIBGNKwGERR7ln4ePSX0CMCn7aax19L8ut6LapV1yEWj8Pn27liCa9EEQfOyS507kRm5iSNelUsIxKjgI5DCknpDHTyVEj4OP6KkkmUaOYdevOF3KOUpMf4OBTwqYououpE6qCFLSB4s/mNsJ9M2m6CxCru3pMHRFwUbR4fs1lrnOohw6dZME4WOYCmo0EmFI4bv3QjXsL2zJNyoMZ/DZ8WOT4FS53jPrwsNCN49bco70wLA/hKQOwvhQ/ROmfa9jeJ1qjrR/SQV4KjWT5EhbhLSia6qyVqxH9o3TL26lSzr7FkB6wSO6doebbjmsp3KpL/vIJMbfwZsVk/jMAzeU/HaXGNMVFIfpgOPcwww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(5660300002)(86362001)(9686003)(2906002)(7696005)(122000001)(53546011)(83380400001)(186003)(33656002)(54906003)(26005)(55016003)(110136005)(8936002)(316002)(71200400001)(64756008)(4326008)(8676002)(52536014)(66446008)(66476007)(66556008)(508600001)(76116006)(66946007)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	565a5345-eb47-46c5-6365-08d9fcb62668
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qweVjo0zDOyxn+Lt6kWGbfgsV5vfmoWmhGvUzccAmhy1+0W+I7EU81+Yu+8ClA8NXTlgz+bpIYwhZMIIgcyp8UQIRunRiLsL8KZhOAhTg6JJKbF3pPTik3LU30JoS125qBd8WaZqV0SkbbypoUWFl1+f7SNCzMmZ/gx4aaAogwB0H9qWo0KNZUIGv4XsRvIVQjDoZQ1YITnAO0YTzftF9NX/Z8xBQ/DWqq99dKFr0IMP57fEKd+NDf4KTYVUHoLr48Qi/YBZ8p0eSraWh0CLNW37Zn3A4rvnFfxc5IMgDM/2WdYT+eggi1TATwicnCm+cKnk69zAVy5rLJ6tUodMyWqIxRDMsrmTBTFvesSfMRPyhKycOltZglKUVcjiggomgWr3GWRyKCQyLNBlct7uVekwKCgdfKuSS3bQmZ1jjd6PDOvH4omnjJlv1gQj+RQ2SXnom7Y6R2nTAnWN5n9xxdzlEcg8MNWrym5XUc5AuCN57FHCyrUj1WMZSS2SIswS1Te482rLHWats5Ke5tXzr/GiaCSeR9WWMozP0+QeyFE+weJn89BRNiAy954TAv3R1pqMeMoOnqPF0YKrpBO4i6jdUYRhECRbzptLWZiC3M2KrSPxQxMKFhT6tWu8wGILWVsQAy3NVfoWJVU29tPNizSApwZaQpNFkXXA7xrn6aBsr50zaa46k9Ozn9EIkIbf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(70206006)(316002)(81166007)(55016003)(36860700001)(2906002)(47076005)(8676002)(4326008)(40460700003)(82310400004)(52536014)(8936002)(33656002)(186003)(508600001)(336012)(53546011)(26005)(356005)(5660300002)(6506007)(7696005)(86362001)(9686003)(83380400001)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 01:35:59.8473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9ad8ba-9e7a-4af1-57a4-08d9fcb62bcb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2221

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQz5pyIMuaXpSAxODoyNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBl
bm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgSGVucnkgV2FuZw0KPiA8SGVucnkuV2Fu
Z0Bhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBQcm9wb3NhbCBmb3Ig
UG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJhZnRBDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBP
biAwMi8wMy8yMDIyIDA2OjQzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4g
Pj4gU2VudDogMjAyMuW5tDPmnIgx5pelIDIxOjE3DQo+ID4+IFRvOiBXZWkgQ2hlbiA8V2VpLkNo
ZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4NCj4gPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQmVydHJhbmQg
TWFycXVpcw0KPiA+PiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgUGVubnkgWmhlbmcgPFBl
bm55LlpoZW5nQGFybS5jb20+OyBIZW5yeQ0KPiBXYW5nDQo+ID4+IDxIZW5yeS5XYW5nQGFybS5j
b20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFByb3Bvc2FsIGZvciBQb3J0
aW5nIFhlbiB0byBBcm12OC1SNjQgLSBEcmFmdEENCj4gPj4NCj4gPj4gT24gMDEvMDMvMjAyMiAw
NjoyOSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBIaSBKdWxpZW4sDQo+ID4+DQo+ID4+IEhpLA0K
PiA+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4+PiBTZW50OiAyMDIy5bm0MuaciDI25pel
IDQ6MTINCj4gPj4+PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0
YWJlbGxpbmkNCj4gPj4+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPj4+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4+Pj4gPEJl
cnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29t
PjsgSGVucnkNCj4gPj4gV2FuZw0KPiA+Pj4+IDxIZW5yeS5XYW5nQGFybS5jb20+OyBuZCA8bmRA
YXJtLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBSZTogUHJvcG9zYWwgZm9yIFBvcnRpbmcgWGVuIHRv
IEFybXY4LVI2NCAtIERyYWZ0QQ0KPiA+Pj4+DQo+ID4+Pj4gSGkgV2VpLA0KPiA+Pj4+DQo+ID4+
Pj4gT24gMjUvMDIvMjAyMiAxMDo0OCwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4+Pj4gICDCoMKg
wqDCoCBBcm12OC1SNjQgY2FuIHN1cHBvcnQgbWF4IHRvIDI1NiBNUFUgcmVnaW9ucy4gQnV0IHRo
YXQncw0KPiBqdXN0DQo+ID4+Pj4+PiB0aGVvcmV0aWNhbC4NCj4gPj4+Pj4+PiAgIMKgwqDCoMKg
IFNvIHdlIGRvbid0IHdhbnQgdG8gZGVmaW5lIGBwcl90IG1wdV9yZWdpb25zWzI1Nl1gLCB0aGlz
IGlzDQo+IGENCj4gPj4+PiBtZW1vcnkNCj4gPj4+Pj4+IHdhc3RlDQo+ID4+Pj4+Pj4gICDCoMKg
wqDCoCBpbiBtb3N0IG9mIHRpbWUuIFNvIHdlIGRlY2lkZWQgdG8gbGV0IHRoZSB1c2VyIHNwZWNp
ZnkNCj4gdGhyb3VnaA0KPiA+PiBhDQo+ID4+Pj4+PiBLY29uZmlnDQo+ID4+Pj4+Pj4gICDCoMKg
wqDCoCBvcHRpb24uIGBDT05GSUdfQVJNX01QVV9FTDFfUFJPVEVDVElPTl9SRUdJT05TYCBkZWZh
dWx0DQo+IHZhbHVlDQo+ID4+IGNhbg0KPiA+Pj4+IGJlDQo+ID4+Pj4+PiBgMzJgLA0KPiA+Pj4+
Pj4+ICAgwqDCoMKgwqAgaXQncyBhIHR5cGljYWwgaW1wbGVtZW50YXRpb24gb24gQXJtdjgtUjY0
LiBVc2VycyB3aWxsDQo+ID4+IHJlY29tcGlsZQ0KPiA+Pj4+IFhlbg0KPiA+Pj4+Pj4gd2hlbg0K
PiA+Pj4+Pj4+ICAgwqDCoMKgwqAgdGhlaXIgcGxhdGZvcm0gY2hhbmdlcy4gU28gd2hlbiB0aGUg
TVBVIGNoYW5nZXMsDQo+IHJlc3BlY2lmeWluZw0KPiA+PiB0aGUNCj4gPj4+Pj4+IE1QVQ0KPiA+
Pj4+Pj4+ICAgwqDCoMKgwqAgcHJvdGVjdGlvbiByZWdpb25zIG51bWJlciB3aWxsIG5vdCBjYXVz
ZSBhZGRpdGlvbmFsDQo+IHByb2JsZW1zLg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEkgd29uZGVyIGlm
IHdlIGNvdWxkIHByb2JlIHRoZSBudW1iZXIgb2YgTVBVIHJlZ2lvbnMgYXQgcnVudGltZSBhbmQN
Cj4gPj4+Pj4+IGR5bmFtaWNhbGx5IGFsbG9jYXRlIHRoZSBtZW1vcnkgbmVlZGVkIHRvIHN0b3Jl
IHRoZW0gaW4gYXJjaF92Y3B1Lg0KPiA+Pj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4gV2UgaGF2ZSBj
b25zaWRlcmVkIHRvIHVzZWQgYSBwcl90IG1wdV9yZWdpb25zWzBdIGluIGFyY2hfdmNwdS4gQnV0
DQo+IGl0DQo+ID4+Pj4gc2VlbXMNCj4gPj4+Pj4gd2Ugd2lsbCBlbmNvdW50ZXIgc29tZSBzdGF0
aWMgYWxsb2NhdGVkIGFyY2hfdmNwdSBwcm9ibGVtcyBhbmQNCj4gc2l6ZW9mDQo+ID4+Pj4gaXNz
dWUuDQo+ID4+Pj4NCj4gPj4+PiBEb2VzIGl0IG5lZWQgdG8gYmUgZW1iZWRkZWQgaW4gYXJjaF92
Y3B1PyBJZiBub3QsIHRoZW4gd2UgY291bGQNCj4gPj4gYWxsb2NhdGUNCj4gPj4+PiBtZW1vcnkg
b3V0c2lkZSBhbmQgYWRkIGEgcG9pbnRlciBpbiBhcmNoX3ZjcHUuDQo+ID4+Pj4NCj4gPj4+DQo+
ID4+PiBXZSBoYWQgdGhvdWdodCB0byB1c2UgYSBwb2ludGVyIGluIGFyY2hfdmNwdSBpbnN0ZWFk
IG9mIGVtYmVkZGluZw0KPiA+PiBtcHVfcmVnaW9ucw0KPiA+Pj4gaW50byBhcmNoX3ZjcHUuIEJ1
dCB3ZSBub3RpY2VkIHRoYXQgYXJjaF92Y3B1IGhhcyBhDQo+IF9fY2FjaGVsaW5lX2FsaWduZWQN
Cj4gPj4+IGF0dHJpYnV0ZSwgdGhpcyBtYXkgYmUgYmVjYXVzZSBvZiBhcmNoX3ZjcHUgd2lsbCBi
ZSB1c2VkIHZlcnkNCj4gZnJlcXVlbnRseQ0KPiA+Pj4gaW4gc29tZSBjcml0aWNhbCBwYXRoLiBT
byBpZiB3ZSB1c2UgdGhlIHBvaW50ZXIgZm9yIG1wdV9yZWdpb25zLCBtYXkNCj4gPj4gY2F1c2UN
Cj4gPj4+IHNvbWUgY2FjaGUgbWlzcyBpbiB0aGVzZSBjcml0aWNhbCBwYXRoLCBmb3IgZXhhbXBs
ZSwgaW4gY29udGV4dF9zd3RpY2guDQo+ID4+DQo+ID4+ICAgRnJvbSBteSB1bmRlcnN0YW5kaW5n
LCB0aGUgaWRlYSBiZWhpbmQgYGBjYWNoZWxpbmVfYWxpZ25lZGBgIGlzIHRvDQo+ID4+IGF2b2lk
IHRoZSBzdHJ1Y3QgdmNwdSB0byBiZSBzaGFyZWQgd2l0aCBvdGhlciBkYXRhc3RydWN0dXJlLiBP
dGhlcndpc2UNCj4gPj4geW91IG1heSBlbmQgdXAgdG8gaGF2ZSB0d28gcENQVXMgdG8gZnJlcXVl
bnRseSB3cml0ZSB0aGUgc2FtZSBjYWNoZWxpbmUNCj4gPj4gd2hpY2ggaXMgbm90IGlkZWFsLg0K
PiA+Pg0KPiA+PiBhcmNoX3ZjcHUgc2hvdWxkIGVtYmJlZCBhbnl0aGluZyB0aGF0IHdpbGwgYmUg
YWNjZXNzZWQgb2Z0ZW4gKGUuZy4NCj4gPj4gZW50cnkvZXhpdCkgdG8gY2VydGFpbiBwb2ludC4g
Rm9yIGluc3RhbmNlLCBub3QgZXZlcnl0aGluZyByZWxhdGVkIHRvDQo+ID4+IHRoZSB2R0lDIGFy
ZSBlbWJiZWQgaW4gdGhlIHZDUFUvRG9tYWluIHN0cnVjdHVyZS4NCj4gPj4NCj4gPj4gSSBhbSBh
IGJpdCBzcGxpdCByZWdhcmRpbmcgdGhlIG1wdV9yZWdpb25zLiBJZiB0aGV5IGFyZSBtYWlubHkg
dXNlZCBpbg0KPiA+PiB0aGUgY29udGV4dF9zd2l0Y2goKSB0aGVuIEkgd291bGQgYXJndWUgdGhp
cyBpcyBhIHByZW1hdHVyZQ0KPiBvcHRpbWl6YXRpb24NCj4gPj4gYmVjYXVzZSB0aGUgc2NoZWR1
bGluZyBkZWNpc2lvbiBpcyBwcm9iYWJseSBnb2luZyB0byB0YWtlIGEgbG90IG1vcmUNCj4gPj4g
dGltZSB0aGFuIHRoZSBjb250ZXh0IHN3aXRjaCBpdHNlbGYuDQo+ID4NCj4gPiBtcHVfcmVnaW9u
cyBpbiBhcmNoX3ZjcHUgYXJlIHVzZWQgdG8gc2F2ZSBndWVzdCdzIEVMMSBNUFUgY29udGV4dC4g
U28sDQo+IHllcywNCj4gPiB0aGV5IGFyZSBtYWlubHkgdXNlZCBpbiBjb250ZXh0X3N3aXRjaC4g
SW4gdGVybXMgb2YgdGhlIG51bWJlciBvZg0KPiByZWdpc3RlcnMsDQo+ID4gaXQgd2lsbCBzYXZl
L3Jlc3RvcmUgbW9yZSB3b3JrIHRoYW4gdGhlIG9yaWdpbmFsIFY4QS4gQW5kIG9uIFY4UiB3ZSBh
bHNvDQo+IG5lZWQNCj4gPiB0byBrZWVwIG1vc3Qgb2YgdGhlIG9yaWdpbmFsIFY4QSBzYXZlL3Jl
c3RvcmUgd29yay4gU28gaXQgd2lsbCB0YWtlDQo+IGxvbmdlcg0KPiA+IHRoYW4gdGhlIG9yaWdp
bmFsIFY4QSBjb250ZXh0X3N3aXRjaC4gQW5kIEkgdGhpbmsgdGhpcyBpcyBkdWUgdG8NCj4gYXJj
aGl0ZWN0dXJlJ3MNCj4gPiBkaWZmZXJlbmNlLiBTbyBpdCdzIGltcG9zc2libGUgZm9yIHVzIG5v
dCB0byBzYXZlL3Jlc3RvcmUgRUwxIE1QVSByZWdpb24NCj4gPiByZWdpc3RlcnMgaW4gY29udGV4
dF9zd2l0Y2guIEFuZCB3ZSBoYXZlIGRvbmUgc29tZSBvcHRpbWl6YXRpb24gZm9yIEVMMQ0KPiBN
UFUNCj4gPiBzYXZlL3Jlc3RvcmU6DQo+ID4gMS4gQXNzZW1ibHkgY29kZSBmb3IgRUwxIE1QVSBj
b250ZXh0X3N3aXRjaA0KPiANCj4gVGhpcyBkaXNjdXNzaW9uIHJlbWluZHMgbWUgd2hlbiBLVk0g
ZGVjaWRlZCB0byByZXdyaXRlIHRoZWlyIGNvbnRleHQNCj4gc3dpdGNoIGZyb20gYXNzZW1ibHkg
dG8gQy4gVGhlIG91dGNvbWUgd2FzIHRoZSBjb21waWxlciBpcyBhYmxlIHRvIGRvIGENCj4gYmV0
dGVyIGpvYiB0aGFuIHVzIHdoZW4gaXQgY29tZXMgdG8gb3B0aW1pemluZy4NCj4gDQo+IFdpdGgg
YSBDIHZlcnNpb24sIHdlIGNvdWxkIGFsc28gc2hhcmUgdGhlIHNhdmUvcmVzdG9yZSBjb2RlIHdp
dGggMzItYml0DQo+IGFuZCBpdCBpcyBlYXNpZXIgdG8gcmVhZC9tYWludGFpbi4NCj4gDQo+IFNv
IEkgd291bGQgc3VnZ2VzdCB0byBydW4gc29tZSBudW1iZXJzIHRvIGNoZWNrIGlmIGl0IHJlYWxs
eSB3b3J0aA0KPiBpbXBsZW1lbnRpbmcgdGhlIE1QVSBzYXZlL3Jlc3RvcmUgaW4gYXNzZW1ibHku
DQo+IA0KDQpJdCdzIGludGVyZXN0aW5nIHRvIGhlYXIgS1ZNIGd1eXMgaGF2ZSBzaW1pbGFyIGRp
c2N1c3Npb24uIFllcywgaWYgdGhlDQpnYWlucyBvZiBhc3NlbWJseSBjb2RlIGlzIG5vdCB2ZXJ5
IG9idmlvdXMsIHRoZW4gcmV1c2luZyB0aGUgY29kZSBmb3IgMzItYml0DQp3b3VsZCBiZSBtb3Jl
IGltcG9ydGFudC4gQXMgb3VyIGN1cnJlbnQgcGxhdGZvcm0gKEZWUCkgY291bGQgbm90IGRvIHZl
cnkNCnByZWNpc2UgcGVyZm9ybWFuY2UgbWVhc3VyZW1lbnQuIEkgd2FudCB0byBrZWVwIGN1cnJl
bnQgYXNzZW1ibHkgY29kZSB0aGVyZSwNCndoZW4gd2UgaGF2ZSBhIHBsYXRmb3JtIHRoYXQgY2Fu
IGRvIHN1Y2ggbWVhc3VyZW1lbnQgd2UgY2FuIGhhdmUgYSB0aHJlYWQNCnRvIGRpc2N1c3MgaXQu
DQoNCj4gPiAyLiBVc2UgcmVhbCBNUFUgcmVnaW9ucyBudW1iZXIgaW5zdGVhZCBvZg0KPiBDT05G
SUdfQVJNX01QVV9FTDFfUFJPVEVDVElPTl9SRUdJT05TDQo+ID4gICAgIGluIGNvbnRleHRfc3dp
dGNoLiBDT05GSUdfQVJNX01QVV9FTDFfUFJPVEVDVElPTl9SRUdJT05TIGlzIGRlZmluZWQNCj4g
dGhlIE1heA0KPiA+ICAgICBzdXBwb3J0ZWQgRUwxIE1QVSByZWdpb25zIGZvciB0aGlzIFhlbiBp
bWFnZS4gQWxsIHBsYXRmb3JtcyB0aGF0DQo+IGltcGxlbWVudA0KPiA+ICAgICBFTDEgTVBVIHJl
Z2lvbnMgaW4gdGhpcyByYW5nZSBjYW4gd29yayB3ZWxsIHdpdGggdGhpcyBYZW4gSW1hZ2UuIEJ1
dA0KPiBpZiB0aGUNCj4gPiAgICAgaW1wbGVtZW50ZWQgRUwxIE1QVSByZWdpb24gbnVtYmVyIGV4
Y2VlZHMNCj4gQ09ORklHX0FSTV9NUFVfRUwxX1BST1RFQ1RJT05fUkVHSU9OUywNCj4gPiAgICAg
dGhpcyBYZW4gaW1hZ2UgY291bGQgbm90IHdvcmsgd2VsbCBvbiB0aGlzIHBsYXRmb3JtLg0KPiAN
Cj4gVGhpcyBzb3VuZHMgc2ltaWxhciB0byB0aGUgR0lDdjMuIFRoZSBudW1iZXIgb2YgTFJzIGRl
cGVuZHMgb24gdGhlDQo+IGhhcmR3YXJlLiBTZWUgaG93IHdlIGRlYWx0IHdpdGggaXQgaW4gZ2lj
djNfc2F2ZV9scnMoKS4NCj4NCg0KVGhpcyBpcyBhIGdvb2Qgc3VnZ2VzdGlvbiwgd2Ugd2lsbCBj
aGVjayB0aGUgR0lDIGNvZGUuDQoNCj4gPg0KPiA+Pg0KPiA+PiBOb3RlIHRoYXQgZm9yIHRoZSBQ
Mk0gd2UgYWxyZWFkeSBoYXZlIHRoYXQgaW5kaXJlY3Rpb24gYmVjYXVzZSBpdCBpcw0KPiA+PiBl
bWJiZWQgaW4gdGhlIHN0cnVjdCBkb21haW4uDQo+ID4NCj4gPiBJdCdzIGRpZmZlcmVudCB3aXRo
IFY4QSBQMk0gY2FzZS4gSW4gVjhBIGNvbnRleHRfc3dpdGNoIHdlIGp1c3QgbmVlZCB0bw0KPiA+
IHNhdmUvcmVzdG9yZSBWVFRCUiwgd2UgZG9uJ3QgbmVlZCB0byBkbyBQMk0gdGFibGUgd2Fsay4g
QnV0IG9uIFY4Uiwgd2UNCj4gPiBuZWVkIHRvIGFjY2VzcyB2YWxpZCBtcHVfcmVnaW9ucyBmb3Ig
c2F2ZS9yZXN0b3JlLg0KPiANCj4gVGhlIHNhdmUvcmVzdG9yZSBmb3IgdGhlIFAyTSBpcyBhIGJp
dCBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gc2ltcGx5DQo+IHNhdmUvcmVzdG9yZSB0aGUgVlRUQlIu
IEJ1dCB5ZXMsIEkgYWdyZWUgdGhlIGNvZGUgZm9yIHRoZSBNUFUgd2lsbA0KPiBsaWtlbHkgYmUg
bW9yZSBjb21wbGljYXRlZC4NCj4gDQo+ID4NCj4gPj4NCj4gPj4gVGhpcyByYWlzZXMgb25lIHF1
ZXN0aW9uLCB3aHkgaXMgdGhlIE1QVXMgcmVnaW9ucyB3aWxsIGJlIHBlci12Q1BVDQo+ID4+IHJh
dGhlciBwZXIgZG9tYWluPw0KPiA+Pg0KPiA+DQo+ID4gQmVjYXVzZSB0aGVyZSBpcyBhIEVMMSBN
UFUgY29tcG9uZW50IGZvciBlYWNoIHBDUFUuIFdlIGNhbid0IGFzc3VtZQ0KPiBndWVzdA0KPiA+
IHRvIHVzZSB0aGUgc2FtZSBFTDEgTVBVIGNvbmZpZ3VyYXRpb24gZm9yIGFsbCB2Q1BVLg0KPiAN
Cj4gQWguIFNvcnJ5LCBJIHRob3VnaHQgeW91IHdlcmUgcmVmZXJyaW5nIHRvIHdoYXRldmVyIFhl
biB3aWxsIHVzZSB0bw0KPiBwcmV2ZW50IHRoZSBndWVzdCBhY2Nlc3Npbmcgb3V0c2lkZSBvZiBp
dHMgZGVzaWduYXRlZCByZWdpb24uDQo+IA0KDQpOUCA6ICkNCg0KVGhhbmtzLA0KV2VpIENoZW4N
Cg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

