Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2EB577EB4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369439.600862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDN6i-0000Zw-HC; Mon, 18 Jul 2022 09:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369439.600862; Mon, 18 Jul 2022 09:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDN6i-0000V7-Df; Mon, 18 Jul 2022 09:32:04 +0000
Received: by outflank-mailman (input) for mailman id 369439;
 Mon, 18 Jul 2022 09:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDN6h-00005Q-76
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:32:03 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79a84bfc-067c-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 11:32:02 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 05:31:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5641.namprd03.prod.outlook.com (2603:10b6:806:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 09:31:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:31:45 +0000
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
X-Inumbo-ID: 79a84bfc-067c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658136722;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=g6TxDv8L6D3sVlzAgOLhq2K8/C0ssrD28Etz2HezzaM=;
  b=OnOzY0Br+cfCCS+xpBBcdWBgGzU8K1m4m6M+9u3fgTPmRNGK0gEzOHyA
   rC/TtRbpSLE1viG0YJk8w9LegtM1+xFBVeDPtNTrPlxCN+e+e6QEvN6zA
   JwHqn8Q3IUlLXXyDAO9kvYhuhu98p+TPCjDJi4A1BeAzeSHmtrK3EdQtT
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 76015450
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AnxA9F6veFMkVNnufsug0GxU+yufnOphVZtUHD?=
 =?us-ascii?q?cmfNp3fP3jJ3xfKXnsEbRFcyGXui9imYTMeS5SwoJmzjKRV9u3v4DYpZuM8h?=
 =?us-ascii?q?77rr09jo4IdxTGCvyVmeAIwTsNIyoBSI6Af0iPgdrLZQ2WD+PpWMVcanmDXh?=
 =?us-ascii?q?GfVcMvItJs5CcbsPrqLUGUPz53XtP5MjYBzlU91T8fRt5BGY92KCbBxkO8yN?=
 =?us-ascii?q?J+YjCDGHyhP9/75wbiV3MhypkGfBzBQMCGFwPPiF3yiCMBpSA8O8qH3zQ5Jo?=
 =?us-ascii?q?Kbk5IqSVu/5FmMhUDud10jCyyKPJ5SZCBV+UFqt301czi4e/jBHVxRn+WOgo?=
 =?us-ascii?q?4+MTDloAox57B5V/1N7+FlXgeR90QOITOAb4Wd04958z8Pg+o/F+TOOrI5Mp?=
 =?us-ascii?q?sLztEg9J/r6OeOrVVzTyiA0XYvJ+jPM8zf4wB7pVMb+kZomc2s1HX5lco/7P?=
 =?us-ascii?q?ZkgO00dOfSw5yaGCPfVKHu479qgt+iGjUWWdfhaWCZyiZExzdQCIdaNrEYoo?=
 =?us-ascii?q?D1kXUipgdZj/NWgAPWwvNEDmwX8qH+TSoYFu1QTwp6W6ZA4ZLsG8mwhWYOkT?=
 =?us-ascii?q?XAQ8egLtHpH22fF6CZCPT6mlg6lzMxCxiQpIM9YRFP9PPc1UloTX3ryZc/wb?=
 =?us-ascii?q?1cDY12p1ffkTPQ6lXewmAkRETPzTwuk2epTDnezphbsE/qY70Dcp58NHs+mI?=
 =?us-ascii?q?o4I0hYEqd58hHvyxbexZ/NhN5X1WgSM66nJ4UbeQnnSGOQeOO13rqeYJbEg3?=
 =?us-ascii?q?sDRV/mi4FrPug0PCXLC5HJNkdmZxWz2Fk/jz+SS+Sj3k3zOjCpQrjLpQ6/RJ?=
 =?us-ascii?q?lj89eO66eDeoTN2cR4GCD3RPjwrJZBgNDCsM2FT1a5UHJ5BR4CZtzFvGz6dq?=
 =?us-ascii?q?PAe2RX52iH/TltSWJnBOB1QYMgmRDJIHxXVR6SxVtvYaWAn2wn8KKi/aANIZ?=
 =?us-ascii?q?qGNUCDow0NGroswiu0XPOv77npS0OTuJt6dks4bLN0K1xeNc0XVIGvnFvUyF?=
 =?us-ascii?q?uTh3GCBfaOw0HdGScmsGZW1UNbdtMSlbJjaBmk7/3pDQloEgWBTX/K37SJhE?=
 =?us-ascii?q?6lxCBJrz3SQUlM9m1zFsRiplpNtCrDe6ibcykNjLGNW1y7XgNciFZD10OX8s?=
 =?us-ascii?q?BZ0QgBYEQ+jU4crwV6ToYq8r7RaCwvDDsP1RNaZgh6Uut8hZjGLpqaRGrBse?=
 =?us-ascii?q?59SxMUnLbcLX02b4y/KsdyS9SB6IIDCWUtHYNp+5b9Tt4sMLA3QQVcp8CaTD?=
 =?us-ascii?q?UOk1D7J8d8rGsr5i4YSVlR9L3w38sDJBanazJcvXPA6R6ew16ivVqlVPGdd0?=
 =?us-ascii?q?KEg+FdqzKgxTEmFmnSGOUQtJax7ySRLgiNVBxRgYJEBgSIotcR9huBymSiwe?=
 =?us-ascii?q?rkX/g3Sz7dWa2WvNeUe5axcXNQAch7KguD1DKNPo8G26/o3obGlKRvIN5lNV?=
 =?us-ascii?q?AXyiRD9MY3INXQAjAL72g1KbVYsPat5BA2ZRq22RX9QxEXZeoJU5TDzR/vb1?=
 =?us-ascii?q?zcf4I/F3a0oj61p8vjfyRNs72sxP/E1j07WayNxPy3db2LT+4/9MHRauEIgG?=
 =?us-ascii?q?0JtpRk5cAQwPgl7WzvabM+jKuUzYJEmiEZXppyRH1Wi7YMw2b1mcn3iexuAv?=
 =?us-ascii?q?MSzB6fwBxMUMYGDQL2iEUFPbRxCs8WzF5bzJakdi5mLPiv1yfnOYcdA4FmV5?=
 =?us-ascii?q?fuEEu3oHn0cwTdC326Gu/waQ0+KUDHng+iSxqKwWjXF+YegukXHu2PScNoas?=
 =?us-ascii?q?E0hWkyF004Ozwq7bKFeHoSDf9yrTY0jg1ITwELBQ4SK0njq7Bi2Y5aWYVf6Q?=
 =?us-ascii?q?EdNZ0oYWZcOJrkdoyeWCE0Hj7WmMhhExNM0aoxThDIxkNBLv+0NXYR9BTkYM?=
 =?us-ascii?q?v2INvnCHF0WTITePt2zp/H4OhLxazGLJTGnPxxqshAsaIKQydhIj6nG52z2k?=
 =?us-ascii?q?vnS4ZgvYpmbTNKgaSp7sX4AXjst247/IkDSxS82MX9pOISqxfsTlODrSnG1+?=
 =?us-ascii?q?EON7Oa7c/CJNI54ebnyOce2YJnPc1r11ba61ie2tTNSxL3h89ffLiQ/xfebV?=
 =?us-ascii?q?FLbXnqs1X6K2pRja32uxGzfuw2hN3rXx7d3aoxbbeJj4ZRzY4GmbpDl+zpbX?=
 =?us-ascii?q?Tl8Ugf0mpifRw3EtCDOzpyktwsOQ79imuPzqs8UoL5xxZMmfG/bnPXF0+0On?=
 =?us-ascii?q?Mh9gmA+wAdpc9juUyTTB0ZewrqSiTNMfk4xwa6DxDcJtbN0WpYAe18a2pzcT?=
 =?us-ascii?q?Ec9py1+HYlLEJ0twgRq2Co6ZESA2lTLXfvOZAoVFzLMOP6bcTBZ+hOzd8VSZ?=
 =?us-ascii?q?o/oldLasv91EZFn3p7vfMcu/J7/3KJ9neAHSd0dNS17uoCnBRrIoQbhcEmkp?=
 =?us-ascii?q?1Dih8F1FD9Dk8IxH09jXcxUmB4+WKJ2rNzHfvV6ORKmco+d7O3Qc490fFz48?=
 =?us-ascii?q?57VghLLrHGkvSsmb+rnSuyAytuHNtkAEN9faj1xWC+nR/2nFEunjrEYdwibl?=
 =?us-ascii?q?E0u2qti6byXp7nJjTQpevlc5dhJEv8v91Ivczw1Gn1CHBhO4VBM2MrGlDAQ3?=
 =?us-ascii?q?W0CBh6t+T1OZlRmO5Om4SOqI/nUWZ7xIA51E8NPXIJRrTVM3Xc/1gy+2PGxk?=
 =?us-ascii?q?GcEm+J3AFfLq1/ocXbCed9CtboZzOLr0iX8v4P8Yp80uqJDeY4iRATYkmue7?=
 =?us-ascii?q?pl4KV7WsUFODdS0eEPHHgXnIUch0BoMC9VhtAX+sg=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76015450"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HURXq/rgyC+PfMiyS4DNgbBm06CkQqbgXbRBGO0d0mCoPuP9Zr5s53ujajKQ/qJMo/6GRk0ijMsscqqHKyJggH8PTiCpHaXVf8lXqiJX4fq/jwbkel0aEbFcgIgonJImuWZHkTUaQSO3At7bsVWjL1w17twjwVuhFK4QR3yBdVR+ltdYq2CIGBlLxbjAhmCjQbNV0RpNtl9vcCNamzOb+dnFPTpfuKvvTXWSqZK3SdCP0otZQbuENiYmEPUiHdiFJOOzXG/kyMDM0P14nzJHaCFib9cHsYSn+jUaZwH+SwQfQ/542NquJNcYWFEjvSZ9LgxIxl9yxF7cRUqiDMKaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6TxDv8L6D3sVlzAgOLhq2K8/C0ssrD28Etz2HezzaM=;
 b=Jd9cqJhPCuTqvssTg28O64NIBocJuU4uwjSNvNp3UcmfKEzADiZ1uXnv06WITBxu14uxvid8iZXpXs7bezga7bI3a+VE0ymv7+aO2jN1nNzr/H9sp6bv9hA4dVEBUPRpfJtFtogy5NoF9zkhOUssjIVH9c+S8RCzc8Xf+4j58w7lrzPX6bUcJBpmKnVl85AwgoCKsc4C8cxYegAXJe/AXGF4Wnif2z+mwhEPiIO0byCSSGwbZSHNQZv4flAl4BKNY4KUdyV9krE05F+BXflcWnD9PpZWs18wDpHMe2UtJ6cS0TyCqH/XJFTiOgW23JBtsXKWFCDiiITb6jf+l+/Oiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6TxDv8L6D3sVlzAgOLhq2K8/C0ssrD28Etz2HezzaM=;
 b=qSlaMlfcbcYDQlOwK2uOHZWFnBWvWshX2gm6sYmOjGhZBmIz4g0w9K/n9drietX+XwyPZhQx/U9e1wEtO5xnb8fek/2eQdaNBVCxSKodaYTlXGVP+okEvLg4scgodVOiUQpxfqOQeee30723FEkEzPwqRbNxysny4E+b6J7aSbE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Thread-Topic: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Thread-Index: AQHYmE6f3nf19rITF02bMhbJMzY4w62D3CgAgAAFn4A=
Date: Mon, 18 Jul 2022 09:31:45 +0000
Message-ID: <aa786e6a-7db5-f719-c8d4-26adba96475a@citrix.com>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
 <20220715132651.1093-3-andrew.cooper3@citrix.com>
 <dc25adc2-7e99-0394-a446-56a1e5e804e4@suse.com>
In-Reply-To: <dc25adc2-7e99-0394-a446-56a1e5e804e4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 463d4781-7f3d-46d5-9c8c-08da68a05504
x-ms-traffictypediagnostic: SA0PR03MB5641:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TlEeayr9QiySN3sBDkmpMynGX7L0yfgT9eGCxhI9yBb0wdeDhYl0oJH2DTMivNCYH8ZjnhUAehgk5vnvCiyFru8fQPX9CUZVzapebKKl8ESjzNKHeRGwa0ToCz4XPv5Zae7y6PigNvF8EI+UPjEUuGioj0dBky6A1FYrcXvMzmQquthU25EnXX0dENl775CZuFZu/msNdXo706FyxPK//o9xGAJHSq1JxsJ68EC8gmvAPKL3He05/DRIGPxxW7e7yH6cjzRfWg0f/W4MtBEb8DdecfLLW/oCGXXW1MYaBOWD6e8mCAlHs1fDY8eX96vL1SnuZ3bY5IG4HlMIX02RLMYT8SEumUfua+0wpGbaQxw5LRyHWO5gM/MAAabzpbrRQERAigepVo2VdkbcTHE0sqxP7x3vFhnoZGa0eNa+eWDuqNS0rMOneCAW2Xoq+4raPJg7LH/Ein34x2ihiiERiCSX8F5252DZTa9YHzHun0uqX5CPSKaSpmUvUh83qfQOGzPk2BCpi0yvxqbdT/tLAkIb/M/cbJ9yqERmLkrUNryX3874Nt0ONgF7qdS919Q4B1lPMDgQIyBz/Zrp7qIbU1ck6m5meGTPslBKKTZ3ckKrLzs/FbFrGCbTVAu7W5aCkvUoRp+r2hpR+9utd3+OlXiRb79v8DzSwqGYAYcA4SiPUTSLuo04bU3i+eJVMfNbt/MhMtM4Kj4nkq6eRvSS4/Q6TsfeZJcqxzqXrcT6h27g4Ww9C1WwTjh6+hc/DLRkMvC0oxjew0z9mjt+LrGZaaf0llEycjd6shUZNC5r1L3ZdfRe4m9YE/9Oed45Ux/30pRWETNuAuQDkcPdvyN++BgsF1R0jvgz/UyQGSA2Y1X6Gld+iTjoE49k0Dq+zIdo2Qlce7nJpcB3hEUWd9Fwhizklls0tVoer0iAZ5PvIP8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(31686004)(316002)(38070700005)(82960400001)(122000001)(54906003)(6916009)(36756003)(83380400001)(38100700002)(91956017)(41300700001)(186003)(76116006)(8676002)(66476007)(66556008)(4326008)(64756008)(2906002)(71200400001)(66946007)(66446008)(5660300002)(2616005)(31696002)(6506007)(53546011)(26005)(86362001)(8936002)(6512007)(478600001)(6486002)(4290200001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEFQb1FWNEIydnFBYXZVdXQvT0JEK2lVSC81cGF0a1c3M3NZVlZmVjJxcklk?=
 =?utf-8?B?RFJzZVpwNWF1UjJqN3NuWnM2OGpOS0F5K2x0RzR1cnNYVXhxbHdmOG5zMExO?=
 =?utf-8?B?U1VCRHZSVTZCbXp0TVJKSXQ5Vk1TbnYvL2VKWmtyVEQzbVlEcVN5SEVNd0s5?=
 =?utf-8?B?dGppVGY4MHRmWlNoMmM0aHJQVitFY255TUVVQVJLSmw5NUNPUFh0ZkhKMEUy?=
 =?utf-8?B?WWV4UjBWTXpvZTFwSng3WVMrOUlxOFl4dGFHSXFvdi9FdHozclZFVDhDdnp0?=
 =?utf-8?B?UlZIRUxmQWRFdHhYNUg4R0Fxb0NhRUpoWll3OWNTOHh6b3NrSUZxdGhOdWpq?=
 =?utf-8?B?b3dRc2JwUlppd2FsVmdUR2JBV1I2N05RekQxOHNtVy9XUGpyQTUwa1d3WmRa?=
 =?utf-8?B?NGpyOU4xVGJKVTYzY1lRb1BUbnVIQU1tMEpkNDI4NnAwNlZ3amNXVXd4bDho?=
 =?utf-8?B?UmpQc1lBZDNwVGxIQ2ZhaWFzeTBKSXVpK2lkNHFpOHZzaXc5VGRNS3lHOHBS?=
 =?utf-8?B?VnBEc05kUURUY1dqV1pTeldGWGg2UHdUNU1OeHlDL2Z5WkY1LzhQU0oyQ3FN?=
 =?utf-8?B?cjVvTk9qTnlNRkRNNVVpQWZENk9yemhzRTJEUHVqcCtqMTNIQ1dqRVZFVzdT?=
 =?utf-8?B?eWxHL04wUmNXU2hHc1pxRGlYTmJ5RnIxdUV2TkxNNngxS0FHOHRmeFV0VkMr?=
 =?utf-8?B?UmRFcVREQUs0dlFteFJ1Qk1udThPZitCbkxuU09WWTM0Q0JFR1FxTENLR2tO?=
 =?utf-8?B?MHdML29BVE9WdlVGZG9uTTFEbHJwTVNoc3RBdFcxRkVPMUNXQnVlTlh5OG15?=
 =?utf-8?B?QStQMkhjTW14dC9MZFdQMEJyTjBxV1ZBTzBCQ1krangrNmI5bXR4ZjNPbXlE?=
 =?utf-8?B?ZDQ4OVBLRU5TclJUa0xhYUFNdkg4aEZsWW9PTklBTW9nVXhMQkVmcEx6VXAx?=
 =?utf-8?B?Nm1kdWZNbmlKYjduSlptUXlMeVpBdUJUbTZLZ3FnK25XRmdmbkMrb2VocTdD?=
 =?utf-8?B?ajFwZSt3ODB1NnV4ekVjVXNhR2hROTQ4dWVEd2xoUUNPUFpEN1YrelFGdDVB?=
 =?utf-8?B?QlNCOVhRd3FZVWdhUWNXLzM5OGFMdnFON3lGWnNUb2psdzJ2dTVVRnJDL0Vz?=
 =?utf-8?B?MmM5VWM5YzVTNXdLejdiMlFWUStwcnRhMEZlbExrV3lHV0c3a0cveGRVNnJq?=
 =?utf-8?B?aVNiQlBYZldqZTV6cENUR01Ga1BmNzg3M0JVMVkzbVVYRzhNNmxKYXN2MDI1?=
 =?utf-8?B?S21YcnBVWXIxbUs3UUZBMDNwWG90L0ZWUU9SUkxsVmVvaXdUbWF2U0djL0JO?=
 =?utf-8?B?c0VNejZUcEVCdDU0MzJCeUZPQzVSMXlNbHFwa0ltYTRhc1R1WEROR2lrck84?=
 =?utf-8?B?YWtvVUE2M2w3RWkxb2IzVTNDK0Y1aDdlYmJ1U1BmVGFPb05HNGRKZ09Nbk8z?=
 =?utf-8?B?RDBiQzNQMTN1Tks0OGdIcUZvaHJiZXd2ZlJrSkdwZitTRVEzN2hrTHcvdCti?=
 =?utf-8?B?NWI5YVJzbFk1YzZjbEJVU3NnWEdzak1pWE9PV2svWlFJTnV1ajVrNnpod3lF?=
 =?utf-8?B?UEY3ZUJWeWZxbEhPQ2xNRnc2Mk4yT2w5ODBTOE5QNlh2QUhPY3RxTnFWY0tN?=
 =?utf-8?B?ckZWYTlnQlluNFJRTWtVSGN2R2liRXpIWHJoODErSzFhSlQxSDRhSE1uTnBS?=
 =?utf-8?B?WmY5RlVncEhyYXoyQTRvQldsL00xYVRVbFdxODVXSS9oNnB5SmM1K2Fxckpx?=
 =?utf-8?B?Tnlvb05xcmVibyt4R2JyNnFJV0RoM01Xb1pibW92VGFIMk1iNjZhTHRVdFdZ?=
 =?utf-8?B?K0YwL2dVaDRLY1NiQmlteFdBaisvek5XNnRROXp5K1I0cmdBRHV6aDZmQkVE?=
 =?utf-8?B?SVloNWdyUXc1VHVXT3g1OTh2QTY3eUQvTmM2YUY4enU4MHdYZVF0bmNXZFlm?=
 =?utf-8?B?RGpGQ0lYbUt6VTNoTDlzQU4zRmlmbk5xSVpWUngwSTBDckpYb1pHS2E0SVFZ?=
 =?utf-8?B?UkNza1F6a1E0dWVoZndqaDVQTnhQajA4TVZ3Tzd2K3p2clFFeUdueHI5bUF6?=
 =?utf-8?B?am9NSi9KRHNLRk1zQ29VNk94Q1BRUjNoeUdOMytYeStwLzduQjg4aldIcVAw?=
 =?utf-8?Q?Jhtp/q8KVwyFUaLpDpp2gLF9E?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3B987169AE45B4396B2BFBE15B64D2B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463d4781-7f3d-46d5-9c8c-08da68a05504
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 09:31:45.6455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kRCSnnhWki1hhCwve1tC32+qBGtbXssiDa6sJwbr62e8mh2Ior0XOlC7SLNysAwgOSUGJKp669RSpY5JK7UGzfIK12VShhDeAB6DR4kaayo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5641

T24gMTgvMDcvMjAyMiAxMDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjA3LjIwMjIg
MTU6MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBXaGlsZSBYZW4ncyBjdXJyZW50IFZNQSBt
ZWFucyBpdCB3b3JrcywgdGhlIG1hd2sgZml4IChpLmUuIHVzaW5nICQoKDB4TikpIGluDQo+PiB0
aGUgc2hlbGwpIGlzbid0IHBvcnRhYmxlIGluIDMyYml0IHNoZWxscy4gIFNlZSB0aGUgY29kZSBj
b21tZW50IGZvciB0aGUgZml4Lg0KPj4NCj4+IFRoZSBmaXggZm91bmQgYSBzZWNvbmQgbGF0ZW50
IGJ1Zy4gIFJlY29tYmluaW5nICR2bWFfaGkvbG8gc2hvdWxkIGhhdmUgdXNlZA0KPj4gcHJpbnRm
ICIlcyUwOHgiIGFuZCBvbmx5IHdvcmtlZCBwcmV2aW91c2x5IGJlY2F1c2UgJHZtYV9sbyBoYWQg
Yml0cyBzZXQgaW4NCj4+IGl0J3MgdG9wIG5pYmJsZS4gIENvbWJpbmluZyB3aXRoIHRoZSBtYWlu
IGZpeCwgJTA4eCBiZWNvbWVzICUwN3guDQo+Pg0KPj4gRml4ZXM6ICRYWFggcGF0Y2ggMQ0KPj4g
UmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcywgYnV0Li4u
DQoNCj4gd2l0aCwgSSBndWVzcywgLi4uDQo+DQo+PiAtLS0gYS94ZW4vdG9vbHMvY2hlY2stZW5k
YnIuc2gNCj4+ICsrKyBiL3hlbi90b29scy9jaGVjay1lbmRici5zaA0KPj4gQEAgLTYxLDE5ICs2
MSwzNiBAQCAke09CSkRVTVB9IC1qIC50ZXh0ICQxIC1kIC13IHwgZ3JlcCAnCWVuZGJyNjQgKiQn
IHwgY3V0IC1mIDEgLWQgJzonID4gJFZBTElEICYNCj4+ICAjICAgIHRoZSBsb3dlciBiaXRzLCBy
b3VuZGluZyBpbnRlZ2VycyB0byB0aGUgbmVhcmVzdCA0ay4NCj4+ICAjDQo+PiAgIyAgICBJbnN0
ZWFkLCB1c2UgdGhlIGZhY3QgdGhhdCBYZW4ncyAudGV4dCBpcyB3aXRoaW4gYSAxRyBhbGlnbmVk
IHJlZ2lvbiwgYW5kDQo+PiAtIyAgICBzcGxpdCB0aGUgVk1BIGluIGhhbGYgc28gQVdLJ3MgbnVt
ZXJpYyBhZGRpdGlvbiBpcyBvbmx5IHdvcmtpbmcgb24gMzIgYml0DQo+PiAtIyAgICBudW1iZXJz
LCB3aGljaCBkb24ndCBsb3NlIHByZWNpc2lvbi4NCj4+ICsjICAgIHNwbGl0IHRoZSBWTUEgc28g
QVdLJ3MgbnVtZXJpYyBhZGRpdGlvbiBpcyBvbmx5IHdvcmtpbmcgb24gPDMyIGJpdA0KPj4gKyMg
ICAgbnVtYmVycywgd2hpY2ggZG9uJ3QgbG9zZSBwcmVjaXNpb24uICAoU2VlIHBvaW50IDUpDQo+
PiAgIw0KPj4gICMgNCkgTUFXSyBkb2Vzbid0IHN1cHBvcnQgcGxhaW4gaGV4IGNvbnN0YW50cyAo
YW4gb3B0aW9uYWwgcGFydCBvZiB0aGUgUE9TSVgNCj4+ICAjICAgIHNwZWMpLCBhbmQgR0FXSyBh
bmQgTUFXSyBjYW4ndCBhZ3JlZSBvbiBob3cgdG8gd29yayB3aXRoIGhleCBjb25zdGFudHMgaW4N
Cj4+ICAjICAgIGEgc3RyaW5nLiAgVXNlIHRoZSBzaGVsbCB0byBjb252ZXJ0ICR2bWFfbG8gdG8g
ZGVjaW1hbCBiZWZvcmUgcGFzc2luZyB0bw0KPj4gICMgICAgQVdLLg0KPj4gICMNCj4+ICsjIDUp
IFBvaW50IDQgaXNuJ3QgZnVsbHkgcG9ydGFibGUuICBQT1NJWCBvbmx5IHJlcXVpcmVzIHRoYXQg
JCgoMHhOKSkgYmUNCj4+ICsjICAgIGV2YWx1YXRlZCBhcyBsb25nLCB3aGljaCBpbiAzMmJpdCBz
aGVsbHMgdHVybnMgbmVnYXRpdmUgaWYgYml0IDMxIG9mIHRoZQ0KPj4gKyMgICAgVk1BIGlzIHNl
dC4gIEFXSyB0aGVuIGludGVycHJldHMgdGhpcyBuZWdhdGl2ZSBudW1iZXIgYXMgYSBkb3VibGUg
YmVmb3JlDQo+PiArIyAgICBhZGRpbmcgdGhlIG9mZnNldHMgZnJvbSB0aGUgYmluYXJ5IGdyZXAu
DQo+PiArIw0KPj4gKyMgICAgSW5zdGVhZCBvZiBkb2luZyBhbiA4Lzggc3BsaXQgd2l0aCB2bWFf
aGkvbG8sIGRvIGEgOS83IHNwbGl0Lg0KPj4gKyMNCj4+ICsjICAgIFRoZSBjb25zZXF1ZW5jZSBv
ZiB0aGlzIGlzIHRoYXQgZm9yIGFsbCBvZmZzZXRzLCAkdm1hX2xvICsgb2Zmc2V0IG5lZWRzDQo+
PiArIyAgICB0byBiZSBsZXNzIHRoYXQgMjU2TSAoaS5lLiA3IG5pYmJsZXMpIHNvIGFzIHRvIGJl
IHN1Y2Nlc3NmdWxseSByZWNvbWJpbmVkDQo+PiArIyAgICB3aXRoIHRoZSA5IG5pYmJsZXMgb2Yg
JHZtYV9oaS4gIFRoaXMgaXMgZmluZTsgLnRleHQgaXMgYXQgdGhlIHN0YXJ0IG9mIGENCj4+ICsj
ICAgIDFHIGFsaWduZWQgcmVnaW9uLCBhbmQgWGVuIGlzIGZhciBmYXIgc21hbGxlciB0aGFuIDI1
Nk0sIGJ1dCBsZWF2ZSBzYWZldHkNCj4+ICsjICAgIGNoZWNrIG5ldmVydGhlbGVzcy4NCj4+ICsj
DQo+PiAgZXZhbCAkKCR7T0JKRFVNUH0gLWogLnRleHQgJDEgLWggfA0KPj4gLSAgICAkQVdLICck
MiA9PSAiLnRleHQiIHtwcmludGYgInZtYV9oaT0lc1xudm1hX2xvPSVzXG4iLCBzdWJzdHIoJDQs
IDEsIDgpLCBzdWJzdHIoJDQsIDksIDE2KX0nKQ0KPj4gKyAgICAkQVdLICckMiA9PSAiLnRleHQi
IHtwcmludGYgInZtYV9oaT0lc1xudm1hX2xvPSVzXG4iLCBzdWJzdHIoJDQsIDEsIDkpLCBzdWJz
dHIoJDQsIDEwLCAxNil9JykNCj4+ICANCj4+ICAke09CSkNPUFl9IC1qIC50ZXh0ICQxIC1PIGJp
bmFyeSAkVEVYVF9CSU4NCj4+ICANCj4+ICtiaW5fc3o9JChzdGF0IC1jICclcycgJFRFWFRfQklO
KQ0KPj4gK1sgIiRiaW5fc3oiIC1nZSAkKCgoMSA8PCAyOCkgLSAkdm1hX2xvKSkgXSAmJg0KPj4g
KyAgICB7IGVjaG8gIiRNU0dfUEZYIEVycm9yOiAudGV4dCBvZmZzZXRzIGNhbiBleGNlZWQgMjU2
TSIgPiYyOyBleGl0IDE7IH0NCj4gLi4uIHMvY2FuL2Nhbm5vdC8gPw0KDQpXaHk/wqAgIkNhbiIg
aXMgY29ycmVjdCBoZXJlLsKgIElmIHRoZSBvZmZzZXRzIGNhbid0IGV4Y2VlZCAyNTZNLCB0aGVu
DQpldmVyeXRoaW5nIGlzIGdvb2QuDQoNCn5BbmRyZXcNCg==

