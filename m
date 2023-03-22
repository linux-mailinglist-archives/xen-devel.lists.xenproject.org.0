Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D776C43D5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513110.793630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesZV-00083A-8V; Wed, 22 Mar 2023 07:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513110.793630; Wed, 22 Mar 2023 07:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesZV-00080f-4n; Wed, 22 Mar 2023 07:07:45 +0000
Received: by outflank-mailman (input) for mailman id 513110;
 Wed, 22 Mar 2023 07:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxM9=7O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pesZT-00080Z-BN
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:07:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c72c228-c880-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 08:07:42 +0100 (CET)
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by DB9PR08MB7626.eurprd08.prod.outlook.com
 (2603:10a6:10:30a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:07:38 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::86) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 07:07:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 07:07:38 +0000
Received: ("Tessian outbound 0df938784972:v135");
 Wed, 22 Mar 2023 07:07:38 +0000
Received: from fb6b34b52245.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF78EDFF-5FA2-49FA-AF1D-A214B6F03FB3.1; 
 Wed, 22 Mar 2023 07:07:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb6b34b52245.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 07:07:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS1PR08MB7634.eurprd08.prod.outlook.com (2603:10a6:20b:476::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:07:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:07:30 +0000
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
X-Inumbo-ID: 3c72c228-c880-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx67raBl15RTTLZh5+eCLx2dxPgny+lf0JL25kdUpAM=;
 b=B3LQnE0PVEmVW8t0WzLyn/7SQA5s1Qq9D8v/yLU/+mf1VDLNTBykNLIokY5zt4D+VGAF8hXswbCkKYG0u5oHtr9EHFR7HcyFSrDx7r0coBPM+hhZ87fC1dzbzaaIWAvWkULH9hxLHnHy48UiQZXRPM6a3NmAmdX91qDATNNXv1A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a6d3e2287c35f9e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMU6uDQ8e0W8QZLipdhhcRpLoHGFA4AbRidQew5eZ+2riDUtQMlaYSbRLIIpArKI9efIZRx1vesydMY+SJ03hivirLC4ariFvxQYURVebKUI39NZuvvAkAuPw0QB9miDsStgr6mC/3VEwW8R1kf2xcxIrjPvmZwuNE05sDBgEgJglQwBdh+xONQpwju3fUA43c9Bk7qM3t8twcph/nOqAMTlTcEuTwmAciWCXKLuskWG2t24kA6Q2uMHhXvNaXMC78i3yYuUCl7MpPRHQY+we8Ay+QDb4IuYKz1sVI+WLf33Fhn/nB+HY8qlEKSTBzYQpegD+w1dAwJ884+JEIPTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx67raBl15RTTLZh5+eCLx2dxPgny+lf0JL25kdUpAM=;
 b=C6JEGsfE7fZq4l3Zvb3hGfFsFpsniteldnq8atYeNoTK/6qHyr9dX8Fqsv5yafn2idx8o7wIUuSOLn7dX5vQsHNxzkOATFHlgOi/ncaJubqRqr/WgOlvAHAWvKMBbozb8RfM3uyqaSTvMSF2mhntU+MMEuFpMEXi1PilvrnlmQP3KXQy18qTAmx5DkMnaaFAhG5NWt8kVZnWeKd2QFGAFz/lP85UFP4jK4R5U2O4RQ809DqlBWcZ6sz0pvc2aYlaZHV2UN+CrsJE+F5A+o1av9egitEKUYLQFZYCBjPZM6lC++TS9Mh7ujX00xU3tBbSsfnsXHGXW/KPQMM1KXs9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx67raBl15RTTLZh5+eCLx2dxPgny+lf0JL25kdUpAM=;
 b=B3LQnE0PVEmVW8t0WzLyn/7SQA5s1Qq9D8v/yLU/+mf1VDLNTBykNLIokY5zt4D+VGAF8hXswbCkKYG0u5oHtr9EHFR7HcyFSrDx7r0coBPM+hhZ87fC1dzbzaaIWAvWkULH9hxLHnHy48UiQZXRPM6a3NmAmdX91qDATNNXv1A=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 02/10] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v3 02/10] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZWNND7RB779g4ZEeiitO407LYja8DZZUAgAMCpoA=
