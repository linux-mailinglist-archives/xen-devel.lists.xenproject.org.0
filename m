Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EB416AFA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194857.347194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcmu-0002Z6-N2; Fri, 24 Sep 2021 04:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194857.347194; Fri, 24 Sep 2021 04:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcmu-0002X3-Jb; Fri, 24 Sep 2021 04:26:16 +0000
Received: by outflank-mailman (input) for mailman id 194857;
 Fri, 24 Sep 2021 04:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcmt-0002Ww-Ax
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:26:15 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f43721eb-92e2-48e3-946b-4ef2e123e4e1;
 Fri, 24 Sep 2021 04:26:12 +0000 (UTC)
Received: from AS8PR04CA0145.eurprd04.prod.outlook.com (2603:10a6:20b:127::30)
 by AM8PR08MB6418.eurprd08.prod.outlook.com (2603:10a6:20b:360::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 24 Sep
 2021 04:26:11 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::f9) by AS8PR04CA0145.outlook.office365.com
 (2603:10a6:20b:127::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:26:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:26:10 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Fri, 24 Sep 2021 04:26:08 +0000
Received: from f2fe4660b582.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE90A968-2BC4-4C43-9503-244342010EBE.1; 
 Fri, 24 Sep 2021 04:25:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2fe4660b582.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:25:58 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
 by PR3PR08MB5771.eurprd08.prod.outlook.com (2603:10a6:102:83::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 04:25:56 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be]) by PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:25:56 +0000
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
X-Inumbo-ID: f43721eb-92e2-48e3-946b-4ef2e123e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw1iiTAo9BPTzZ9AjtznHmOlnpi7/koDvJb5TugMpXM=;
 b=QqchGc6Cqr3WlMbmHESYi35a3BydOm5LWiJe2qLxcq4h1oLGKsxED6Jej0jnqZ1OCSL3Q/qyXJniueSOimSlqDkQeai2rRbvc3V31g2/Zfbeaye2xmIKK45+A/hAF4AZRIGCEgJE5WRiidlg9YDWbXWOcMY5qbiEvHEd+VATlfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcnIC6rHwvL7yHMaTROXXqiRIKRX1p+iJjRq1xIAtV1qjS3+NhlbzMTxBS1NnQrOJVl4mksHGh/C3/uCwDse8ayKIikjMYHYFIfIhqOpFkhBnmZEp8m6XBRpfIY2EWw1tn0mjBNWceX0cyxImU5EEM5nLLCoY8JNgfx0jXP1owVe9xWLbDFJLB52/NTI2I788DK+aB972NbVDz9ciLa7wDo7vhwxv8y7ARhXVZNQQil1cklv4R6fRSMM0CrC+jWWhRIlmWjtvXUmZ2IpQUEDxP0QSjqKnSDMjYknF1ACM7xdcbwUoeKgTrUG8jqzElarJrgi5pvYvIQB5bkECdigug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Sw1iiTAo9BPTzZ9AjtznHmOlnpi7/koDvJb5TugMpXM=;
 b=VsXyYjZ34TQe0OCxtkuYl3lELZb6VtAA8knFe3g2f483N75neLptLddPkiRoiw/dq/DIN7/Z00I7TS2+x9hRe3rrixC08hkOpR6Uvzuuica2Nh2aIQwbTrbgYWJd8oIYYbQ0w0jdMhPdJEIVGpW0LdAyvM3crshQbvvnL0vZH0lzh7Jb4kEedL2SOQIWFbIcxwSox7ORJuuHqrqZG/s+3gBUr1hr39JWjoMQxpKvvArxJlZDkpjtxgySqwhsIzHK6knLHHvIi3diwAe/UFUSRBKiz09SjOycBgwHJSOW7ZIGb5mcAfktCDOWiLCYL+yJFXgT4YkNW4p8jaO/7SPIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw1iiTAo9BPTzZ9AjtznHmOlnpi7/koDvJb5TugMpXM=;
 b=QqchGc6Cqr3WlMbmHESYi35a3BydOm5LWiJe2qLxcq4h1oLGKsxED6Jej0jnqZ1OCSL3Q/qyXJniueSOimSlqDkQeai2rRbvc3V31g2/Zfbeaye2xmIKK45+A/hAF4AZRIGCEgJE5WRiidlg9YDWbXWOcMY5qbiEvHEd+VATlfg=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 26/37] xen/arm: build NUMA cpu_to_node map in
 dt_smp_init_cpus
