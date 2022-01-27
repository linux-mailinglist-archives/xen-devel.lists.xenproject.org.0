Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E889749DD61
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261345.452398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0mu-00025d-Mp; Thu, 27 Jan 2022 09:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261345.452398; Thu, 27 Jan 2022 09:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0mu-00022O-Ie; Thu, 27 Jan 2022 09:09:52 +0000
Received: by outflank-mailman (input) for mailman id 261345;
 Thu, 27 Jan 2022 09:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0mt-00022I-Fo
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:09:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e15d49c5-7f50-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 10:09:50 +0100 (CET)
Received: from AM5PR0601CA0045.eurprd06.prod.outlook.com
 (2603:10a6:203:68::31) by DB7PR08MB3434.eurprd08.prod.outlook.com
 (2603:10a6:10:42::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Thu, 27 Jan
 2022 09:09:43 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::94) by AM5PR0601CA0045.outlook.office365.com
 (2603:10a6:203:68::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 09:09:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 09:09:42 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Thu, 27 Jan 2022 09:09:42 +0000
Received: from 3ab5192ca902.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C19422F0-AD2A-4132-A936-594F9B80E01C.1; 
 Thu, 27 Jan 2022 09:09:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ab5192ca902.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 09:09:32 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 09:09:29 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:09:28 +0000
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
X-Inumbo-ID: e15d49c5-7f50-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SssAtDPU01TrkZTQwdoBBqNpjX+VrpzLtcBMiMqwRMc=;
 b=Ebvf2JVd651D0PBwSys3hvnvKtd9fXOCoWoCFGNLqh/S59VkEJNR3DuKL+sWCSsDp6mxQYOCNhdQYa5KgGQGETOnWTOeJC57l14xqjg7HDr0pduZGdOn4+R5MRSfH5ZDu665V+brhAISkcYsc8DC5lJUVgCuMJM3GcETQNYyTZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2Your5wjcvjrWMKfqb5yUcrIFav1rK4a5TTeaBXpG0jP/+1NPybHDHzn/K3IMzBiTKu7eY7fzj/5niL4HOxVaWgBTDcFMhmFzpypm0j1qzDW5njBnVt1Z6V6O0xTmUJBe95xpGpE9Vl8DKNpgsKlLf8I1UXHt3UbCw59D7SVTpZ7EGPxqpwwGwhwA3hxiz13N0UPt/Q1Qh4oVX92IRa7jolQ0/9nzEldQ60xt49VKCKMz7YBZ9plRKZBUng5PrEIqPZ8OcJqVS54vGMVsF1ra6i6BDT74z91EF9u62iAl0nJElp+j6P7rg1PP7YbZa+y0iJ5JD0pIoQ9OCUtsgghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SssAtDPU01TrkZTQwdoBBqNpjX+VrpzLtcBMiMqwRMc=;
 b=cYXfkB4tZh+Y/A3szHvpl/xfr6A8HKZslB0XNTTq/B/zG+yWQ9cd9o+wETDWU+E/9vZFnlS4zeFR4yalxLPLKi6bro4aP1inBVcKAFXXiKyJewaFVrNdCPUHKbM1fGIitREMbDkhzFTwLYpKTLANS43ZD57ZIhOj+5/Arnq+sKSNKBmANvJ2j27QC8swGnZSOFOUmGgXp5sNImE3sNfViciOQ1CViutoU3gcmYAfhCadb9BpHltjHjIoUqF9nSWFOkYHM3ifEIswZ0DW9F3DLMeEdrJKGoJrnMnSnar/K4Pr6Tw3+IgmDEjciU+KMwIpUhXJ3eGQwnqi5phtSnLcGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SssAtDPU01TrkZTQwdoBBqNpjX+VrpzLtcBMiMqwRMc=;
 b=Ebvf2JVd651D0PBwSys3hvnvKtd9fXOCoWoCFGNLqh/S59VkEJNR3DuKL+sWCSsDp6mxQYOCNhdQYa5KgGQGETOnWTOeJC57l14xqjg7HDr0pduZGdOn4+R5MRSfH5ZDu665V+brhAISkcYsc8DC5lJUVgCuMJM3GcETQNYyTZs=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index: AQHXsHMtR+l18+MmpE6rl/RjSXTBgqx0TXyAgAME0ECAAAH2oIAAA3YAgAAA4bA=
Date: Thu, 27 Jan 2022 09:09:28 +0000
Message-ID:
 <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
In-Reply-To: <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F4E5441351A38E4EABB6FE42377AE5A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8d098645-6dea-4b0e-dbac-08d9e174c17b
x-ms-traffictypediagnostic:
	DB7PR08MB3594:EE_|AM5EUR03FT052:EE_|DB7PR08MB3434:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3434736D9F9ADDC48FCD4E499E219@DB7PR08MB3434.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qY7v4omuRn2pfMB03sxU0BN6+mr45y7fQwzs7wFzQvXkbqUV28FzYcAMhBF/5VdCspL0k6jaq1qF1KeeU5AgiXIv/+40+f7I/fsrA9V+bfiwS0+Wy0JukcLDom9oYn7tHCdw6Yryy8lXBu0VBVu4qICVZeU/FIICM9G0yAmWCLzdWq8y2m6wfGwUflUGHS8E7ov55Kt680oecmpQfrM8oHbZA/WvYjJsKMfWRORH0AdN6YfecnJbDqRCwmoFC5Fgb9WAPAzJUqGOi8257AOOgVB2uQ0sya0ZPFk9xTvCm7tvc5J5BokABgMxahzEmzvp/wx+9VbXkpArMt8kyegwbiW/HP4XG/5YR0Xt0XdpCKOqEG8TG4a7Zv3EbIjCrWE94kb1Kezfm6wkvTPywa1gxhnQyubDkAiGQs1VmYd57QwHgOCjg0c+bKtCysFk8o1B6TqRdasJDKwLb5EwFMTCO1co+67Usu5+2HGm17fn5UTRJnbgTY+av2PXFq8dZhhj+mkLK0tXecH+KfZ3MH92rrUojpW252zWMFkqS5fpEawDY/ut3ucE6f4L/pkK6xYoqbr/cktyLmhTv35gfDUvp33LnlMZMdY+C9faOlKq7odiS8oKzC/XG4iZZbQdK7Ugytwe1xa/Og2BMAnHJ9ZatyD9Z9OwylSem393MkCnkZ5emXVEQtvVz8UGYsuZeml0bvHLFyrGmdonu9j9N3yPHw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(9686003)(52536014)(66446008)(7696005)(54906003)(316002)(122000001)(55016003)(66556008)(8936002)(64756008)(66946007)(83380400001)(38100700002)(6506007)(86362001)(71200400001)(4326008)(33656002)(53546011)(66476007)(186003)(6916009)(508600001)(8676002)(26005)(5660300002)(76116006)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d27c81f8-e71d-4761-0858-08d9e174b911
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f9DnHXVDuvOBFGV22afvl1Z8aIrM9ZOzG2Xom9JbBDawJFua12fmtTGim+JpoNonjVXqr/ygLiZTm9sAnc9LU0gxe4ygPdsZN5E3Lm6aeuJ/yJNKioHu457MTz4QlFlJzaP4lg/0WO99Q+OLNKFcKQTOzyJcOnudpv/Atuynsa8fO8FQLhgDPUzsVkn9E/4SbxcvmcYaCyT2DWD8HmImPU9QmrL4ghFFjnAWKjJr5VMkdT1mFDKrSxJN0qWf2IJXu/nlvPV3VTvO6N/P7E6w4d3cS8yz4LxJqZQqHrvEI5FukonudSjdsiYy2vWUI5kB917qJhkrbINSmVS8yXeFcSn5MWsIv/5YFVa5SJzujAS8cox7V+Tk6FurajA8m8NnetytHLkjKc4ufRFEvNZ7S30u/mUJ4D4ecQaMEG2/SudlMer/RCnsJ4qzxBH7wxY2ql1OdfXHcyShX+dL42McFL/GWDaRNAkyvjIThh+oZxn/iaW8FyDSknPAslky+FCNLky6j1jngcyd/Tecv0Mw48QZWqccOviKxxD1iansjf1v+JWwNr5wHIdq1Znw9dc3pNxicQtxbXrELICyXRHDUOkQYvmBFd8RvmBePOxDU7H1M4c6VIEaIMTgJLG1rDN0rNMWTLq7OQee1B2lA6eX8JunK8/reZBN8QWKE5OuFM/9F3eQib0J08lclAD6C2r15z2I4KQH99KBONFZb/54fzHEdirkIPb+8pzqiMDcJDC/xNqbETBK5wTDeS2Vxd4to2uLEbSIGh7PNR3WKqlcGg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(7696005)(83380400001)(6862004)(356005)(26005)(81166007)(55016003)(52536014)(54906003)(2906002)(4326008)(508600001)(8676002)(82310400004)(33656002)(40460700003)(5660300002)(186003)(36860700001)(336012)(70206006)(86362001)(47076005)(316002)(6506007)(8936002)(53546011)(9686003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:09:42.7472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d098645-6dea-4b0e-dbac-08d9e174c17b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3434

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyN+aXpSAxNzowMA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIwLzM3XSB4ZW46IGludHJvZHVjZSBDT05GSUdfRUZJIHRvIHN0dWIgQVBJ
IGZvciBub24tDQo+IEVGSSBhcmNoaXRlY3R1cmUNCj4gDQo+IE9uIDI3LjAxLjIwMjIgMDk6NTEs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2Vz
QGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gV2VpDQo+ID4+IENoZW4NCj4g
Pj4gU2VudDogMjAyMuW5tDHmnIgyN+aXpSAxNjo0NQ0KPiA+Pg0KPiA+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAx
ODozNQ0KPiA+Pj4NCj4gPj4+IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+Pj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+Pj4+ICsrKyBiL3hlbi9jb21tb24v
S2NvbmZpZw0KPiA+Pj4+IEBAIC0xMSw2ICsxMSwxNiBAQCBjb25maWcgQ09NUEFUDQo+ID4+Pj4g
IGNvbmZpZyBDT1JFX1BBUktJTkcNCj4gPj4+PiAgCWJvb2wNCj4gPj4+Pg0KPiA+Pj4+ICtjb25m
aWcgRUZJDQo+ID4+Pj4gKwlib29sDQo+ID4+Pj4gKwktLS1oZWxwLS0tDQo+ID4+Pj4gKyAgICAg
IFRoaXMgb3B0aW9uIHByb3ZpZGVzIHN1cHBvcnQgZm9yIHJ1bnRpbWUgc2VydmljZXMgcHJvdmlk
ZWQNCj4gPj4+PiArICAgICAgYnkgVUVGSSBmaXJtd2FyZSAoc3VjaCBhcyBub24tdm9sYXRpbGUg
dmFyaWFibGVzLCByZWFsdGltZQ0KPiA+Pj4+ICsgICAgICBjbG9jaywgYW5kIHBsYXRmb3JtIHJl
c2V0KS4gQSBVRUZJIHN0dWIgaXMgYWxzbyBwcm92aWRlZCB0bw0KPiA+Pj4+ICsgICAgICBhbGxv
dyB0aGUga2VybmVsIHRvIGJlIGJvb3RlZCBhcyBhbiBFRkkgYXBwbGljYXRpb24uIFRoaXMNCj4g
Pj4+PiArICAgICAgaXMgb25seSB1c2VmdWwgZm9yIGtlcm5lbHMgdGhhdCBtYXkgcnVuIG9uIHN5
c3RlbXMgdGhhdCBoYXZlDQo+ID4+Pj4gKyAgICAgIFVFRkkgZmlybXdhcmUuDQo+ID4+Pg0KPiA+
Pj4gVGhlIHdheSBlbmFibGluZyBvZiAoZnVsbCkgRUZJIHN1cHBvcnQgd29ya3Mgb24geDg2LCBJ
IGNvbnNpZGVyIGl0DQo+ID4+PiB3cm9uZyAvIG1pc2xlYWRpbmcgdG8gcHV0IHRoZSBvcHRpb24g
aW4gY29tbW9uIGNvZGUuIEF0IHRoZSB2ZXJ5IGxlYXN0DQo+ID4+PiB0aGUgaGVscCB0ZXh0IHdv
dWxkIG5lZWQgdG8gY2FsbCBvdXQgdGhlIGV4dHJhIGRlcGVuZGVuY2llcy4gUGx1cyB0aGUNCj4g
Pj4+IGhlbHAgdGV4dCBvZiBjb3Vyc2UgdGhlbiBuZWVkcyB0byBiZSBnZW5lcmljIChpLmUuIGFw
cGxpY2FibGUgdG8gYm90aA0KPiA+Pj4gQXJtIGFuZCB4ODYpLiBUaGF0J3Mgbm90d2l0aHN0YW5k
aW5nIHRoZSBmYWN0IHRoYXQgd2l0aG91dCBhIHByb21wdA0KPiA+Pj4gdGhlIGhlbHAgdGV4dCB3
b24ndCBldmVyIGJlIHNlZW4gd2hpbGUgY29uZmlndXJpbmcgWGVuLg0KPiA+Pj4NCj4gPj4+IEFs
c28gKG5pdCk6IEluZGVudGF0aW9uLiBBbmQgcGxlYXNlIGRvbid0IHVzZSAtLS1oZWxwLS0tIGFu
eW1vcmUgaW4NCj4gPj4+IG5ldyBjb2RlLg0KPiA+Pj4NCj4gPj4NCj4gPj4gSSBoYXZlIHVzZWQg
Q09ORklHX0FSTV9FRkkgdG8gcmVwbGFjZSB0aGlzIGNvbW1vbiBFRkkgY29uZmlnIGluIG15DQo+
ID4+IGxhdGVzdCB2ZXJzaW9uLiBUaGlzIEtjb25maWcgb3B0aW9uIGhhcyBiZWVuIHJlbW92ZWQu
DQo+ID4+IEFuZCB0aGFua3MsIEkgd2lsbCBub3QgdXNlIC0taGVscC0tIGFueW1vcmUuDQo+ID4+
DQo+ID4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2VmaS5oDQo+ID4+Pj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2VmaS5oDQo+ID4+Pj4gQEAgLTI1LDYgKzI1LDggQEAgZXh0ZXJuIHN0cnVjdCBl
ZmkgZWZpOw0KPiA+Pj4+DQo+ID4+Pj4gICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ID4+Pj4NCj4g
Pj4+PiArI2lmZGVmIENPTkZJR19FRkkNCj4gPj4+PiArDQo+ID4+Pj4gIHVuaW9uIHhlbnBmX2Vm
aV9pbmZvOw0KPiA+Pj4+ICB1bmlvbiBjb21wYXRfcGZfZWZpX2luZm87DQo+ID4+Pj4NCj4gPj4+
PiBAQCAtNDUsNiArNDcsOCBAQCBpbnQgZWZpX3J1bnRpbWVfY2FsbChzdHJ1Y3QgeGVucGZfZWZp
X3J1bnRpbWVfY2FsbA0KPiA+PiAqKTsNCj4gPj4+PiAgaW50IGVmaV9jb21wYXRfZ2V0X2luZm8o
dWludDMyX3QgaWR4LCB1bmlvbiBjb21wYXRfcGZfZWZpX2luZm8gKik7DQo+ID4+Pj4gIGludCBl
ZmlfY29tcGF0X3J1bnRpbWVfY2FsbChzdHJ1Y3QgY29tcGF0X3BmX2VmaV9ydW50aW1lX2NhbGwg
Kik7DQo+ID4+Pj4NCj4gPj4+PiArI2VuZGlmIC8qIENPTkZJR19FRkkqLw0KPiA+Pj4NCj4gPj4+
IEkgY2FuIHNlZSB0aGF0IGluIHRoZSBsYXRlciBwYXRjaCwgd2hlbiBpbnRyb2R1Y2luZyBpbmxp
bmUgc3R1YnMsDQo+ID4+PiB5b3Ugd291bGQgbmVlZCBjb25kaXRpb25hbHMgaGVyZSwgYnV0IEkg
ZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhlbQ0KPiA+Pj4gcmlnaHQgaGVyZSAob3IgeW91IG1heSB3
YW50IHRvIGludHJvZHVjZSB0aGUgc3R1YnMgcmlnaHQgYXdheSkuDQo+ID4+Pg0KPiA+Pj4gQWxz
byAobml0KTogTWlzc2luZyBibGFuayBpbiB0aGUgY29tbWVudC4NCj4gPg0KPiA+IEkgYW0gc29y
cnksIEkgaGFkIG1pc3NlZCB0aGlzIGNvbW1lbnQuIEluIG15IGxhdGVzdCBjaGFuZ2VzLA0KPiA+
IEkgaGF2ZSBpbnRyb2R1Y2VkIGEgc3R1YiBmaWxlIGZvciBub24tRUZJIGFyY2hpdGVjdHVyZXMu
DQo+ID4gVGhlIHJlYXNvbiB3aHkgd2UgZG9uJ3QgdXNlIGEgbWFjcm8gdG8gc3R1YiB0aGUgaGVs
cGVycw0KPiA+IGluIGVmaS5oIGlzIHRoYXQsIHNvbWUgYXJjaGl0ZWN0dXJlcyBoYXZlIGltcGxl
bWVudGVkIHN0dWINCj4gPiBoZWxwZXJzIGluIHRoZWlyIHN0dWIuYy4gSWYgd2UgZGVmaW5lIHN0
dWIgaGVscGVycyBpbg0KPiA+IGVmaS5oLCB0aGlzIHdpbGwgY2F1c2UgZnVuY3Rpb24gcmVkZWZp
bml0aW9uIGVycm9yLiBXZSBuZWVkDQo+ID4gdG8gZml4IHRoaXMgZXJyb3IgZm9yIGFsbCBhcmNo
aXRlY3R1cmVzLiBBbmQgc29tZSBoZWxwZXJzDQo+ID4gaXMgbm90IGVhc3kgdG8gaW1wbGVtZW50
IGFzIGEgaW5saW5lIGZ1bmN0aW9uIGluIGVmaS5oLg0KPiA+IFNvIHdlIHVzZSBzdHViIGZpbGUg
aW5zdGVhZCBvZiBzdHViaW5nIGluIGVmaS5oDQo+IA0KPiBCdXQgeW91IHJlYWxpemUgd2UgYWxy
ZWFkeSBoYXZlIHN1Y2ggYSBzdHViIGZpbGUgb24geDg2Pw0KPiANCg0KWWVzLCB3ZSBmb3VuZCB0
aGUgcmVkZWZpbml0aW9uIGVycm9ycyB0aGF0IGFyZSBjYXVzZWQgYnkgeDg2IHN0dWIgZmlsZQ0K
YW5kIG5ldyBtYWNyb3MgaW4gc3R1Yi5oLiBXZSBoYWQgdHJpZXMgdG8gYWRkOg0KaWZlcSAoJChY
RU5fQlVJTERfRUZJKSx5KQ0KQ0ZMQUdTLXkgKz0gLURYRU5fQlVJTERfRUZJDQpYRU5fQ0ZMQUdT
ICs9IC1EWEVOX0JVSUxEX0VGSQ0KZW5kaWYNCng4Ni9NYWtlZmlsZSB0byBnYXRlIHRoZXNlIG5l
dyBtYWNyb3MsIGJ1dCBpdCBzZWVtcyB0aGF0IHdlIG1heSBuZWVkDQp0byBjaGFuZ2UgRUZJIGJ1
aWxkIGxvZ2ljIGZvciB4ODYuIEl0IHdpbGwgY2F1c2UgbW9yZSByaXNrcyBmb3IgbWUuDQpTbyBJ
IHdhbnQgdG8gaW50cm9kdWNlIGEgc2ltaWxhciBzdHViLmMgaW4gYXJjaC9hcm0uDQoNCg0KPiBK
YW4NCg0K