Date: Wed, 22 Mar 2023 07:07:30 +0000
Message-ID: <33D53928-371F-4649-96FF-7EC4EABF5D48@arm.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-3-luca.fancellu@arm.com>
 <204dbe14-c1e9-8d56-4923-4a867c3d2c4b@suse.com>
In-Reply-To: <204dbe14-c1e9-8d56-4923-4a867c3d2c4b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS1PR08MB7634:EE_|DBAEUR03FT040:EE_|DB9PR08MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc7b4b8-143b-42b1-a835-08db2aa41ed4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s9OrrPNUOSzRDIV5ZbtH7X9HR182W32XqZvnyQNAMH4w87GSEkfQk9sj+W0i7+TYM3YL8HOzU3003sTmu9RPG2ZHQQDEJ8DAW2Q94jzp6qOS3xcTdz39QMqkICgrS1q4FTuFVsa0JFBysG/p2kQs6rBq6fvJbs0aGiFvuy+dMKhyCPyGwpJmzxygpUpkz2WRb4DhL+kgicVOoHyQAfg9c6gDBT7MvEz2AgnCOu4QeyHqTyexYID01snwyF6ezVn8CIhOJ4k0h3wRtox8+pwiP3q2X21vxl8KCpI9NXuyHA34dGjXzIV7leHw0fH8GRrlvPhbAs7Jm4OJXz4V/vAcd0jhc4VA04jdCcItFV/uEy+8RAUM2bdlUtB3KEKNZJfYOfRah+RsnDUTDXmYJy1IqZdNlROAJ4VwFFESSz9cldJbyh2zigmJlDkN7lKPkDXDpxKGdeWHs8hVcCXBj+k2yMp7HCqEDlzC519nR427SyU6XvrrCJ+OrnjoT3dfoIKdwkaNih131ckhe2PK/L6/SuPsvyfPIjl+/5ifu3p4UqE7AY4JDXoXcrIo1GKThchb0NUYEozEzqL2juBGO/F/cjA6OmR/zdkaPvNAev+NM8ELMDGXxxPoRDv/12Y9Eft1Ja4xcyZAhL8hXa24czOydt+EPOsGKJom7XZ6f2teIBAceaeET+bu79w7VDXj3rBUoHpZROn+DeOivdNMTsCYY2OKuQymm4oLvzfkQBqB//A=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199018)(186003)(478600001)(26005)(6486002)(8676002)(6506007)(83380400001)(54906003)(71200400001)(6512007)(53546011)(2616005)(91956017)(316002)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(6916009)(8936002)(5660300002)(41300700001)(122000001)(4326008)(2906002)(38100700002)(86362001)(33656002)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0E5FCF1D1E48245AF5984EF53610470@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7634
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f295a9b3-5ae3-4e31-3250-08db2aa419f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZblVolvMxh9oDzX1dvaHU2cIuK5ZpaRzWZx+qlOzzTvH19DTbjqjNxX48OAQUh4rBdEOOTIftlrjPObLQ0+3MfV/UFHDQA1voM1zecf8ii3pQbQVl+vWSQ/Jo5FcpPEydw95SeXVxqgjyDe1J73qrFY+Gk44WfzKxDl9VTTFCDqFlDoVAeLP0JR4XVjh3ZSeB7y6rj4kO/JHSz72dmINkTRTIl8iUwMcFH3x5xUS6zY8MhSMBdcRwD8iOnMP/SKV3HhlbQRY4IIc3qFvAfJD1vhGh56VmxCg1TSKIy4uF0esfnw+SSmXVDyjbVyDsMcslqJvfU+cNqD3Z0QtrE57sDIbUtVSWJ7M/2oQxCqgXQ7y4zmhs8PPwNugXCTaloHMvSEp0xz2KXp8AHThN5V1Cds2T5CvBCh00oSUJE/vMTT5FKyiTLkWUq0Eas34fcqNzX3EPE2nrBWQCrqjbHTV9MbCDA1c9mJtgXA+biAv22KkKKQMAONWErDYiiMTVZV1IQ5k/du1LzaPVdJwYUv3P1XAiSYuZG0MvsWVvOTC4FfxinGkKacBvRuQRK8PQ+ozlPiZWF54rO3KTMA2psGrX6jFGlGuevCIhdbp5qpuAIB0IYy/LpE/a1v2FDI8ad9YFJh7eoIYqe1+BWt8CaFJjv9pllipHmkW+y3boZtc56hgiEyqVXHa8HNIBvcIZA6hXxwG8YPF/XxRowIOXfhngw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(186003)(2616005)(316002)(6486002)(336012)(83380400001)(47076005)(478600001)(70586007)(70206006)(8676002)(6512007)(6506007)(26005)(54906003)(53546011)(4326008)(36860700001)(41300700001)(5660300002)(6862004)(81166007)(82740400003)(40460700003)(2906002)(8936002)(82310400005)(40480700001)(356005)(36756003)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:07:38.3157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc7b4b8-143b-42b1-a835-08db2aa41ed4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7626

