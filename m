Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78426ED1A1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525535.816810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyMT-00032B-AK; Mon, 24 Apr 2023 15:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525535.816810; Mon, 24 Apr 2023 15:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqyMT-0002zf-7H; Mon, 24 Apr 2023 15:44:17 +0000
Received: by outflank-mailman (input) for mailman id 525535;
 Mon, 24 Apr 2023 15:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pqyMS-0002zX-8P
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:44:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcceec8a-e2b6-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 17:44:14 +0200 (CEST)
Received: from AS8P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::19)
 by DU0PR08MB9274.eurprd08.prod.outlook.com (2603:10a6:10:41a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 15:44:11 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::91) by AS8P251CA0030.outlook.office365.com
 (2603:10a6:20b:2f2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 15:44:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 15:44:10 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Mon, 24 Apr 2023 15:44:10 +0000
Received: from 7b026c4c8a00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B21E1024-AECE-4393-8E46-C486930AEDBA.1; 
 Mon, 24 Apr 2023 15:43:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b026c4c8a00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 15:43:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8701.eurprd08.prod.outlook.com (2603:10a6:150:b9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Mon, 24 Apr
 2023 15:43:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:43:56 +0000
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
X-Inumbo-ID: dcceec8a-e2b6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFcqQxD4pWX21r8QWLsCpwqkdRYPl2u+rTazAYdJ27A=;
 b=jJYvCJz4gpF0MfvddLguNF3vMYlYRK3MDffAo+fUjpqDHgDYcLXWWz0qTt4RXHK9fZMuexfuv9ZnIl+0DC7Rpjr1Lfyc5yG725cnrMv8sQc9wCj/tMfJHPMsJiAlfH0X2upSdzjiP/qgQxCWBgpJnSnoFGq47ygRsrz4vqqTyo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2061f3b29d5fb529
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4C2XzM/jSHcuDme81ZA/lYk8OCyYEsO8VlTyWbMo/ckcJshEBxcUaCeNVilbtwDM7tANAQd8ukwTfFbIkgoXbx4lBbJp+kceC+4kCoGIZIoN/Af/VuyHfWqSg/wtSNZcrXgZS34z0q0pB0NYXXmynKCQpOLZZBcTBOQ2mV+s8JdRhWrq/gW//GtrX6F9PQXl74KglI+uHCq/SjiYYNmXcgH/bDsaEzlbd7Vwx4Gu+EOAE41q1EoIkIL2rM3nM3EqvolPLUv1k6E3W5O2VbjaFvtdHyBlhya09KaqzkvAQHSbWaerKd+lgTVQH9rFqmHroeTMOzYn+QA3swFLCi92g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFcqQxD4pWX21r8QWLsCpwqkdRYPl2u+rTazAYdJ27A=;
 b=oa43FUbKLw45rVJw/SXiQoYSahO4/z3Y9+zdbufU2cyqodq4GxtWIuDBxAbAapMvFQTqsMd4s9d6ailvj8+MUrtubkRjS3PiIDSfflAFkv5rYvhVMKCPmDpMXYcQ5oi7R1f6zCB7M7emq9Ug0hc/mE/13yfY6f9xSL78O6lK+8v2oxywFcjPi0d21F3u7Fo2G/L5EsFraf3g7sUbcPsfMrbzkLY4GVo3MXfXXGFBGa8jK2yUgrEdhy3sJLXabNz/fiuo9YXq5jWLaWhnyIU17kWlo76+VKZK3sOOrGYbtmOY7jAMWyvSNMd6lJI3HQET4wcK2doThSS8M7LDbjUniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFcqQxD4pWX21r8QWLsCpwqkdRYPl2u+rTazAYdJ27A=;
 b=jJYvCJz4gpF0MfvddLguNF3vMYlYRK3MDffAo+fUjpqDHgDYcLXWWz0qTt4RXHK9fZMuexfuv9ZnIl+0DC7Rpjr1Lfyc5yG725cnrMv8sQc9wCj/tMfJHPMsJiAlfH0X2upSdzjiP/qgQxCWBgpJnSnoFGq47ygRsrz4vqqTyo4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZdnKG11PjGcmQuE2MpJrElBiS3686VJGAgAAo1ICAAAFsAIAADk4AgAACvwCAAANFAIAAAd0AgAACk4CAAAHsAIAAALeA
Date: Mon, 24 Apr 2023 15:43:56 +0000
Message-ID: <B534E482-71BF-4C5F-B9A8-3D567367F7AA@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
 <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
 <bd064b44-3531-a1b0-a7a8-1ad7ae434394@suse.com>
 <300BE89F-CA37-4A28-9CC5-5875E10D4A0C@arm.com>
 <a268313d-03be-9281-3627-c38115d3e5de@suse.com>
In-Reply-To: <a268313d-03be-9281-3627-c38115d3e5de@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8701:EE_|AM7EUR03FT025:EE_|DU0PR08MB9274:EE_
X-MS-Office365-Filtering-Correlation-Id: b2808641-cbb5-4269-d4e4-08db44dabf65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7WPq/4D9b8jfv5eeWtJKtDAkXURkx+bf8neQV/5hXikYzEUNSQR2ach0NrUedeIO/mDzXITyS5ho/mBttqplL29UyTpYtcbXY2JluqW7GNs+SzbfcE02lilJUlrdBQycYcUPTzCrLXWdZsfMRC5HGPVqbr3JVPKAbjXBLVho4wBSVyJxlo6uTH+OJUvkrE9bwLEIvd9lmAvtlXfgijPzTQT4a2fOteemRDe3Y/3wRDhk5zt21GD2df+B3EslUWG/nerzQNGM2O+JKP+bZkbJHui9Vf+hqo1X1q4sBGg4v45O9Bq8ThrVh8+knjN155Vihc7U61PF5GBi8x1ODX7PPHgEZzEUtQXFp99l/DBuLGmiYkRtftEW8pc7UTPl571RuARhKiQ/l6VAhPRCKAGBNnYT3rm7OIYVZpiQZ4p0UXS4uyn9F7l3v1+7+fwhIORPyU1M+jIYVMjGHwLZwjaZXoAOV3eiVZ6DqcLZhUz6xqdN5+LYUeXwicXcGMMm+6ki7Hzx1dLsFxVbhNu70pMqNLnIPvL8Yzsc7q3lk4DBA2yRb4aa8kq/ZzvVwGme6LE6dU4Cxi9+LNXZ0BdpfrcAHzDB8vklALHHj74jdyIyts4/azzfpJmcAyaT9lBG87gPwp+YrlVYvw7nxtbRL88bEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(316002)(66476007)(91956017)(66446008)(71200400001)(66946007)(66556008)(76116006)(6916009)(64756008)(4326008)(86362001)(478600001)(6486002)(5660300002)(36756003)(2616005)(8676002)(8936002)(122000001)(2906002)(38100700002)(54906003)(83380400001)(53546011)(33656002)(26005)(41300700001)(38070700005)(186003)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <281D286DE30CA44DAB8373871AC36ABA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8701
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b812720-6992-432f-58d4-08db44dab6c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ywnlXtV3gAAqqwykT7nOTrPNCh/MrX4xLSwp25IqRmtJ1oVFMzb5SGXA08WMQciVfjcUqZyFm4/Tg80DSQRguzgv9I1TMhZeJaxshaCLnHlizUggZYJO+z1U6KcoanVR1M6X4I5eQHOB8e4CFs8KtdbJQZyeHIY+4lQFmY7/D2srEXXz2ln3MLmebJJwT19B6k82v+Nc+Uz/rHvnFypfvgPRv4ywOC00x9EjwpmHfPmF9YR+tirDevfWXFS6O6/9oXdSF+BgsIaeyt0GKAX/opRdOcdFBOtMsV4oTd08PJCUv6Eno+8GTcvMsXmw6uoUb4EFBX1cwjyEQIh+7Ergddj4lm5BIn/GJWjsq+jhRm5xdSEu49/bGadFFqwVdoh+wAS0LbmZFcum6jKJacxF+owc097A7eEowr86R7XfpNNFX92rpKhpRFy9O4yayT/OVZD7OmZeGkuqY0PRKwYJIrB+SabDOu5HySbnqiKGjYcjTV2HWwgW62UYSR+GERtzVAlHlzUV+DgnPu58o/obvfsGrplZ39FOLUjTw1AUCpmNy6ScjlUsrrrbUQZnmgh91JukPwSNLOAuWHZ9Rulfq9zDGTSjZ5ln87HZ2rMONXqRU6pX1jFcLo66WrtI9vNlrViVmrPCP5TtfZhKm3DCuMhsRsmYofXezy6SvItNgOMb+HXiJgxI/WrFEhJ4+uI6LuqsT7itsiz7bfOpyvNeew==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(70206006)(70586007)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(41300700001)(33656002)(82310400005)(36756003)(86362001)(40480700001)(356005)(6512007)(26005)(186003)(81166007)(53546011)(478600001)(6486002)(36860700001)(83380400001)(47076005)(2616005)(336012)(6506007)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:44:10.6957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2808641-cbb5-4269-d4e4-08db44dabf65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9274

DQoNCj4gT24gMjQgQXByIDIwMjMsIGF0IDE2OjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDQuMjAyMyAxNzozNCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyNCBBcHIgMjAyMywgYXQgMTY6MjUsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjQuMDQuMjAyMyAxNzoxOCwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDI0IEFwciAyMDIzLCBhdCAxNjowNiwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDI0LjA0LjIwMjMgMTY6NTcsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+IE9uIDI0IEFwciAyMDIzLCBhdCAxNTowNSwgSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+Pj4gT24gMjQuMDQuMjAyMyAx
NjowMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAyNCBBcHIgMjAyMywgYXQg
MTI6MzQsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pj4g
T24gMjQuMDQuMjAyMyAwODowMiwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4+Pj4gQEAg
LTMwLDkgKzM3LDExIEBAIGludCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2Y3B1ICp2KTsNCj4+
Pj4+Pj4+Pj4gdm9pZCBzdmVfY29udGV4dF9mcmVlKHN0cnVjdCB2Y3B1ICp2KTsNCj4+Pj4+Pj4+
Pj4gdm9pZCBzdmVfc2F2ZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7DQo+Pj4+Pj4+Pj4+IHZvaWQg
c3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOw0KPj4+Pj4+Pj4+PiArYm9vbCBzdmVf
ZG9tY3RsX3ZsX3BhcmFtKGludCB2YWwsIHVuc2lnbmVkIGludCAqb3V0KTsNCj4+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4+ICNlbHNlIC8qICFDT05GSUdfQVJNNjRfU1ZFICovDQo+Pj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+PiArI2RlZmluZSBvcHRfZG9tMF9zdmUgICAgICgwKQ0KPj4+Pj4+Pj4+PiAjZGVm
aW5lIGlzX3N2ZV9kb21haW4oZCkgKDApDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBzdGF0aWMg
aW5saW5lIHJlZ2lzdGVyX3QgY29tcHV0ZV9tYXhfemNyKHZvaWQpDQo+Pj4+Pj4+Pj4+IEBAIC01
OSw2ICs2OCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3Qg
dmNwdSAqdikge30NCj4+Pj4+Pj4+Pj4gc3RhdGljIGlubGluZSB2b2lkIHN2ZV9zYXZlX3N0YXRl
KHN0cnVjdCB2Y3B1ICp2KSB7fQ0KPj4+Pj4+Pj4+PiBzdGF0aWMgaW5saW5lIHZvaWQgc3ZlX3Jl
c3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiAr
c3RhdGljIGlubGluZSBib29sIHN2ZV9kb21jdGxfdmxfcGFyYW0oaW50IHZhbCwgdW5zaWduZWQg
aW50ICpvdXQpDQo+Pj4+Pj4+Pj4+ICt7DQo+Pj4+Pj4+Pj4+ICsgICAgcmV0dXJuIGZhbHNlOw0K
Pj4+Pj4+Pj4+PiArfQ0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uY2UgYWdhaW4gSSBkb24ndCBz
ZWUgdGhlIG5lZWQgZm9yIHRoaXMgc3R1Yjogb3B0X2RvbTBfc3ZlIGlzICNkZWZpbmUtZA0KPj4+
Pj4+Pj4+IHRvIHBsYWluIHplcm8gd2hlbiAhQVJNNjRfU1ZFLCBzbyB0aGUgb25seSBjYWxsIHNp
dGUgbWVyZWx5IHJlcXVpcmVzIGENCj4+Pj4+Pj4+PiB2aXNpYmxlIGRlY2xhcmF0aW9uLCBhbmQg
RENFIHdpbGwgdGFrZSBjYXJlIG9mIGVsaW1pbmF0aW5nIHRoZSBhY3R1YWwgY2FsbC4NCj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4gSeKAmXZlIHRyaWVkIHRvIGRvIHRoYXQsIEnigJl2ZSBwdXQgdGhlIGRl
Y2xhcmF0aW9uIG91dHNpZGUgdGhlIGlmZGVmIHNvIHRoYXQgaXQgd2FzIGFsd2F5cyBpbmNsdWRl
ZA0KPj4+Pj4+Pj4gYW5kIEkgcmVtb3ZlZCB0aGUgc3R1YiwgYnV0IEkgZ290IGVycm9ycyBvbiBj
b21waWxhdGlvbiBiZWNhdXNlIG9mIHVuZGVmaW5lZCBmdW5jdGlvbi4NCj4+Pj4+Pj4+IEZvciB0
aGF0IHJlYXNvbiAgSSBsZWZ0IHRoYXQgY2hhbmdlIG91dC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IElu
dGVyZXN0aW5nLiBJIGRvbid0IHNlZSB3aGVyZSB0aGUgcmVmZXJlbmNlIHdvdWxkIGJlIGNvbWlu
ZyBmcm9tLg0KPj4+Pj4+IA0KPj4+Pj4+IENvdWxkIGl0IGJlIGJlY2F1c2UgdGhlIGRlY2xhcmF0
aW9uIGlzIHZpc2libGUsIG91dHNpZGUgdGhlIGlmZGVmLCBidXQgdGhlIGRlZmluaXRpb24gaXMg
bm90IGNvbXBpbGVkIGluPyANCj4+Pj4+IA0KPj4+Pj4gV2VsbCwgeWVzLCBsaWtlbHkuIEJ1dCB0
aGUgcXVlc3Rpb24gaXNuJ3QgdGhhdCBidXQgIldoeSBkaWQgdGhlIHJlZmVyZW5jZQ0KPj4+Pj4g
bm90IGdldCByZW1vdmVkLCB3aGVuIGl0J3MgaW5zaWRlIGFuIGlmKDApIGJsb2NrPyINCj4+Pj4g
DQo+Pj4+IE9oIG9rLCBJIGRvbuKAmXQga25vdywgaGVyZSB3aGF0IEkgZ2V0IGlmIGZvciBleGFt
cGxlIEkgYnVpbGQgYXJtMzI6DQo+Pj4+IA0KPj4+PiBhcm0tbGludXgtZ251ZWFiaWhmLWxkIC1F
TCAtVCBhcmNoL2FybS94ZW4ubGRzIC1OIHByZWxpbmsubyBcDQo+Pj4+IC4vY29tbW9uL3N5bWJv
bHMtZHVtbXkubyAtbyAuLy54ZW4tc3ltcy4wDQo+Pj4+IGFybS1saW51eC1nbnVlYWJpaGYtbGQ6
IHByZWxpbmsubzogaW4gZnVuY3Rpb24gYGNyZWF0ZV9kb21Vcyc6DQo+Pj4+ICguaW5pdC50ZXh0
KzB4MTM0NjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzdmVfZG9tY3RsX3ZsX3BhcmFtJw0K
Pj4+IA0KPj4+IEluIHBhcnRpY3VsYXIgd2l0aCBzZWVpbmcgdGhpczogV2hhdCB5b3UgY29waWVk
IGhlcmUgaXMgYSBidWlsZCB3aXRoIHRoZQ0KPj4+IHNlcmllcyBhcHBsaWVkIG9ubHkgdXAgdG8g
dGhpcyBwYXRjaD8gSSBhc2sgYmVjYXVzZSB0aGUgcGF0Y2ggaGVyZSBhZGRzIGENCj4+PiBjYWxs
IG9ubHkgb3V0IG9mIGNyZWF0ZV9kb20wKCkuDQo+PiANCj4+IE5vIEnigJl2ZSBkbyB0aGUgY2hh
bmdlcyBvbiB0b3Agb2YgdGhlIHNlcmllLCBJ4oCZdmUgdHJpZWQgaXQgbm93LCBvbmx5IHRvIHRo
aXMgcGF0Y2ggYW5kIGl0IGJ1aWxkcyBjb3JyZWN0bHksDQo+PiBJdCB3YXMgbXkgbWlzdGFrZSB0
byBkb27igJl0IHJlYWQgY2FyZWZ1bGx5IHRoZSBlcnJvciBvdXRwdXQuDQo+PiANCj4+IEFueXdh
eSBJIGd1ZXNzIHRoaXMgY2hhbmdlIGlzIG5vdCBhcHBsaWNhYmxlIGJlY2F1c2Ugd2UgZG9u4oCZ
dCBoYXZlIGEgc3ltYm9sIHRoYXQgaXMgcGxhaW4gMCBmb3IgZG9tVXMNCj4+IHRvIGJlIHBsYWNl
ZCBpbnNpZGUgY3JlYXRlX2RvbVVzLg0KPiANCj4gUG9zc2libGUsIGJ1dCB3b3VsZCB5b3UgbWlu
ZCBmaXJzdCB0ZWxsaW5nIG1lIGluIHdoaWNoIG90aGVyIHBhdGNoKGVzKSB0aGUNCj4gZnVydGhl
ciByZWZlcmVuY2UocykgYXJlIGJlaW5nIGludHJvZHVjZWQsIHNvIEkgY291bGQgdGFrZSBhIGxv
b2sgd2l0aG91dA0KPiAoYWdhaW4pIGRpZ2dpbmcgdGhyb3VnaCB0aGUgZW50aXJlIHNlcmllcz8N
Cg0KU3VyZSwgdGhlIG90aGVyIHJlZmVyZW5jZXMgdG8gdGhlIGZ1bmN0aW9uIGFyZSBpbnRyb2R1
Y2VkIGluICJ4ZW4vYXJtOiBhZGQgc3ZlIHByb3BlcnR5IGZvciBkb20wbGVzcyBkb21Vc+KAnSBw
YXRjaCAxMQ0KDQo+IA0KPiBKYW4NCg0KDQo=

