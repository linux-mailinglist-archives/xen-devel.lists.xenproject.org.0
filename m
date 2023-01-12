Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10371666C61
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 09:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475889.737773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsxk-0007W1-Dn; Thu, 12 Jan 2023 08:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475889.737773; Thu, 12 Jan 2023 08:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsxk-0007TJ-AH; Thu, 12 Jan 2023 08:29:28 +0000
Received: by outflank-mailman (input) for mailman id 475889;
 Thu, 12 Jan 2023 08:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=41ci=5J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFsxi-0007TD-MW
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 08:29:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 376ae5b2-9253-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 09:29:23 +0100 (CET)
Received: from DB6PR1001CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::25)
 by AS8PR08MB6504.eurprd08.prod.outlook.com (2603:10a6:20b:336::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 08:29:20 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::f3) by DB6PR1001CA0015.outlook.office365.com
 (2603:10a6:4:b7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:29:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 12 Jan 2023 08:29:19 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Thu, 12 Jan 2023 08:29:19 +0000
Received: from 55b07ef79176.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91BA8309-165C-4137-B154-3A2EF281DCA1.1; 
 Thu, 12 Jan 2023 08:29:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 55b07ef79176.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Jan 2023 08:29:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV2PR08MB8750.eurprd08.prod.outlook.com (2603:10a6:150:b6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 08:29:06 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 08:29:06 +0000
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
X-Inumbo-ID: 376ae5b2-9253-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL/iYYTLzQHhiT5NJsqQUflNwBq/XnQTi7AVoBheryk=;
 b=Oa/yaxVGAUB0Rj19ZnEEe+KIJVFwq+RaRRFQTGC3a/lvsJcNQ5aCiQGehDRh7mhntZixha5GnP4RJqMYL5UpIbhV15RyjU4EMkbk1b1VTwbS510Zeh7hZnm1kjzjehil0l3lpjwy/Ts6Z1e+5v3pkhJ2rF7/lF4K8+xdIO3h0BM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmG8eWe4dlobd7eEWvDmTZd6ThgCekBpIr2vPOLvYVWkPTbQ87EmQTfEezkcRQiKS1L3/KDYqQkUw4TJeX3fBrkr/Rzm7lTLG2b90r0QsbM/JgHxhuldHxRjOsjr5NHhCbv3X2ZyZeR8Et2V/ac0TMKmmBSVWRQcQ7BkLZ54D7HxXdn34R1M/Sdp3EcLMQwDlTbGiNyxMiUNbWIDRXDdR10S//hbSQZsIJgmSI9hWqPPy57Vy8hjxuBMuET5/ISirZoQBSagMdTXe74nedqkFATMy5hDrSqBOn+HGdamuRXVrtvdidCaeHWBxGLmpC1w/0KYjBTsmEfr6xSy5GmRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL/iYYTLzQHhiT5NJsqQUflNwBq/XnQTi7AVoBheryk=;
 b=Cyzf6+iSsykWj/xpmqtOspoNxPEgVedyjRhrPJkIWY3gBQP6SnNDMufJiz1xjNylUFSXOGVwdS2JaJ64BHZuHAlcL7KR+mHBzsqMrNhYCBe+v3NKo5YCHaNv2x9VqbzhEfMMKoF2ueyrAs6qKfemzor/fl50qIVeA+2sPUjbNCnHFExijiJ/KtyXgAojXyUa5b1b8toWNkuP82+5q9deHlZgs9BsASBbNs4yvJ3fICJWm7c0ezdkERO0aOEKdc+LM+Bn7kd0J/DLVsLaa7FpOoOMvL7ydYIHQAx4cxZhmiruXtw3XUCNFX1GFlKHj/Qou7K3oYS8svFN/UKgnwjRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL/iYYTLzQHhiT5NJsqQUflNwBq/XnQTi7AVoBheryk=;
 b=Oa/yaxVGAUB0Rj19ZnEEe+KIJVFwq+RaRRFQTGC3a/lvsJcNQ5aCiQGehDRh7mhntZixha5GnP4RJqMYL5UpIbhV15RyjU4EMkbk1b1VTwbS510Zeh7hZnm1kjzjehil0l3lpjwy/Ts6Z1e+5v3pkhJ2rF7/lF4K8+xdIO3h0BM=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v2 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index: AQHZJNEfrPi0xon1hUWBAoFjpzsCdK6X3MQAgAJ3JNCAAB1cgIAAAqfA
Date: Thu, 12 Jan 2023 08:29:05 +0000
Message-ID:
 <PAXPR08MB7420F074E71EF0C02A5DD6F99EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-4-wei.chen@arm.com>
 <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
 <PAXPR08MB7420A4E3DA252F9F37450EDA9EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <ee06b9a7-bfc7-e6f1-f2f6-f73a1fb42d6d@suse.com>
In-Reply-To: <ee06b9a7-bfc7-e6f1-f2f6-f73a1fb42d6d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EC1657997C37974EB9B39B4D0E357F87.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|GV2PR08MB8750:EE_|DBAEUR03FT043:EE_|AS8PR08MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ee3c03-5407-423c-a805-08daf47719f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nZAtoqf1S4HJ9o1Bo7u3yCtS59qUo6OjyhGbfiG6lTJBBqvHIUazKzmeFjc9NqqD9Y0ggtks/+sAkfiblwFZR7LTG5GXGZWMLQnzMrqIIIZGtOjcnhbZo6RFi6gRdJ9N6kc0P6rqdeAFRjmOJNBrPL/XsFxT/MQimaBo2xDf8FtMzaftF4fxj2XDnso4TIHZTIPJ+RA4wlowxv7flrdfuOZhjzhCAhbASmmhCatToXr9Cfo0Ad9OO0mWecjZ4OIytrqDAY5W9R58H9d6lAdGqF9MzmTmkIH2nAX5rskdF3zCaLBGCG9F6dhE/Izam/fLuiSNZ3qOF+Nva1VZMkW/VDxhTPZ2sJERgDD454r+cGGchPlw+yNZhqRqN38Rk1cDtfelah+8x18/bic+uPjiY5U7LH0tbilrVhPr451QfVLYUnaHtsnXZ18a/U7bjIIk6bSZ5mGHGgJirHZuV/asWWCSScQE0dwv9pLsIha/uJIdvehlCdMKt/R/lrj2psmlh9UsNUuzg7+9xFSaPtKu37HPUTld5QEqW39CIGQeIR8H4Z906mpWzqkz1v5pdVShicGsHy2qGbu+98sVoLbe4eYQWAZpJDRrYBi7gXIAgCZgERAyzdTmoBBiJWKXQqtsyD68/8BQX+Y2HN3lTHOIN2boxBMR/pcj8tIqkeS/8tMi9pwSsxNuz3/g/G7GnXy55APLa7fc0dZ32RB+9xO33almGhN1J9QPwgXv6hsxJtM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199015)(38100700002)(122000001)(66476007)(66446008)(4326008)(64756008)(86362001)(54906003)(6916009)(66556008)(66946007)(76116006)(38070700005)(33656002)(8676002)(41300700001)(8936002)(55016003)(316002)(2906002)(5660300002)(52536014)(7696005)(83380400001)(186003)(966005)(53546011)(71200400001)(26005)(6506007)(478600001)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8750
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25a5b978-5db1-47f6-3465-08daf47711a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S+eI4lkpq/2RXdrnSGuzWUZ+Bfw8gbONIkYgezQeWC7O4NiKGTRweG8hJkmuF7wxhSUPEVyuKqXHaS4CuBFSh5mAlJOF3SS29yiBHVEHYnoXF5cjJVcz+nTeJrOEUm3C/7t1rmHwI8Br34MZkaY5kYjm+rqexoU76iTro+lpUBE0Fr1mqsr3lrwLYnj9X42kch7LhYSB+Cw6jjLcK0GNAqqU2fvBsC53VXlErL+Z6fhbuIzOjOHDi0HxkvNuhAVA7ezohDB0rQGzxQQy1895DlZzJMitDDKHwnsM+4+JeToL9tdgDV0DcmOzxWeuH8AwMSLHKICK/Cm9HoIZlD3xWWuHUX0cM1LzY6K4ll7fq6MJvDzp18W2oXPEQpv/LKEFa1rs7oNtvlXh+WzUM8NB5pahWt3Vqxs2nmpHuO8NXcbIdCO9zbquGwYsvVYub3ZCKfWKAH2ks6XRJRkhWvnW/k8w0z4n3D6dGuNiUhGP3kf188smr8Hl/tt90JDf/KkuChaz6KMMXF37OVqZ3EOhQzYhjkwpRySeec3LO2EbOySe/9nKTQMI4oXsukcctQlVXbW1sVDfStziUrEwFv6mVNyUL02j2dSPjJ/aEymmSNtFzceAhMcsmUoZNjyIs0cduzBQR1r7z3/Evvo6S9OCS80wPcrW7NHixEgpp/rInKlfVZvu0LUOJ51B9H7gZ/ssqegHEORmex+Rvx7t2aqdfdOBVR7byypriIICIwpMbUE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(70586007)(6862004)(8936002)(70206006)(36860700001)(4326008)(52536014)(8676002)(82310400005)(81166007)(5660300002)(356005)(33656002)(86362001)(2906002)(316002)(40460700003)(54906003)(83380400001)(26005)(7696005)(41300700001)(336012)(47076005)(478600001)(82740400003)(186003)(40480700001)(53546011)(55016003)(966005)(9686003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:29:19.9834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ee3c03-5407-423c-a805-08daf47719f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6504

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyM+W5tDHmnIgxMuaXpSAxNjoxMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbg0KPiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgV2VpDQo+IExpdSA8d2xAeGVuLm9y
Zz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAzLzE3XSB4
ZW4vYXJtOiBpbXBsZW1lbnQgbm9kZSBkaXN0YW5jZSBoZWxwZXJzIGZvcg0KPiBBcm0NCj4gDQo+
IE9uIDEyLjAxLjIwMjMgMDc6MzEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+IFNlbnQ6IDIwMjPlubQx5pyIMTHml6UgMDo0Nw0KPiA+Pg0KPiA+PiBPbiAxMC4wMS4y
MDIzIDA5OjQ5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9udW1hLmgNCj4gPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9udW1h
LmgNCj4gPj4+IEBAIC0yOCw2ICsyOCwyMCBAQCBlbnVtIGR0X251bWFfc3RhdHVzIHsNCj4gPj4+
ICAgICAgRFRfTlVNQV9PRkYsDQo+ID4+PiAgfTsNCj4gPj4+DQo+ID4+PiArLyoNCj4gPj4+ICsg
KiBJbiBBQ1BJIHNwZWMsIDAtOSBhcmUgdGhlIHJlc2VydmVkIHZhbHVlcyBmb3Igbm9kZSBkaXN0
YW5jZSwNCj4gPj4+ICsgKiAxMCBpbmRpY2F0ZXMgbG9jYWwgbm9kZSBkaXN0YW5jZSwgMjAgaW5k
aWNhdGVzIHJlbW90ZSBub2RlDQo+ID4+PiArICogZGlzdGFuY2UuIFNldCBub2RlIGRpc3RhbmNl
IG1hcCBpbiBkZXZpY2UgdHJlZSB3aWxsIGZvbGxvdw0KPiA+Pj4gKyAqIHRoZSBBQ1BJJ3MgZGVm
aW5pdGlvbi4NCj4gPj4+ICsgKi8NCj4gPj4+ICsjZGVmaW5lIE5VTUFfRElTVEFOQ0VfVURGX01J
TiAgIDANCj4gPj4+ICsjZGVmaW5lIE5VTUFfRElTVEFOQ0VfVURGX01BWCAgIDkNCj4gPj4+ICsj
ZGVmaW5lIE5VTUFfTE9DQUxfRElTVEFOQ0UgICAgIDEwDQo+ID4+PiArI2RlZmluZSBOVU1BX1JF
TU9URV9ESVNUQU5DRSAgICAyMA0KPiA+Pg0KPiA+PiBJbiB0aGUgYWJzZW5jZSBvZiBhIGNhbGxl
ciBvZiBudW1hX3NldF9kaXN0YW5jZSgpIGl0IGlzIGVudGlyZWx5DQo+IHVuY2xlYXINCj4gPj4g
d2hldGhlciB0aGlzIHR5aW5nIHRvIEFDUEkgdXNlZCB2YWx1ZXMgaXMgYWN0dWFsbHkgYXBwcm9w
cmlhdGUuDQo+ID4+DQo+ID4NCj4gPiBGcm9tIEtlcm5lbCdzIE5VTUEgZGV2aWNlIHRyZWUgYmlu
ZGluZywgaXQgc2VlbXMgRFQgTlVNQSBhcmUgcmV1c2luZw0KPiA+IEFDUEkgdXNlZCB2YWx1ZXMg
Zm9yIGRpc3RhbmNlcyBbMV0uDQo+IA0KPiBJIGNhbid0IGZpbmQgYW55IG1lbnRpb24gb2YgQUNQ
SSBpbiB0aGF0IGRvYywgc28gdGhlIGV4YW1wbGUgdmFsdWVzIHVzZWQNCj4gdGhlcmUgbWF0Y2hp
bmcgQUNQSSdzIG1heSBhbHNvIGJlIGNvaW5jaWRlbnRhbC4gSW4gbm8gZXZlbnQgY2FuIGEgTGlu
dXgNCj4ga2VybmVsIGRvYyBzZXJ2ZSBhcyBEVCBzcGVjaWZpY2F0aW9uLiBJZiB2YWx1ZXMgYXJl
IHRvIG1hdGNoIEFDUEkncywgSQ0KPiBleHBlY3QgYSBEVCBzcGVjIHRvIGFjdHVhbGx5IHNheSBz
by4NCj4gDQoNClVuZm9ydHVuYXRlbHksIHRoZSBsYXRlc3QgZGV2aWNlIHRyZWUgc3BlYyBkb2Vz
bid0IGhhdmUgYW55IE5VTUENCmRlc2NyaXB0aW9uIFsxXS4gQnV0IGlmIHdlIGRlZmluZSBkaWZm
ZXJlbnQgdmFsdWVzIGZvciBEVCBOVU1BIGluIFhlbiwNCndlIG1heSBoYXZlIGFuIGluY29tcGF0
aWJsZSB3aXRoIExpbnV4IERULg0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUt
b3JnL2RldmljZXRyZWUtc3BlY2lmaWNhdGlvbi9yZWxlYXNlcy9kb3dubG9hZC92MC40LXJjMS9k
ZXZpY2V0cmVlLXNwZWNpZmljYXRpb24tdjAuNC1yYzEucGRmDQoNCkNoZWVycywNCldlaSBDaGVu
DQoNCj4gSmFuDQo=

