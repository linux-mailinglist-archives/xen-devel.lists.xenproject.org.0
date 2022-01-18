Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99418492293
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 10:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258414.444974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kfd-0005I5-Is; Tue, 18 Jan 2022 09:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258414.444974; Tue, 18 Jan 2022 09:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kfd-0005GF-F8; Tue, 18 Jan 2022 09:20:53 +0000
Received: by outflank-mailman (input) for mailman id 258414;
 Tue, 18 Jan 2022 09:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K2lf=SC=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1n9kfc-0005G5-GX
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 09:20:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7d00::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea71a14e-783f-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 10:20:51 +0100 (CET)
Received: from DU2PR04CA0158.eurprd04.prod.outlook.com (2603:10a6:10:2b0::13)
 by AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 09:20:43 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::33) by DU2PR04CA0158.outlook.office365.com
 (2603:10a6:10:2b0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Tue, 18 Jan 2022 09:20:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 09:20:42 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Tue, 18 Jan 2022 09:20:42 +0000
Received: from fc43cc23d167.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F2ADC25-59F5-4FA8-AA28-C9B843B62A96.1; 
 Tue, 18 Jan 2022 09:20:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc43cc23d167.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jan 2022 09:20:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6363.eurprd08.prod.outlook.com (2603:10a6:10:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 09:20:28 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Tue, 18 Jan 2022
 09:20:27 +0000
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
X-Inumbo-ID: ea71a14e-783f-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgKBSZI6WBu4A1igR03S/OdhhRxqqrR7ly1AKYJ1Noo=;
 b=j9oojzSF/tgv4seBnw3JslISlAsmThpDmYXa7xfOI3eMeKAl9n2+Dw6FZTjIGUrdgA/uxzXs2bVv18P612mZPHhclkZx32tqr7OhHO9RDOU5KbcyhwX6HowOVETKQ83SBcq34gn25E7N9amSRPO27AmxHfupyL+ZOve1MX45lK8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW1M3QTPEHcGUc6S31H1yZh+U1epA9QyhB/wsf1GzoIXxVFynldmlkNHwa3MQsf6YiwBVLeguyrdPa6xUtdglAu3uXLjEOyJg6ZXkGGWP2vMgoRwRvTcDgxFuGBGxWCIL9KP4Z+T8v+qQ13C6H70IVB9VUTNS/Kn10gQ9mwetg6F/8PXaQQ0wsr5Zd33GSC8uui1zQ+lYz7GChTpaZHs8d/o0ud2OgVCgm3ufbGdlfN07BQ86qj3LQNrStMoi90+x/u9IAh1Z+fnil8+qG/h5g59OAG57dkMpOEJZHcdrD4EZ6xp6t/04Qia1jq62se89uaffiSX0/Han65IlcS11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgKBSZI6WBu4A1igR03S/OdhhRxqqrR7ly1AKYJ1Noo=;
 b=f6R5AYnGA+Cepv55Rarwl46+tDMsjs47e7SWopwm9+PD9pQb4bTEmYTeEkeY4iKmJO3zJdlukLXuRdqtaN+BRuKIY1j1bAIhROM46L+1fNS4/SsYAJcxuUSo8kZPvpltPG32ualu/iqW4bu1A2WQPG3880xM5BtOl0vlx9W8ZxvzYZ8QO+n3iMoML0iDOIMzsrIA5n5e2oOOMCL9PwaBE+2vh8HAmOqjH14Df6Es1n/K1srrerPKgeXk7wk9pniHzkmRZMJ13l3tBl35KV6ROt2uasNfjqiqVtaksdgn7rL/SEpa3sLMakAUyJo+mZ4U1VryfsXBHymuU5auElkiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgKBSZI6WBu4A1igR03S/OdhhRxqqrR7ly1AKYJ1Noo=;
 b=j9oojzSF/tgv4seBnw3JslISlAsmThpDmYXa7xfOI3eMeKAl9n2+Dw6FZTjIGUrdgA/uxzXs2bVv18P612mZPHhclkZx32tqr7OhHO9RDOU5KbcyhwX6HowOVETKQ83SBcq34gn25E7N9amSRPO27AmxHfupyL+ZOve1MX45lK8=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Topic: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Index: AQHXsHMGx8xGhif/FUCDSa9NS/fSLqxoGKiAgAD49HCAABTIAIAACXAA
Date: Tue, 18 Jan 2022 09:20:27 +0000
Message-ID:
 <PAXPR08MB7420FE209E822108AB1B41E19E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
 <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
In-Reply-To: <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3F3ABE64025B194AB6CBA235F5DCB5A9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a733bc4f-fc65-4623-4b61-08d9da63cd3c
x-ms-traffictypediagnostic:
	DB9PR08MB6363:EE_|DB5EUR03FT060:EE_|AM0PR08MB3682:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB368229BCE17F52A7C40E5BBF9E589@AM0PR08MB3682.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C2O9skU5sRQezE9eInq0BcmEKrzNz25zp27RmP1qJNuGEJOeGotKMzNrIfw0oTpAC0KupaULV5tEYRQ0+cNDmqZGb4MAC7C7Ewt8c0M85BUGiDNbsNpk9j0/24ow8AjUdYEHjYkTReY7H6b8TpVPjpePGl9IQiK3PLwHHOP+GMGFNWG403YWYIgiUBy+uWG4cpgbF2BookDJFHtYNwMR1Wv6jATjBaTr70R0UDpDauZvn9ZMKsI7M5ura/31MfoVsQvU1QQ3J0p/Gyl9NlEJy06CDWBFsMnuvQjIcTJZX96Ri6LUk7kV5QBWx2hJvEIbATSrL0BWDVZjJiJC0hV8+UTZ5W7RVSoPKTqqNPnbh9R638yUcGteNaGeLLVuFLMB7h3ZKWTwGErn9J+Yi9wCfXPSqVY/u6cknZyCEcyK9IWtkXskNCqei5/Lf854q6BSKfvWN/Jwq/FhJmVTMcMjfLMsMAno5r9IWAfvlpQ14+wGeOxe3y2Yno6kFyaxgD7yKTIgyXqVsRpC0Zb9ULXSadViXgFm4LjY5Db2y1T9ybw+oNJlabyHJM7Qc06KM5VvaheaZanr9FrlDkL1A5VMCYMZstZRL+dSUjttlfKK60/J2aG90ONKBEHXYe3+OC9LjdRyM6A4z9kgiUc2+kBPcSl4/04TfvuPdqy7TM+KhXqw6QAZN8N4x2TTQIBpTLg5KxQTLyY1ePEj+LNeJ0zKmCSPAHKP54WBw/+WHVFtaBwVJUBaUIRSslvxd8vX0OjwCckDIo+GZGyuKljuGOQ4DipeBIpLv8V6feNpVZeTumM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(86362001)(66476007)(66946007)(83380400001)(52536014)(38070700005)(4326008)(5660300002)(55016003)(38100700002)(122000001)(508600001)(8936002)(9686003)(33656002)(316002)(7696005)(2906002)(64756008)(6916009)(54906003)(26005)(76116006)(186003)(6506007)(53546011)(8676002)(66446008)(66556008)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6363
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75385843-e2ad-4f73-eeba-08d9da63c43f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QLautPI4XEWfxA2v+xKXVXbL1rF0Cj8rmnNh4Diuo0A57nDVgvvTDYFNEp4CKQwD5Br2gA5xNA2mwFb1pfmWotl1KhCznZ71jDaPs19WidegG9+tovE8hhCu79ecrw3jmHHzoW3kWy24qqh0T4rxjTAkOdUt3jtsePPHHG1lyHgiYX8r6EdspV9sxUn0j8Unf9js146AKKAiKarWCdKqgge/ClhcvYPTrdZDSC7jtTojG9sMtnSszPoHmL5C+UPSHfJz3QQigGbRaVqOojw9XNrI9+GW3YZqZ3QstQazLL0XUIRSy2KgojlGZPgO+zMq+CB+K9Fsbyj5uQft3GQB3MoLbfKUE8781juhzqmAk5itemcxIO1tbFig+VlrZwBYr58GmZzdn7eWl3cizC+tKCNjrhgVoncX/yx2DdzeZMmzN1iQdlAorPlERavv1BpW+1Hgth7Q1tdtay2cagOCiYEa6+wRxtxYNqd7hq7igN4lXxcLHA+jc7r2pG4UACzv5jKd3s6YCsr44lCH8Gup8VkaWDOrG8Qf4ieR7BJpSa8oLp07wmVdCoFSBFI5WkJRN/mlP7JgAyMNLODb4UCyZrLKNd5rfKn0HgHE1ZOAdG2fCya0TQaL1FVpxkRZq7Y1PCstjIEvDi6U1u5T1lAgDMLlgB8+svoZvu88CC23ZJlRRWFHdywlDhDr2/P0g8sI+EoCsMd5P4mTAVe7WXxoWKqzWpkWqSI1YOErNIRi2enNuqJa2ZzOA3dmJFmkRIokmk6qNSYKFFd86viI82v276OrxhTEQ6sp4JlYtUQ6HvOJrymUbHX5ynjI5G2lFwht3nA0+67ULA6ixa0kIEWxTmbnpR/ir3NgInU5YFUz1XY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(4326008)(47076005)(54906003)(508600001)(356005)(36860700001)(83380400001)(70206006)(52536014)(86362001)(6506007)(186003)(2906002)(55016003)(8676002)(8936002)(53546011)(81166007)(5660300002)(26005)(82310400004)(70586007)(7696005)(6862004)(966005)(316002)(9686003)(40460700001)(336012)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 09:20:42.9364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a733bc4f-fc65-4623-4b61-08d9da63cd3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3682

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOOaXpSAxNjoxNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA0LzM3XSB4ZW46IGludHJvZHVjZSBhbiBhcmNoIGhlbHBlciBmb3IgZGVm
YXVsdCBkbWENCj4gem9uZSBzdGF0dXMNCj4gDQo+IE9uIDE4LjAxLjIwMjIgMDg6NTEsIFdlaSBD
aGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IDIwMjLlubQx5pyIMTjm
l6UgMDoxMQ0KPiA+PiBPbiAyMy4wOS4yMDIxIDE0OjAyLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+
IEluIGN1cnJlbnQgY29kZSwgd2hlbiBYZW4gaXMgcnVubmluZyBpbiBhIG11bHRpcGxlIG5vZGVz
IE5VTUENCj4gPj4+IHN5c3RlbSwgaXQgd2lsbCBzZXQgZG1hX2JpdHNpemUgaW4gZW5kX2Jvb3Rf
YWxsb2NhdG9yIHRvIHJlc2VydmUNCj4gPj4+IHNvbWUgbG93IGFkZHJlc3MgbWVtb3J5IGZvciBE
TUEuDQo+ID4+Pg0KPiA+Pj4gVGhlcmUgYXJlIHNvbWUgeDg2IGltcGxpY2F0aW9ucyBpbiBjdXJy
ZW50IGltcGxlbWVudGF0aW9uLiBCZWN1YXNlDQo+ID4+PiBvbiB4ODYsIG1lbW9yeSBzdGFydHMg
ZnJvbSAwLiBPbiBhIG11bHRpcGxlIG5vZGVzIE5VTUEgc3lzdGVtLCBpZg0KPiA+Pj4gYSBzaW5n
bGUgbm9kZSBjb250YWlucyB0aGUgbWFqb3JpdHkgb3IgYWxsIG9mIHRoZSBETUEgbWVtb3J5LiB4
ODYNCj4gPj4+IHByZWZlciB0byBnaXZlIG91dCBtZW1vcnkgZnJvbSBub24tbG9jYWwgYWxsb2Nh
dGlvbnMgcmF0aGVyIHRoYW4NCj4gPj4+IGV4aGF1c3RpbmcgdGhlIERNQSBtZW1vcnkgcmFuZ2Vz
LiBIZW5jZSB4ODYgdXNlIGRtYV9iaXRzaXplIHRvIHNldA0KPiA+Pj4gYXNpZGUgc29tZSBsYXJn
ZWx5IGFyYml0cmFyeSBhbW91bnQgbWVtb3J5IGZvciBETUEgbWVtb3J5IHJhbmdlcy4NCj4gPj4+
IFRoZSBhbGxvY2F0aW9ucyBmcm9tIHRoZXNlIG1lbW9yeSByYW5nZXMgd291bGQgaGFwcGVuIG9u
bHkgYWZ0ZXINCj4gPj4+IGV4aGF1c3RpbmcgYWxsIG90aGVyIG5vZGVzJyBtZW1vcnkuDQo+ID4+
Pg0KPiA+Pj4gQnV0IHRoZSBpbXBsaWNhdGlvbnMgYXJlIG5vdCBzaGFyZWQgYWNyb3NzIGFsbCBh
cmNoaXRlY3R1cmVzLiBGb3INCj4gPj4+IGV4YW1wbGUsIEFybSBkb2Vzbid0IGhhdmUgdGhlc2Ug
aW1wbGljYXRpb25zLiBTbyBpbiB0aGlzIHBhdGNoLCB3ZQ0KPiA+Pj4gaW50cm9kdWNlIGFuIGFy
Y2hfaGF2ZV9kZWZhdWx0X2RtYXpvbmUgaGVscGVyIGZvciBhcmNoIHRvIGRldGVybWluZQ0KPiA+
Pj4gdGhhdCBpdCBuZWVkIHRvIHNldCBkbWFfYml0c2l6ZSBmb3IgcmVzZXJ2ZSBETUEgYWxsb2Nh
dGlvbnMgb3Igbm90Lg0KPiA+Pg0KPiA+PiBIb3cgd291bGQgQXJtIGd1YXJhbnRlZSBhdmFpbGFi
aWxpdHkgb2YgbWVtb3J5IGJlbG93IGEgY2VydGFpbg0KPiA+PiBib3VuZGFyeSBmb3IgbGltaXRl
ZC1jYXBhYmlsaXR5IGRldmljZXM/IE9yIGlzIHRoZXJlIG5vIG5lZWQNCj4gPj4gYmVjYXVzZSB0
aGVyZSdzIGFuIGFzc3VtcHRpb24gdGhhdCBJL08gZm9yIHN1Y2ggZGV2aWNlcyB3b3VsZA0KPiA+
PiBhbHdheXMgcGFzcyB0aHJvdWdoIGFuIElPTU1VLCBsaWZ0aW5nIGFkZHJlc3Mgc2l6ZSByZXN0
cmljdGlvbnM/DQo+ID4+IChJIGd1ZXNzIGluIGEgIVBWIGJ1aWxkIG9uIHg4NiB3ZSBjb3VsZCBh
bHNvIGdldCByaWQgb2Ygc3VjaCBhDQo+ID4+IHJlc2VydmF0aW9uLikNCj4gPg0KPiA+IE9uIEFy
bSwgd2Ugc3RpbGwgY2FuIGhhdmUgc29tZSBkZXZpY2VzIHdpdGggbGltaXRlZCBETUEgY2FwYWJp
bGl0eS4NCj4gPiBBbmQgd2UgYWxzbyBkb24ndCBmb3JjZSBhbGwgc3VjaCBkZXZpY2VzIHRvIHVz
ZSBJT01NVS4gVGhpcyBkZXZpY2VzDQo+ID4gd2lsbCBhZmZlY3QgdGhlIGRtYV9iaXRzaXplLiBM
aWtlIFJQaSBwbGF0Zm9ybSwgaXQgc2V0cyBpdHMgZG1hX2JpdHNpemUNCj4gPiB0byAzMC4gQnV0
IGluIG11bHRpcGxlIE5VTUEgbm9kZXMgc3lzdGVtLCBBcm0gZG9lc24ndCBoYXZlIGEgZGVmYXVs
dA0KPiA+IERNQSB6b25lLiBNdWx0aXBsZSBub2RlcyBpcyBub3QgYSBjb25zdHJhaW50IG9uIGRt
YV9iaXRzaXplLiBBbmQgc29tZQ0KPiA+IHByZXZpb3VzIGRpc2N1c3Npb25zIGFyZSBwbGFjZWQg
aGVyZSBbMV0uDQo+IA0KPiBJJ20gYWZyYWlkIHRoYXQgZG9lc24ndCBnaXZlIG1lIG1vcmUgY2x1
ZXMuIEZvciBleGFtcGxlLCBpbiB0aGUgbWFpbA0KPiBiZWluZyByZXBsaWVkIHRvIHRoZXJlIEkg
ZmluZCAiVGhhdCBtZWFucywgb25seSBmaXJzdCA0R0IgbWVtb3J5IGNhbg0KPiBiZSB1c2VkIGZv
ciBETUEuIiBZZXQgdGhhdCdzIG5vdCBhbiBpbXBsaWNhdGlvbiBmcm9tIHNldHRpbmcNCj4gZG1h
X2JpdHNpemUuIERNQSBpcyBmaW5lIHRvIG9jY3VyIHRvIGFueSBhZGRyZXNzLiBUaGUgc3BlY2lh
bCBhZGRyZXNzDQo+IHJhbmdlIGlzIGJlaW5nIGhlbGQgYmFjayBpbiBjYXNlIGluIHBhcnRpY3Vs
YXIgRG9tMCBpcyBpbiBuZWVkIG9mIHN1Y2gNCj4gYSByYW5nZSB0byBwZXJmb3JtIEkvTyB0byBf
c29tZV8gZGV2aWNlcy4NCg0KSSBhbSBzb3JyeSB0aGF0IG15IGxhc3QgcmVwbHkgaGFzbid0IGdp
dmVuIHlvdSBtb3JlIGNsdWVzLiBPbiBBcm0sIG9ubHkNCkRvbTAgY2FuIGhhdmUgRE1BIHdpdGhv
dXQgSU9NTVUuIFNvIHdoZW4gd2UgYWxsb2NhdGUgbWVtb3J5IGZvciBEb20wLA0Kd2UncmUgdHJ5
aW5nIHRvIGFsbG9jYXRlIG1lbW9yeSB1bmRlciA0R0Igb3IgaW4gdGhlIHJhbmdlIG9mIGRtYV9i
aXRzaXplDQppbmRpY2F0ZWQuIEkgdGhpbmsgdGhlc2Ugb3BlcmF0aW9ucyBtZWV0IHlvdXIgYWJv
dmUgRG9tMCBzcGVjaWFsIGFkZHJlc3MNCnJhbmdlIGRlc2NyaXB0aW9uLiBBcyB3ZSBoYXZlIGFs
cmVhZHkgYWxsb2NhdGVkIG1lbW9yeSBmb3IgRE1BLCBzbyBJDQp0aGluayB3ZSBkb24ndCBuZWVk
IGEgRE1BIHpvbmUgaW4gcGFnZSBhbGxvY2F0aW9uLiBJIGFtIG5vdCBzdXJlIGlzIHRoYXQNCmFu
c3dlcnMgeW91ciBlYXJsaWVyIHF1ZXN0aW9uPw0KDQo+IA0KPiA+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L251bWEuYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L251bWEuYw0KPiA+Pj4gQEAgLTM3
MSw2ICszNzEsMTEgQEAgdW5zaWduZWQgaW50IF9faW5pdCBhcmNoX2dldF9kbWFfYml0c2l6ZSh2
b2lkKQ0KPiA+Pj4gICAgICAgICAgICAgICAgICAgKyBQQUdFX1NISUZULCAzMik7DQo+ID4+PiAg
fQ0KPiA+Pj4NCj4gPj4+ICt1bnNpZ25lZCBpbnQgYXJjaF9oYXZlX2RlZmF1bHRfZG1hem9uZSh2
b2lkKQ0KPiA+Pj4gK3sNCj4gPj4+ICsgICAgcmV0dXJuICggbnVtX29ubGluZV9ub2RlcygpID4g
MSApID8gMSA6IDA7DQo+ID4+PiArfQ0KPiA+Pg0KPiA+PiBBY2NvcmRpbmcgdG8gdGhlIGV4cHJl
c3Npb24gYW5kIC4uLg0KPiA+Pg0KPiA+Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMN
Cj4gPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4+PiBAQCAtMTg4OSw3ICsx
ODg5LDcgQEAgdm9pZCBfX2luaXQgZW5kX2Jvb3RfYWxsb2NhdG9yKHZvaWQpDQo+ID4+PiAgICAg
IH0NCj4gPj4+ICAgICAgbnJfYm9vdG1lbV9yZWdpb25zID0gMDsNCj4gPj4+DQo+ID4+PiAtICAg
IGlmICggIWRtYV9iaXRzaXplICYmIChudW1fb25saW5lX25vZGVzKCkgPiAxKSApDQo+ID4+PiAr
ICAgIGlmICggIWRtYV9iaXRzaXplICYmIGFyY2hfaGF2ZV9kZWZhdWx0X2RtYXpvbmUoKSApDQo+
ID4+PiAgICAgICAgICBkbWFfYml0c2l6ZSA9IGFyY2hfZ2V0X2RtYV9iaXRzaXplKCk7DQo+ID4+
DQo+ID4+IC4uLiB0aGUgdXNlIHNpdGUsIHlvdSBtZWFuIHRoZSBmdW5jdGlvbiB0byByZXR1cm4g
Ym9vbGVhbi4gUGxlYXNlDQo+ID4+IGluZGljYXRlIHNvIGJ5IG1ha2luZyBpdCBoYXZlIGEgcmV0
dXJuIHR5cGUgb2YgImJvb2wiLiBJbmRlcGVuZGVudA0KPiA+PiBvZiB0aGF0IHlvdSBkb24ndCBu
ZWVkIGEgY29uZGl0aW9uYWwgZXhwcmVzc2lvbiBhYm92ZSwgbm9yDQo+ID4+IChtYWxmb3JtZWQp
IHVzZSBvZiBwYXJlbnRoZXNlcy4gSSBmdXJ0aGVyIHdvbmRlciB3aGV0aGVyIC4uLg0KPiA+Pg0K
PiA+DQo+ID4gSSB3aWxsIGZpeCB0aGVtIGluIG5leHQgdmVyc2lvbi4gQnV0IEkgYW0gbm90IHZl
cnkgY2xlYXIgYWJvdXQNCj4gPiB0aGlzIGNvbW1lbnQgIm9mIHRoYXQgeW91IGRvbid0IG5lZWQg
YSBjb25kaXRpb25hbCBleHByZXNzaW9uIGFib3ZlIiwNCj4gPiBUaGUgImFib3ZlIiBpbmRpY2F0
ZXMgdGhpcyBsaW5lOg0KPiA+ICJyZXR1cm4gKCBudW1fb25saW5lX25vZGVzKCkgPiAxICkgPyAx
IDogMDsiPw0KPiANCj4gWWVzLiBFdmVuIHdpdGhvdXQgdGhlIHVzZSBvZiBib29sIHN1Y2ggYW4g
ZXhwcmVzc2lvbiBpcyBhIG1vcmUNCj4gY29tcGxpY2F0ZWQgZm9ybSBvZg0KPiANCj4gICAgIHJl
dHVybiBudW1fb25saW5lX25vZGVzKCkgPiAxOw0KPiANCj4gd2hlcmUgd2UnZCBwcmVmZXIgdG8g
dXNlIHRoZSBzaW1wbGVyIHZhcmlhbnQgZm9yIGJlaW5nIGVhc2llciB0bw0KPiByZWFkIC8gZm9s
bG93Lg0KPiANCg0KVGhhbmtzIGZvciBjbGFyaWZpY2F0aW9uLCBJIHdpbGwgZml4IGl0LiANCg0K
PiBKYW4NCj4gDQo+ID4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAyMS0NCj4gMDgvbXNnMDA3NzIuaHRtbA0KPiA+DQo+ID4NCg0K