DQoNCj4gT24gMjAgTWFyIDIwMjMsIGF0IDA5OjA5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTcuMDMuMjAyMyAxNDoxOSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEBAIC03NDQsNiArNzczLDkgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1
Y3QgZG9tYWluICpkLA0KPj4gICAgIGlmICggKHJjID0gZG9tYWluX3ZwY2lfaW5pdChkKSkgIT0g
MCApDQo+PiAgICAgICAgIGdvdG8gZmFpbDsNCj4+IA0KPj4gKyAgICAvKiBDb3B5IGFuZCBkZWNv
ZGUgc3ZlX3ZsIGZyb20gdGhlIGRvbWFpbiBjb25maWd1cmF0aW9uICovDQo+PiArICAgIGQtPmFy
Y2guc3ZlX3ZsX2JpdHMgPSBkb21haW5jb25maWdfZGVjb2RlX3ZsKGNvbmZpZy0+YXJjaC5zdmVf
dmwpOw0KPiANCj4gQ29uc2lkZXJpbmcgdGhhdCB5b3Ugbm93ICJlbmNvZGUiIGFuZCAiZGVjb2Rl
IiB0aGUgdmFsdWUgd2hlbiBjb21pbmcgaW4gLw0KPiBnb2luZyBvdXQgZm9yIGEgaHlwZXJjYWxs
LCB3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRvIGFsc28gaGF2ZSBpbiBpbnRlcm5hbGx5DQo+IHN0
b3JlZCB2YWx1ZSBpbiB0aGUgc2FtZSBtb3JlIGNvbXBhY3QgZm9ybWF0Pw0KDQpBdCB0aGUgYmVn
aW5uaW5nIEkgdGhvdWdodCBpdCB3YXMgbW9yZSB1c2VmdWwgdGhlIHBsYWluIGZvcm1hdCwgYnV0
IHByb2JhYmx5DQpJdOKAmXMgYmV0dGVyIHRvIGtlZXAgdGhhdCBzdHJ1Y3R1cmUgc21hbGwuIEni
gJlsbCBjaGFuZ2UgaXQuDQoNCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
YXJtNjQvc3ZlLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9zdmUu
aA0KPj4gQEAgLTEzLDEwICsxMywyMyBAQA0KPj4gLyogVmVjdG9yIGxlbmd0aCBtdXN0IGJlIG11
bHRpcGxlIG9mIDEyOCAqLw0KPj4gI2RlZmluZSBTVkVfVkxfTVVMVElQTEVfVkFMICgxMjhVKQ0K
Pj4gDQo+PiArc3RhdGljIGlubGluZSBib29sIGlzX3ZsX3ZhbGlkKHVpbnQxNl90IHZsKQ0KPj4g
K3sNCj4+ICsgICAgLyogU1ZFIHZlY3RvciBsZW5ndGggaXMgbXVsdGlwbGUgb2YgMTI4IGFuZCBt
YXhpbXVtIDIwNDggKi8NCj4+ICsgICAgcmV0dXJuICgodmwgJSBTVkVfVkxfTVVMVElQTEVfVkFM
KSA9PSAwKSAmJiAodmwgPD0gU1ZFX1ZMX01BWF9CSVRTKTsNCj4+ICt9DQo+PiArDQo+PiArc3Rh
dGljIGlubGluZSB1aW50MTZfdCBkb21haW5jb25maWdfZGVjb2RlX3ZsKHVpbnQ4X3Qgc3ZlX3Zs
KQ0KPj4gK3sNCj4+ICsgICAgLyogU1ZFIHZlY3RvciBsZW5ndGggaXMgc3RvcmVkIGFzIFZMLzEy
OCBpbiB4ZW5fYXJjaF9kb21haW5jb25maWcgKi8NCj4+ICsgICAgcmV0dXJuIHN2ZV92bCAqIFNW
RV9WTF9NVUxUSVBMRV9WQUw7DQo+PiArfQ0KPj4gKw0KPj4gI2lmZGVmIENPTkZJR19BUk02NF9T
VkUNCj4+IA0KPj4gcmVnaXN0ZXJfdCBjb21wdXRlX21heF96Y3Iodm9pZCk7DQo+PiByZWdpc3Rl
cl90IHZsX3RvX3pjcih1aW50MTZfdCB2bCk7DQo+PiArdWludDE2X3QgZ2V0X3N5c192bF9sZW4o
dm9pZCk7DQo+PiANCj4+ICNlbHNlIC8qICFDT05GSUdfQVJNNjRfU1ZFICovDQo+PiANCj4+IEBA
IC0zMCw2ICs0MywxMSBAQCBzdGF0aWMgaW5saW5lIHJlZ2lzdGVyX3QgdmxfdG9femNyKHVpbnQx
Nl90IHZsKQ0KPj4gICAgIHJldHVybiAwOw0KPj4gfQ0KPj4gDQo+PiArc3RhdGljIGlubGluZSB1
aW50MTZfdCBnZXRfc3lzX3ZsX2xlbih2b2lkKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIDA7DQo+
PiArfQ0KPiANCj4gVGhyb3VnaG91dCBoZXJlOiBTdHlsZSAtIHBsZWFzZSBsaW1pdCB0aGUgdXNl
IG9mIGZpeGVkIHdpZHRoIHR5cGVzIHRvDQo+IGNhc2VzIHdoZXJlIHRoZXkncmUgYWN0dWFsbHkg
bmVjZXNzYXJ5IHRvIHVzZSB0byBhY2hpZXZlIGEgY2VydGFpbg0KPiBlZmZlY3QgKHNlZSAuL0NP
RElOR19TVFlMRSkuIE5vbmUgb2YgdGhlIGNhc2VzIGFib3ZlIGxvb2sgdG8gbWF0Y2ggdGhhdA0K
PiBjcml0ZXJpYSwgbWVyZWx5IC4uLg0KDQpPayBJ4oCZbGwgY2hhbmdlIHRoZW0NCg0KPiANCj4+
IEBAIC0xMTQsNiArMTE2LDkgQEAgc3RydWN0IGFyY2hfZG9tYWluDQo+PiAgICAgdm9pZCAqdGVl
Ow0KPj4gI2VuZGlmDQo+PiANCj4+ICsgICAgLyogbWF4IFNWRSB2ZWN0b3IgbGVuZ3RoIGluIGJp
dHMgKi8NCj4+ICsgICAgdWludDE2X3Qgc3ZlX3ZsX2JpdHM7DQo+IA0KPiAuLi4gdGhpcyBtYXkg
YmUganVzdGlmaWVkIChmb3Igc3BhY2UgZWZmaWNpZW5jeSksIHdoaWxlIC4uLg0KPiANCj4+ICsN
Cj4+IH0gIF9fY2FjaGVsaW5lX2FsaWduZWQ7DQo+IA0KPiAobml0OiBzdHJheSBpbnNlcnRpb24g
b2YgYSBibGFuayBsaW5lKQ0KDQpBY2sNCg0KPiANCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9hcmNoLWFybS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPj4g
QEAgLTMwMCw2ICszMDAsOCBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2Nv
bnRleHRfdCk7DQo+PiBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsNCj4+ICAgICAvKiBJ
Ti9PVVQgKi8NCj4+ICAgICB1aW50OF90IGdpY192ZXJzaW9uOw0KPj4gKyAgICAvKiBJTiAtIENv
bnRhaW5zIFNWRSB2ZWN0b3IgbGVuZ3RoIGRpdmlkZWQgYnkgMTI4ICovDQo+PiArICAgIHVpbnQ4
X3Qgc3ZlX3ZsOw0KPiANCj4gLi4uIGluIHRoZSBwdWJsaWMgaW50ZXJmYWNlIGl0J3Mgb2YgY291
cnNlIG1hbmRhdG9yeSB0byB1c2UuDQo+IA0KPiBKYW4NCg0K