Thread-Topic: [PATCH 26/37] xen/arm: build NUMA cpu_to_node map in
 dt_smp_init_cpus
Thread-Index: AQHXsHMutbV6xKNOcke5Q+luAXEwQquydicAgAAg9TA=
Date: Fri, 24 Sep 2021 04:25:55 +0000
Message-ID:
 <PAXPR08MB6864920A4072FC029623BBC29EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-27-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231919070.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231919070.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E7D9C557CCAAA44FBCAC19C270D50842.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 11ec1d55-6fde-42b3-245b-08d97f136fb7
x-ms-traffictypediagnostic: PR3PR08MB5771:|AM8PR08MB6418:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB64183DB80577274BE59579589EA49@AM8PR08MB6418.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:404;OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oG1uiJjXGdAHmOuORlRNYeIRJIW8YLyqtELIcZmVHrWWr/7Nn5McaOf3GANQ5XXs0Y1JHQsS3YQ0u61mhuPLCdybXBWEMiFAdqfc8LAFEV173diBrY5m8vl0P0PVbFnEertSwtfkZxUGflRtPwvfHsg/gSymz1Nhv4AD2zNlev6cqOOrCMcztwjre7Ep2XKCnvH/D9m7z4osoc83/Hn4vNJmnvjzRdEyYinHq0I/zqDFRtyH9/o5dczCPQcmYNTF/hze8ST4bXI/oYCL/gIhmhEV5abPNUiieNELGJvX8Vref+sudzE2JZ+po6wTX21ee3ozA+iYKxC+AtaB7X48ZzNoz+Tn6WPiWiqqcQ8w9oNRbWOaNQThS/f0+Xzt1Vc0m9ncRy44PEBqlyzebMZ86T02kad8VSlsy/Is6I6oiBqUJ1OS0xtZsCTQrmIsCNRN2Zuy54RO9wDgWQiN+2p0CTnZJqj9RQJthSlBDMajHfkqVEs4OpR3oxb2DSHwOwA5pi1cHkoXGRye196ZVdIw0a79DUuDoNqwp3GGzEMzpZgLr1ScQTmOtHQfp0aor61pmLtfE/bxzRXOHi1HBLxuybMesw2fPbXPRqSkfWacyi7X5emklMYrvxeN6PSxns9tmJBv1SLULqzkkqNIZWqwwNnmYgAiwomZp6/X9fQL5PCyqYh0LaxmZrXJPtiqzacvuAnX0c4lk+/HVlnCTUsyDg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6864.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(4326008)(122000001)(8936002)(55016002)(38070700005)(52536014)(9686003)(6506007)(53546011)(7696005)(71200400001)(186003)(66476007)(66946007)(6916009)(508600001)(66446008)(64756008)(38100700002)(83380400001)(76116006)(2906002)(5660300002)(33656002)(26005)(66556008)(316002)(54906003)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5771
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84a9baf2-5995-472e-bdaf-08d97f136717
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SH6fc/JRWpPahBRKii/McN3ez23zfAVn+uSCQ7+OBDT5kHLEzfDRnJ3oC3XODho3iGsgQTUkZN7CBZVlEmo2Be3Z2xRRAxYrsxFYPKhFT9MSFehGB+fbVgiPoZQkQLm4XR46DrLPkX3tMWPD3EdSbCYyMadcFnzLy+G9eNzpkZpReoNcFeDHq8Au4/fa2VdOL9hMY56zD2UGcrIuraJ2TP00I0cUF0knySaS4r/KIne55lUqWWu9aXgjxlmurHyGvQkmlIs8WDe2QwNPWgdYCmqhvkdreWlBsrW0lxNb/rnxihBGNOgvvr9eu/mvIzBIeqIDjvdTlEo+zKKWOlGTcOtZI1f97NhYwxQUiHG3vegq7yov1Mdpa5qj4N8Yleu9yayV7B6P0MaJd6Uh8//laORMfh6j3YjFlLoUYzQAOySTItwoAOqcvB++KboU6NACvylOb+j9ZHwVrkvyfOpen2JYKo4vUkUy0lxFxlFkbVowTEHy0EjH+NMrqtk2JRUY2z/uomth0s5MrvUY03eBzGhj2Vw6S7Ro0mYYk66tkUMTGryZX10hXTK1TAp1d15AUYZtM+ZOtLoaiKhIYV/qEWj2vPb/EvbS1YKCDpcd8Ijp1JPu6X7C+UvnVJ1qlTBjwd5E4bllMe80F5hZK5A7vCPsKcOXV2O6pwhpGb0ZCHauD1KKYlK8+VIEsdFoTcvgQbW7SsDItlPnvecPioLZtQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(7696005)(4326008)(316002)(55016002)(5660300002)(6506007)(36860700001)(26005)(6862004)(86362001)(70206006)(47076005)(70586007)(186003)(54906003)(508600001)(9686003)(8936002)(52536014)(83380400001)(336012)(33656002)(82310400003)(2906002)(356005)(81166007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:26:10.4285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ec1d55-6fde-42b3-245b-08d97f136fb7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6418

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjI0yNUgMTA6MjYNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxp
ZW5AeGVuLm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDI2LzM3XSB4ZW4vYXJtOiBidWlsZCBOVU1BIGNwdV90
b19ub2RlIG1hcCBpbg0KPiBkdF9zbXBfaW5pdF9jcHVzDQo+IA0KPiBPbiBUaHUsIDIzIFNlcCAy
MDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBOVU1BIGltcGxlbWVudGF0aW9uIGhhcyBhIGNwdV90
b19ub2RlIGFycmF5IHRvIHN0b3JlIENQVSB0byBOT0RFDQo+ID4gbWFwLiBYZW4gaXMgdXNpbmcg
Q1BVIGxvZ2ljYWwgSUQgaW4gcnVudGltZSBjb21wb25lbnRzLCBzbyB3ZQ0KPiA+IHVzZSBDUFUg
bG9naWNhbCBJRCBhcyBDUFUgaW5kZXggaW4gY3B1X3RvX25vZGUuDQo+ID4NCj4gPiBJbiBkZXZp
Y2UgdHJlZSBjYXNlLCBjcHVfbG9naWNhbF9tYXAgaXMgY3JlYXRlZCBpbiBkdF9zbXBfaW5pdF9j
cHVzLg0KPiA+IFNvLCB3aGVuIE5VTUEgaXMgZW5hYmxlZCwgZHRfc21wX2luaXRfY3B1cyB3aWxs
IGZldGNoIENQVSBOVU1BIGlkDQo+ID4gYXQgdGhlIHNhbWUgdGltZSBmb3IgY3B1X3RvX25vZGUu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4g
PiAtLS0NCj4gPiAgeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyAgICAgfCAzNyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5o
IHwgIDUgKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBi
L3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiBpbmRleCA2MGMwZTgyZmM1Li42ZTNjYzhkM2Nj
IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiArKysgYi94ZW4v
YXJjaC9hcm0vc21wYm9vdC5jDQo+ID4gQEAgLTEyMSw3ICsxMjEsMTIgQEAgc3RhdGljIHZvaWQg
X19pbml0IGR0X3NtcF9pbml0X2NwdXModm9pZCkNCj4gPiAgICAgIHsNCj4gPiAgICAgICAgICBb
MCAuLi4gTlJfQ1BVUyAtIDFdID0gTVBJRFJfSU5WQUxJRA0KPiA+ICAgICAgfTsNCj4gPiArICAg
IHN0YXRpYyBub2RlaWRfdCBub2RlX21hcFtOUl9DUFVTXSBfX2luaXRkYXRhID0NCj4gPiArICAg
IHsNCj4gPiArICAgICAgICBbMCAuLi4gTlJfQ1BVUyAtIDFdID0gTlVNQV9OT19OT0RFDQo+ID4g
KyAgICB9Ow0KPiA+ICAgICAgYm9vbCBib290Y3B1X3ZhbGlkID0gZmFsc2U7DQo+ID4gKyAgICB1
aW50MzJfdCBuaWQgPSAwOw0KPiA+ICAgICAgaW50IHJjOw0KPiA+DQo+ID4gICAgICBtcGlkciA9
IHN5c3RlbV9jcHVpbmZvLm1waWRyLmJpdHMgJiBNUElEUl9IV0lEX01BU0s7DQo+ID4gQEAgLTE3
Miw2ICsxNzcsMjggQEAgc3RhdGljIHZvaWQgX19pbml0IGR0X3NtcF9pbml0X2NwdXModm9pZCkN
Cj4gPiAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gKyAg
ICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19OVU1BKSApDQo+ID4gKyAgICAgICAgew0KPiA+
ICsgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgKiBXaGVuIENPTkZJR19OVU1BIGlz
IHNldCwgdHJ5IHRvIGZldGNoIG51bWEgaW5mb21hdGlvbg0KPiA+ICsgICAgICAgICAgICAgKiBm
cm9tIENQVSBkdHMgbm9kZSwgb3RoZXJ3aXNlIHRoZSBuaWQgaXMgYWx3YXlzIDAuDQo+ID4gKyAg
ICAgICAgICAgICAqLw0KPiA+ICsgICAgICAgICAgICBpZiAoICFkdF9wcm9wZXJ0eV9yZWFkX3Uz
MihjcHUsICJudW1hLW5vZGUtaWQiLCAmbmlkKSApDQo+ID4gKyAgICAgICAgICAgIHsNCj4gPiAr
ICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICJjcHVbJWRdIGR0cyBwYXRoOiAlczogZG9lc24ndCBoYXZlIG51bWENCj4gaW5m
b3JtYXRpb24hXG4iLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiAldQ0KPiAN
Cj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY3B1aWR4LCBkdF9ub2RlX2Z1bGxfbmFt
ZShjcHUpKTsNCj4gDQo+IEkgdGhpbmsgdGhhdCB0aGlzIG1lc3NhZ2Ugc2hvdWxkbid0IGJlIGEg
d2FybmluZzogQ09ORklHX05VTUEgaXMgYQ0KPiBjb21waWxlIHRpbWUgb3B0aW9uLiBBbnlib2R5
IHRoYXQgZW5hYmxlcyBDT05GSUdfTlVNQSBpbiB0aGUgWGVuIGJ1aWxkDQo+IHdpbGwgZ2V0IHRo
aXMgd2FybmluZyBwcmludGVkIG91dCBhdCBib290IHRpbWUgaWYgWGVuIGlzIGJvb3Rpbmcgb24g
YQ0KPiByZWd1bGFyIG5vbi1OVU1BIG1hY2hpbmUsIHJpZ2h0Pw0KPiANCj4gVGhlIHdhcm5pbmcg
c2hvdWxkIG9ubHkgYmUgcHJpbnRlZCBpZiBOVU1BIGlzIGFjdGl2ZWx5IGVuYWJsZWQsIGUuZy4N
Cj4gdGhlcmUgaXMgYSBkaXN0YW5jZS1tYXAgYnV0IHRoZSBjcHVzIGRvbid0IGhhdmUgbnVtYS1u
b2RlLWlkLg0KPiANCj4gDQoNClllcywgdGhpcyBtZXNzYWdlIHdvdWxkIGJlIHVuZXhwZWN0ZWQg
b24gYSByZWd1bGFyIG5vbi1OVU1BIG1hY2hpbmUuDQpJIHdpbGwgc29tZSBjaGVjayBjb25kaXRp
b24gdG8gcHJpbnQgdGhpcyBtZXNzYWdlLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgLyoN
Cj4gPiArICAgICAgICAgICAgICAgICAqIER1cmluZyB0aGUgZWFybHkgc3RhZ2Ugb2YgTlVNQSBp
bml0aWFsaXphdGlvbiwgd2hlbg0KPiBYZW4NCj4gPiArICAgICAgICAgICAgICAgICAqIGZvdW5k
IGFueSBDUFUgZHRzIG5vZGUgZG9lc24ndCBoYXZlIG51bWEtbm9kZS1pZA0KPiBpbmZvLCB0aGUN
Cj4gPiArICAgICAgICAgICAgICAgICAqIE5VTUEgd2lsbCBiZSB0cmVhdGVkIGFzIG9mZiwgYWxs
IENQVSB3aWxsIGJlIHNldCB0bw0KPiBhIEZBS0UNCj4gPiArICAgICAgICAgICAgICAgICAqIG5v
ZGUgMC4gU28gaWYgd2UgZ2V0IG51bWEtbm9kZS1pZCBmYWlsZWQgaGVyZSwgd2UNCj4gc2hvdWxk
DQo+ID4gKyAgICAgICAgICAgICAgICAgKiBzZXQgbmlkIHRvIDAuDQo+ID4gKyAgICAgICAgICAg
ICAgICAgKi8NCj4gPiArICAgICAgICAgICAgICAgIG5pZCA9IDA7DQo+ID4gKyAgICAgICAgICAg
IH0NCj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgIC8qDQo+ID4gICAgICAgICAg
ICogOCBNU0JzIG11c3QgYmUgc2V0IHRvIDAgaW4gdGhlIERUIHNpbmNlIHRoZSByZWcgcHJvcGVy
dHkNCj4gPiAgICAgICAgICAgKiBkZWZpbmVzIHRoZSBNUElEUlsyMzowXQ0KPiA+IEBAIC0yMzEs
OSArMjU4LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkdF9zbXBfaW5pdF9jcHVzKHZvaWQpDQo+
ID4gICAgICAgICAgew0KPiA+ICAgICAgICAgICAgICBwcmludGsoImNwdSVkIGluaXQgZmFpbGVk
IChod2lkICUiUFJJcmVnaXN0ZXIiKTogJWRcbiIsIGksDQo+IGh3aWQsIHJjKTsNCj4gPiAgICAg
ICAgICAgICAgdG1wX21hcFtpXSA9IE1QSURSX0lOVkFMSUQ7DQo+ID4gKyAgICAgICAgICAgIG5v
ZGVfbWFwW2ldID0gTlVNQV9OT19OT0RFOw0KPiA+ICAgICAgICAgIH0NCj4gPiAtICAgICAgICBl
bHNlDQo+ID4gKyAgICAgICAgZWxzZSB7DQo+ID4gICAgICAgICAgICAgIHRtcF9tYXBbaV0gPSBo
d2lkOw0KPiA+ICsgICAgICAgICAgICBub2RlX21hcFtpXSA9IG5pZDsNCj4gPiArICAgICAgICB9
DQo+ID4gICAgICB9DQo+ID4NCj4gPiAgICAgIGlmICggIWJvb3RjcHVfdmFsaWQgKQ0KPiA+IEBA
IC0yNDksNiArMjc5LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkdF9zbXBfaW5pdF9jcHVzKHZv
aWQpDQo+ID4gICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICAgICAgICAgIGNwdW1hc2tfc2V0
X2NwdShpLCAmY3B1X3Bvc3NpYmxlX21hcCk7DQo+ID4gICAgICAgICAgY3B1X2xvZ2ljYWxfbWFw
KGkpID0gdG1wX21hcFtpXTsNCj4gPiArDQo+ID4gKyAgICAgICAgbmlkID0gbm9kZV9tYXBbaV07
DQo+ID4gKyAgICAgICAgaWYgKCBuaWQgPj0gTUFYX05VTU5PREVTICkNCj4gPiArICAgICAgICAg
ICAgbmlkID0gMDsNCj4gPiArICAgICAgICBudW1hX3NldF9ub2RlKGksIG5pZCk7DQo+ID4gICAg
ICB9DQo+ID4gIH0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL251
bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gaW5kZXggNzU4ZWFmZWIwNS4u
OGE0YWQzNzllMCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0K
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gQEAgLTQ2LDYgKzQ2LDEx
IEBAIGV4dGVybiBtZm5fdCBmaXJzdF92YWxpZF9tZm47DQo+ID4gICNkZWZpbmUgbm9kZV9zdGFy
dF9wZm4obmlkKSAobWZuX3goZmlyc3RfdmFsaWRfbWZuKSkNCj4gPiAgI2RlZmluZSBfX25vZGVf
ZGlzdGFuY2UoYSwgYikgKDIwKQ0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBudW1hX3Nl
dF9ub2RlKGludCBjcHUsIG5vZGVpZF90IG5vZGUpDQo+ID4gK3sNCj4gPiArDQo+ID4gK30NCj4g
PiArDQo+ID4gICNlbmRpZg0KPiA+DQo+ID4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGFy
Y2hfaGF2ZV9kZWZhdWx0X2RtYXpvbmUodm9pZCkNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

