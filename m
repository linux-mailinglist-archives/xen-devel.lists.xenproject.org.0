Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F3364B35F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460447.718353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52iG-0007cb-Bd; Tue, 13 Dec 2022 10:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460447.718353; Tue, 13 Dec 2022 10:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52iG-0007Zz-8O; Tue, 13 Dec 2022 10:40:40 +0000
Received: by outflank-mailman (input) for mailman id 460447;
 Tue, 13 Dec 2022 10:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=koDi=4L=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1p52iE-0007Zt-6Y
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 10:40:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 936a6305-7ad2-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 11:40:35 +0100 (CET)
Received: from AS8P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::35)
 by DB9PR08MB6652.eurprd08.prod.outlook.com (2603:10a6:10:2ab::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.10; Tue, 13 Dec
 2022 10:40:33 +0000
Received: from VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::a2) by AS8P189CA0030.outlook.office365.com
 (2603:10a6:20b:31f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 10:40:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT013.mail.protection.outlook.com (100.127.145.11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 10:40:32 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 13 Dec 2022 10:40:31 +0000
Received: from 797967815af4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3310B2EA-DB2C-417D-934A-2793BDFE5531.1; 
 Tue, 13 Dec 2022 10:40:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 797967815af4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Dec 2022 10:40:21 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAWPR08MB10133.eurprd08.prod.outlook.com (2603:10a6:102:35f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Tue, 13 Dec
 2022 10:40:19 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::eb53:5027:9f6c:cb1b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::eb53:5027:9f6c:cb1b%2]) with mapi id 15.20.5924.009; Tue, 13 Dec 2022
 10:40:18 +0000
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
X-Inumbo-ID: 936a6305-7ad2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H05V9UWEn9+HrRt78Sv1zi2jvkV/Z6lHfEjfWmvr8TU=;
 b=esCX8MReti4g6xptQVhscyJoZX6XWDQZN0zLzdrupmmhMB7jfmDqbMZkKAFTjJRzyVrO27aPuij3BwYmrLVxzWWwzAUDcEsXU8oTVq0xyISzFOPpWh0xLUl0zjI07TOgnE3vPG0x/0O7OLbhOci0v8DA6uOCML17Kj2cpN0KVyQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBIeVMlSw0+fRW1Hv/tkAlkquDpn9OfPhuApQde2j22txRhAovKpABd0ynADB+1F+wYevn8DSRcf1hCP5XTk3VjMH38nBmVuFXCAFB4NCJ2nFctMqLPTqt2OxolP6XBQhrHHDkX3x82V8TxFroI7B8CjMECBr5OP4A13plJElEkgyke8PjuzfU/Ty7IIbbnIhfmlscCjTXecvuzE/W0+fr8N6GiLN2yWC8SZzusc4SOSLpNyMqwg30noSYn9ZRmCaKMDFYFbk5K5ksnHS2ef3m+5nbAizRTxWwSQuTmpuML35yHLoFmdXAnOus/6fgiXOZzr4CkmFzxbEyTFh3A87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H05V9UWEn9+HrRt78Sv1zi2jvkV/Z6lHfEjfWmvr8TU=;
 b=E42LlLAu6UK/71Xv2MdcMpkk462a1/jtJ8jIPMJgSRTzxS9n92YZ9vlqSi1Lj+kbOkqvYDmB8aZm4PY56Z8JGqOXchiBH2Tcg86wUDphO3Yd6hcrfanpKdbR32iNiBQigcy6oc5ofnf54cvuA9M8Sz1INdTXoSjObnUHQnEy/AhINBOWa3xsJnfQzOBd3DFaN2FJj4S7+bGSq8C1PKti5qmY+el1Zz2ByuEkPWsTvyeYsJ/+jowHa5MOKi42e1VY78jQW8qWSVtG2ROTE1K44+W364qrhLahds7+dG4chE9UDPAxG99E+Pcu6ay3zbK0u386haF1JvmrTOZ+1hbjEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H05V9UWEn9+HrRt78Sv1zi2jvkV/Z6lHfEjfWmvr8TU=;
 b=esCX8MReti4g6xptQVhscyJoZX6XWDQZN0zLzdrupmmhMB7jfmDqbMZkKAFTjJRzyVrO27aPuij3BwYmrLVxzWWwzAUDcEsXU8oTVq0xyISzFOPpWh0xLUl0zjI07TOgnE3vPG0x/0O7OLbhOci0v8DA6uOCML17Kj2cpN0KVyQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH v9 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Thread-Topic: [PATCH v9 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for
 phys_to_nid
Thread-Index: AQHY+zrluQ6bhO04RE6Xg9on5yXu8a5ruT0AgAALEbA=
Date: Tue, 13 Dec 2022 10:40:18 +0000
Message-ID:
 <PAXPR08MB7420A426B6159B3669AC32A29EE39@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
 <20221118104508.768274-4-wei.chen@arm.com>
 <6f04f1e7-4fd9-8ab5-0ea0-b6cf5925ca29@suse.com>
In-Reply-To: <6f04f1e7-4fd9-8ab5-0ea0-b6cf5925ca29@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F3330E0F4A75244BBA88B86631C2C673.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PAWPR08MB10133:EE_|VI1EUR03FT013:EE_|DB9PR08MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa93b84-d85f-49b2-96f8-08dadcf675bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rtYF3GY5cUUSZYsBuJX83UmC4eseCwlluV11S7aL0WAVzXYzRl8AKbFZDezI7Cu0RNUn2nLpL6E5eFW4LgJpKdghnDDceHzadlMtikzcWyo9OCKICd1nDiJY9yIb83UR1Xxz/eKF30BoB9ago4Rp9FNKCr309bUYsChrg+EjBNoh5YR2Z0wtPlZBJ/fTZ7eg1oyF6lg8WYdosQWdy4ZJ7wDmZ88Oaz7hmXE+TqjAfQtw7tOF2GCSKrdkS+V8HYozo+cxrV3gUA4dfHwRfPFAq7H1mqiyv0SZrufAXpZTPCkvXvLhe9IidbyYEKtVrfSVTBDCPI8ir3vfib5ESiik3hkXUi1wV1fIy+SJX9oUiSY1xDR/kOT2SPUNuQ6QAAXo1G3e8A1/paxcN57hJcqYj8if4RARyysuvvxHmAF0FSb00v9jgAvxHOhIOzg4LtLZ8RU0KniVhu0Om4G8Xl+PfmdQyhi7OjBa8qcFKIJcbVkAUX8TXoCO0OsVRwe6EfAjZBW6LWb2jNTiHk9cJMQgHJKKD3MQf+UPmXNH7DXfFxEaFVqJRM1STBkVij7jurmwi80gdqe1OHMr+kDLLFtNRbau5ET6xKWwCUgE6eSYSvU16Fp2cbCutBPCEtzHwqaRqj9gH+Vv/LBGlg1uxHk6GBtg6Ba8WKA6dpZ3KNT2BQ1uwp8H9s0tb++U31xyHgMNtVZTmIQpMAiEO9epJnWyFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199015)(33656002)(86362001)(2906002)(53546011)(6506007)(9686003)(478600001)(7696005)(83380400001)(66946007)(64756008)(66556008)(186003)(38070700005)(8676002)(66476007)(66446008)(4326008)(71200400001)(38100700002)(76116006)(5660300002)(41300700001)(122000001)(8936002)(316002)(52536014)(6916009)(54906003)(26005)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10133
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	70e37342-d7bb-4b06-bafb-08dadcf66d8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eFByv6sRLZfV2f4G8iSHOB2iwrxIVwFLRktMWH4zbH5beGh+/BfhaIEp/uVH2ECSYLhf33bY7E7YYbhbu45CzEYvozJfIrK6pGfiIck9OvJuVEfcm3McLb4qXC9uHkn8QAR4D54b44jeqRfyTZfJU4NVeZFgULR6yMJw+rwbh0QgTLIZ//mwnc5sFkVK0tBdUpakF7CvndR2S44491Aa6XzBtrF/NwnfPQkqM1Rq+K76+hZqN1cMukS0JBWJw9vr3ZG1SPzXHpxhXvGU92tSFQ+Aggcb7sd7JfY8WTJYb+J1hD8nWwVnyoF52cR0eEYuo+AKaE2ht09+MUs4u/vrQwPzQYX4pZuNFDTQaFYa0eOPNFFkftgBCTy+n+KmcRP25/ErOK+jf6UdIHBfei6uUyziHPQFz4bXPnFx8nI5NRvmjMIpRvGmFzsk9GZXjTV5ZTIvbHDfXAstqFjUfpiUCcN5+GCppVBsK31QEnqEResL2W3RfwOBNy0t4N19pwD/QzTn/WyTJF1h2mmZMGmZLPJ9mp7M3/jiub2TRdCBA47vHWXk8+up3psxC9jQA0nRcYhs5B87QU34ytEF/5KuC8GxnUBJEMA7A8MxAsK2fg1zCtvyCDdO2NAECyxfZrNPzaFZ2U/Czacmjda4WPqxZq+fdeJybaK1EqA0ZfKxvadFLu/aK/k+VizoSD1yGsSxtPB/YqW0mfrEqAADLrD8rA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(336012)(83380400001)(81166007)(356005)(86362001)(82740400003)(36860700001)(2906002)(52536014)(6862004)(5660300002)(8936002)(40480700001)(40460700003)(4326008)(82310400005)(186003)(41300700001)(107886003)(478600001)(9686003)(26005)(53546011)(70206006)(70586007)(6506007)(7696005)(8676002)(316002)(55016003)(54906003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 10:40:32.0208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa93b84-d85f-49b2-96f8-08dadcf675bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6652

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEy5pyIMTPml6UgMTc6NDcN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogbmQgPG5kQGFybS5jb20+
OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlDQo+IER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IFN0ZWZhbm8NCj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBKaWFtZWkgWGllDQo+IDxKaWFtZWkuWGllQGFybS5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDMvNl0geGVuL3g4Njog
VXNlIEFTU0VSVCBpbnN0ZWFkIG9mIFZJUlRVQUxfQlVHX09ODQo+IGZvciBwaHlzX3RvX25pZA0K
PiANCj4gT24gMTguMTEuMjAyMiAxMTo0NSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gVklSVFVBTF9C
VUdfT04gaXMgYW4gZW1wdHkgbWFjcm8gdXNlZCBpbiBwaHlzX3RvX25pZC4gVGhpcw0KPiA+IHJl
c3VsdHMgaW4gdHdvIGxpbmVzIG9mIGVycm9yLWNoZWNraW5nIGNvZGUgaW4gcGh5c190b19uaWQN
Cj4gPiB0aGF0IGlzIG5vdCBhY3R1YWxseSB3b3JraW5nIGFuZCBjYXVzaW5nIHR3byBjb21waWxh
dGlvbg0KPiA+IGVycm9yczoNCj4gPiAxLiBlcnJvcjogIk1BWF9OVU1OT0RFUyIgdW5kZWNsYXJl
ZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pLg0KPiA+ICAgIFRoaXMgaXMgYmVjYXVzZSBp
biB0aGUgY29tbW9uIGhlYWRlciBmaWxlLCAiTUFYX05VTU5PREVTIiBpcw0KPiA+ICAgIGRlZmlu
ZWQgYWZ0ZXIgdGhlIGNvbW1vbiBoZWFkZXIgZmlsZSBpbmNsdWRlcyB0aGUgQVJDSCBoZWFkZXIN
Cj4gPiAgICBmaWxlLCB3aGVyZSBwaHlzX3RvX25pZCBoYXMgYXR0ZW1wdGVkIHRvIHVzZSAiTUFY
X05VTU5PREVTIi4NCj4gPiAgICBUaGlzIGVycm9yIHdhcyByZXNvbHZlZCBhZnRlciB3ZSBtb3Zl
ZCB0aGUgcGh5c190b19uaWQgZnJvbQ0KPiA+ICAgIHg4NiBBUkNIIGhlYWRlciBmaWxlIHRvIGNv
bW1vbiBoZWFkZXIgZmlsZS4NCj4gPiAyLiBlcnJvcjogd3JvbmcgdHlwZSBhcmd1bWVudCB0byB1
bmFyeSBleGNsYW1hdGlvbiBtYXJrLg0KPiA+ICAgIFRoaXMgaXMgYmVjYXVzZSwgdGhlIGVycm9y
LWNoZWNraW5nIGNvZGUgY29udGFpbnMgIW5vZGVfZGF0YVtuaWRdLg0KPiA+ICAgIEJ1dCBub2Rl
X2RhdGEgaXMgYSBkYXRhIHN0cnVjdHVyZSB2YXJpYWJsZSwgaXQncyBub3QgYSBwb2ludGVyLg0K
PiA+DQo+ID4gU28sIGluIHRoaXMgcGF0Y2gsIHdlIHVzZSBBU1NFUlQgaW5zdGVhZCBvZiBWSVJU
VUFMX0JVR19PTiB0bw0KPiA+IGVuYWJsZSB0aGUgdHdvIGxpbmVzIG9mIGVycm9yLWNoZWNraW5n
IGNvZGUuIEFuZCBmaXggdGhlIGxlZnQNCj4gPiBjb21waWxhdGlvbiBlcnJvcnMgYnkgcmVwbGFj
aW5nICFub2RlX2RhdGFbbmlkXSB0bw0KPiA+ICFub2RlX2RhdGFbbmlkXS5ub2RlX3NwYW5uZWRf
cGFnZXMuIEFsdGhvdWdoIE5VTUEgYWxsb3dzIG9uZSBub2RlDQo+ID4gY2FuIG9ubHkgaGF2ZSBD
UFVzIGJ1dCB3aXRob3V0IGFueSBtZW1vcnkuIEFuZCBub2RlIHdpdGggMCBieXRlcw0KPiA+IG9m
IG1lbW9yeSBtaWdodCBoYXZlIGFuIGVudHJ5IGluIG1lbW5vZGVtYXBbXSB0aGVvcmV0aWNhbGx5
LiBCdXQNCj4gPiB0aGF0IGRvZXNuJ3QgbWVhbiBwaHlzX3RvX25pZCBjYW4gZmluZCBhbnkgdmFs
aWQgYWRkcmVzcyBmcm9tIGENCj4gPiBub2RlIHdpdGggMCBieXRlcyBtZW1vcnkuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiBUZXN0ZWQt
Ynk6IEppYW1laSBYaWUgPGppYW1laS54aWVAYXJtLmNvbT4NCj4gPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gVGhpcyBwYXRjaCBpcyB3aGF0IGlzIGNh
dXNpbmcgdGhlIHJlZ3Jlc3Npb24gZm91bmQgYnkgb3NzdGVzdC4gVGhlDQo+IHByZXZpb3VzbHkg
c2lsZW50IChkZWFkKSBjaGVja3Mgbm8gdHJpZ2dlciB3aGVuIHBhZ2luZ19pbml0KCkNCj4gZW5j
b3VudGVycyBhIGhvbGUgaW4gU1JBVC1kZXNjcmliZWQgc3BhY2UsIGFzIGlzIHRoZSBjYXNlIGUu
Zy4gb24NCj4gdGhlIGhpbXJvZHM6DQo+IA0KPiAoWEVOKSBOVU1BOiBOb2RlIDAgUFhNIDAgWzAw
MDAwMDAwMDAwMDAwMDAsIDAwMDAwMDAwN2ZmZmZmZmZdDQo+IChYRU4pIE5VTUE6IE5vZGUgMCBQ
WE0gMCBbMDAwMDAwMDEwMDAwMDAwMCwgMDAwMDAwMDg3ZmZmZmZmZl0NCj4gKFhFTikgTlVNQTog
Tm9kZSAxIFBYTSAxIFswMDAwMDAwODgwMDAwMDAwLCAwMDAwMDAxMDdmZmZmZmZmXQ0KPiAoWEVO
KSBOVU1BOiBVc2luZyAxOSBmb3IgdGhlIGhhc2ggc2hpZnQNCj4gDQo+IFRoZSBub2RlIElEIGZv
ciAweDgwMDAwMDAwIChzbG90IDEgb2YgbWVtbm9kZW1hcFtdKSBpcyBOVU1BX05PX05PREUsDQo+
IHdoaWNoIG9mIGNvdXJzZSBmYWlscyB0aGUgbGVmdCBzaWRlIG9mIC4uLg0KPiANCg0KSSBhbSBz
b3JyeSwgSSBoYWQgbm90IHRyaWdnZXJlZCB0aGlzIGluIG15IHRlc3RpbmcgbWFjaGluZS4gSSdt
IGEgYml0DQpjdXJpb3VzLCBvbiBOVU1BIHBsYXRmb3JtcyB3aWxsIHRoZXJlIGJlIG1lbW9yeSB0
aGF0IGRvZXNuJ3QgYmVsb25nIHRvDQphbnkgbm9kZT8gSWYgbm90LCB3aHkgdGhlIHNwYWNlIG9m
IDB4ODAwMDAwMDAgd2lsbCBiZSB1c2VkIGluIHBhZ2luZ19pbml0Pw0KDQo+ID4gQEAgLTY5LDkg
KzY3LDkgQEAgZXh0ZXJuIHN0cnVjdCBub2RlX2RhdGEgbm9kZV9kYXRhW107DQo+ID4gIHN0YXRp
YyBpbmxpbmUgbm9kZWlkX3QgX19hdHRyaWJ1dGVfcHVyZV9fIHBoeXNfdG9fbmlkKHBhZGRyX3Qg
YWRkcikNCj4gPiAgew0KPiA+ICAgICAgbm9kZWlkX3QgbmlkOw0KPiA+IC0gICAgVklSVFVBTF9C
VUdfT04oKHBhZGRyX3RvX3BkeChhZGRyKSA+PiBtZW1ub2RlX3NoaWZ0KSA+PQ0KPiBtZW1ub2Rl
bWFwc2l6ZSk7DQo+ID4gKyAgICBBU1NFUlQoKHBhZGRyX3RvX3BkeChhZGRyKSA+PiBtZW1ub2Rl
X3NoaWZ0KSA8IG1lbW5vZGVtYXBzaXplKTsNCj4gPiAgICAgIG5pZCA9IG1lbW5vZGVtYXBbcGFk
ZHJfdG9fcGR4KGFkZHIpID4+IG1lbW5vZGVfc2hpZnRdOw0KPiA+IC0gICAgVklSVFVBTF9CVUdf
T04obmlkID49IE1BWF9OVU1OT0RFUyB8fCAhbm9kZV9kYXRhW25pZF0pOw0KPiA+ICsgICAgQVNT
RVJUKG5pZCA8IE1BWF9OVU1OT0RFUyAmJiBub2RlX2RhdGFbbmlkXS5ub2RlX3NwYW5uZWRfcGFn
ZXMpOw0KPiANCj4gLi4uIHRoZSAmJiBoZXJlLiBBcyBJIGRvbid0IHRoaW5rIHRoZSB1c2Ugb2Yg
cGh5c190b19uaWQoKSBieQ0KPiBwYWdpbmdfaW5pdCgpIGlzIG91dHJpZ2h0IGludmFsaWQsIEkg
d291bGQgY29uY2x1ZGUgdGhhdCB0aGUNCj4gY29uZGl0aW9uIG5lZWRzIHRvIGJlIHJlbGF4ZWQg
dG8gcGVybWl0IGZvciBOVU1BX05PX05PREUuIE90b2ggaXQncw0KPiBwb3NzaWJsZSB0aGF0IHRo
ZSBmdW5jdGlvbiB3YXMgcmVhbGx5IGludGVuZGVkIHRvIG5ldmVyIHJldHVybg0KPiBOVU1BX05P
X05PREUgKGFuZCBvbmx5IGV2ZXIgYmUgdXNlZCBvbiB2YWxpZCBtZW1vcnkgcmFuZ2VzKSwgaW4N
Cj4gd2hpY2ggY2FzZSBwYWdpbmdfaW5pdCgpIHdvdWxkIG5lZWQgdG8gdXNlIHNvbWV0aGluZyBl
bHNlIChvcg0KPiBtYWtlIHRoZSBjYWxsIGNvbmRpdGlvbmFsKTogQWNjb3JkaW5nIHRvIG15IGF1
ZGl0IGFsbCB1c2VzIGV4Y2VwdA0KPiB0aGUgdHdvIGluIHBhZ2luZ19pbml0KCkgYXJlIG9uIChz
dXBwb3NlZGx5KSB2YWxpZCBhZGRyZXNzZXMgb25seQ0KPiAoY29tbW9ubHkgd2hlbiBhbHJlYWR5
IGhvbGRpbmcgaW4gaGFuZHMgYSB2YWxpZCBzdHJ1Y3QgcGFnZV9pbmZvKS4NCj4gDQo+IFRoZW4g
YWdhaW4gdXMgaGF2aW5nIHBoeXNfdG9fbmlkKCkgaW4gdGhlIGZpcnN0IHBsYWNlIGlzIHNvbWV3
aGF0DQo+IGJvZ3VzOiBObyBjYWxsZXIgcmVhbGx5IHN0YXJ0cyBmcm9tIGEgcGh5c2ljYWwgYWRk
cmVzcy4gSXQgd291bGQNCj4gYmUgcXVpdGUgYSBiaXQgbW9yZSBzZW5zaWJsZSB0byBoYXZlIHBh
Z2VfdG9fbmlkKCkgYW5kIG1mbl90b19uaWQoKSwNCj4gdGhlIG1vcmUgdGhhdCB3aGF0IHBoeXNf
dG9fbmlkKCkgZG9lcyBpcyBwYXNzIHRoZSBhZGRyZXNzIHRvDQo+IHBhZGRyX3RvX3BkeCgpICh1
bmRvaW5nIGV2ZXJ5IGNhbGxlcidzIHRvLWFkZHIgY29udmVyc2lvbikuIEF0IHdoaWNoDQo+IHBv
aW50IHRoZSBmb3JtZXIgY291bGQgZG8gc3RyaWN0IGNoZWNraW5nIChkaXNhbGxvd2luZyBOVU1B
X05PX05PREUNCj4gb3V0cHV0KSB3aGlsZSB0aGUgbGF0dGVyIGNvdWxkIGJlIG1vcmUgcmVsYXhl
ZC4gSSBndWVzcyBJJ2xsIG1ha2UgYQ0KPiBwYXRjaCBhbG9uZyB0aGVzZSBsaW5lcy4NCj4gDQoN
ClRoYW5rcywgSSB3aWxsIHJldmlldyBpdCBhZnRlciB5b3Ugc2VudCB0aGF0IHBhdGNoLg0KDQpD
aGVlcnMsDQpXZWkgQ2hlbg0KDQo+IEphbg0K

