Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25C7A9396
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 12:35:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606277.944070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjH1g-0006fL-MC; Thu, 21 Sep 2023 10:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606277.944070; Thu, 21 Sep 2023 10:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjH1g-0006cq-IH; Thu, 21 Sep 2023 10:35:16 +0000
Received: by outflank-mailman (input) for mailman id 606277;
 Thu, 21 Sep 2023 10:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wI4U=FF=citrix.com=prvs=62171ef32=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjH1e-0006ck-Ao
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 10:35:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a18ef48-586a-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 12:35:11 +0200 (CEST)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Sep 2023 06:35:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6912.namprd03.prod.outlook.com (2603:10b6:8:47::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.23; Thu, 21 Sep 2023 10:35:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 10:35:00 +0000
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
X-Inumbo-ID: 8a18ef48-586a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695292511;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mlx3sDKPjB5Rgz++19lHJxuBR/bD/5PA9MMcTp5j1Yo=;
  b=Qo9Hj4ma6q92faaaBUNgySn+uDDNkGCwxNMCxdM7LzmUJA+9YUfzRonw
   b4jUCgt/6EBOMOstJ+lg0/qUghUJfM08MkLKlzyF/YydqMMME+6kBamXN
   Aj8dEyPZGTcYFMjFhglnVTlRoP/rxwHH3c3jj2jUTuBt2VgEx724MTjZs
   E=;
X-CSE-ConnectionGUID: MiGCPN5aSPqJMQ5KrlZ+0Q==
X-CSE-MsgGUID: LyyoJ6tEQsq9G2dL53cGIg==
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 123781050
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IfDzoqLEbgO48k4IFE+RCpQlxSXFcZb7ZxGr2PjKsXjdYENS1zUGz
 zAXDz3SOqqDZWX8edogbo2190lQvZ/dzoJgHQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhA7wZnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5SAE5lz
 dpFIQs1dzKmvr+V2raJCbFV05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv23bCfxHumAOr+EpWc5+9togOP61UIEUw5D1ef/KKypW+xDoc3x
 0s8v3BGQbIJ3HKsSt7xThipukmutxQXW8dTO+Ai4QTLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qyIoCy7IzRTLW4GaSIOVwID7/HqpY11hRXKJv5EFKO2ldTzFSvH6
 jaGtjUlh74TgMgI0I225VnCxTmro/D0ohUd4wzWWiep611/bYv8PYiwswGEtLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4ulmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:+CsDEqF/1GUxTlfnpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:mUEPDGOaFmXWJO5DfShI33YyR8keSmT/6U6NAFW8OyUxcejA
X-Talos-MUID: 9a23:rjwMCASt6rBaKMk1RXTIlSBlFpl0zp21EREiy5ki5pKPGg1/bmI=
X-IronPort-AV: E=Sophos;i="6.03,165,1694750400"; 
   d="scan'208";a="123781050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyW6Hw7YqxsQJoddVNBaEQDrBXXyElK8BbiEdR1yNDMPDzX0IKX2oDDAQzxMrFFX006Nv3C4VCHdFOoBvbEsIRd/EnEqOrpNWtcL00ApTrnp5AtWKpDfkySKDGosZRif8y1uxv+4mvCQDVnmavnjIjYCFZ5NAyutFgfSU6kbKm7OaNEHwGvOdIXXJVAt/EJBh8JYWnWFg3gc6Hxun2Hhgd7zcXVIOoKK7ZGlweoLtHe1V4dEnB9SVmtfbEv4C/NgZTxevNc1RVHW+SGuZ7gtvUciZif4K3e7IHTdFZJYO6k/SijiOgYBS8guQVzuE/CLzMyI9EXAvji3gRtA2Nh0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UN/7qGC5S1MpI+QDA5ODcJ6g1SSckQpPQYBpfiLkuaE=;
 b=WsOXmHmQe7HqkHKHFoqipY+SeOjW26aMpCiaMwOMlEr63IfC1raCd0X4oSrmMWRhPs7OMtE0Uuuherse+YlYbwykqj4tehccemYam4H8bY8Grcnk6y5CGZ8seIv/UMxUuxldPf+qMS32plo78GPMhYE7LQk5RpKn6oPtsjPttTFGJ7Oa4XSPGEh0z7BMOLVSs2i4fSXQsO235ffgH+t1i1vw5L4tFdzROyKTizimHOevKRZXTFpvn5gFdHGWiJXLisrrEPAa3DL0lnTXKG0VZBpka5GRJoyHKAtWzEJ/J+xdKgewFg04RITIMxb6VwqomNcalsid+1Js7u7KU3HNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN/7qGC5S1MpI+QDA5ODcJ6g1SSckQpPQYBpfiLkuaE=;
 b=Bmes0atJ2U6fmz3D3xABR75lEi8oyyPZ4i7dt8JPWBGWvm+73NLd3ZmMIFDdMEKiowCvvi/ZmAdY+iiM4R94gKoD9Y5qOO3djZZli1WTsobgEREyVPNeURCDtj6KHpPw7BaEQLGIqVLv9OSQJl1WcDyHNNmasfeH0ZA/+VbGaj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Sep 2023 12:34:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v9 09/16] vpci/header: program p2m with guest BAR view
Message-ID: <ZQwcTlV4_cBLH0-K@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-10-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-10-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9100d4-ccd0-489c-90f5-08dbba8e680e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3OzBVFdrtneeF3Ur5EnygOlveNBC9wq1vlvewS/levsEh53NxnnQUjTBFQxcN153L2/L4Y1Dh86p0Huo9O+/W3f4+sfegkXt43zU1Itl9B1W+17dxtMmGWY7XJ0np7csV/838c0e2bvHQvzB41BlydkglpGubulGagEtQzjuxfE6Zyiz1eraQ5TghZXob+pkL0BagCdRNCvinDNe4F8uD2xtqQCgGFwgRkI4HquJ2PqrxS3KSLAC6DGHVaIphNCYAUKyr0lQ3HZbqnoMNb813oVg/eCB/aBYzrKyqiuueAKQui3sDHyINyFHfCa2RaMV+Zw7Kn/xO9c0OsooL3HeaJ8p1xqIRidE/w7yGxxVaZos6Iy8YMQjaSz/Z2YXpb+2pMLQ/u5YPZHYqI2UdmB06zvGLshznGXXJVrAK/R2pyvRTxNtJtqVIlNviGWn0aJYvEA3fSdmd98JGijUnRR5nivvsoCMEtvFtlH9pwN1TckxlMbhPk6WTXS+gDHdE7hCls+w/d8vQIJFSaVrHDW4NGpskLFjAtsMIc/RQAJDSZ49Wu3ALlkHB5FgoF/gwElv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199024)(1800799009)(186009)(6506007)(6486002)(6666004)(9686003)(85182001)(5660300002)(38100700002)(86362001)(2906002)(8936002)(41300700001)(316002)(83380400001)(508600001)(6512007)(82960400001)(8676002)(4326008)(6916009)(66476007)(33716001)(54906003)(26005)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1Z5dm9wOEdOR1hibGVnNjBBWW9ENlBUU0JqVWJ6RWJENHE0d3BzMjEvU2Vo?=
 =?utf-8?B?MTRuek8wZDZYWGdiMXRIcTJUcC9tZnZpZTdhUVpOT2VGdXFKUjBlbFRxamcz?=
 =?utf-8?B?eUs3VTFTZ2UxVWlWSndybStWeGYzMEFYVDhUR2V2ZlhxeTNTaHltSjgrQmVY?=
 =?utf-8?B?NUs2TjNUNnFoQnJWajRTR1B4MzBERytJUW02V3lDTUxyQzlDcmJnc0o1MVg5?=
 =?utf-8?B?Sld4a0tYMWw3c1N4WWlUVXhyWHptT1hEVkFlenpCa1AzQXc1SjFXOXYxSjRt?=
 =?utf-8?B?NjkyTVFhUmk1Y2YxZEJuazFTUHdoWU1jNitXdVlYTWt1NThyODdNQUF0bitZ?=
 =?utf-8?B?K2lsNS9NNDVsTUVOWm1HbG1xL2lHWWU4VmlWS2ttbWpVdkJhSGk5Z1FiRndV?=
 =?utf-8?B?WDlLYzdvMVdEcHJ0SlA5cWNIU1R1citoTlViMEphRzlUNHFLMGRoRWFtUzdS?=
 =?utf-8?B?S29jcSs4RWp3aUtWWFovVWszVWpkS2p6YTVkUFYrYWRmWjBJUjFCMUxFVHI0?=
 =?utf-8?B?MUUrdFYyVjk1TVJFM3Y1VXpGQ3llZjNOMWlIZ1VReitPRGlrRzlvbXJkVzV2?=
 =?utf-8?B?VFU0Q2IrbWRkUm56ZndCSmNxSGRIZmFRckNmK1hUTFJMaHdIb1MvUVVrMnU4?=
 =?utf-8?B?VFB0S1JIOEFSR2VOa3lPRTR0K2VwV2RVcllONjMzejNDSUFjckVpRVVFL2Nw?=
 =?utf-8?B?d2l0WW05c1Q4U0JCNnpFeFNhSDlNZUFHcTFZRVQ2UC9yTTNDUDlrL1E0Q2p2?=
 =?utf-8?B?ZUJZMlV1cmhuK1F5K0RvYlVpWXRsRjMzZVFjOWZvekJVMVVBaExMcXZNV0Fy?=
 =?utf-8?B?amdSN0dyMW9QL2pyYlRsTlJvdHd3OU56NG9ON0s2QUNyeHE5UVNLT3pWandP?=
 =?utf-8?B?RDBWNGkwalBxem9XVCtDZXdxZ0hYR25kSFNrRG1PODdvZmpXU1NUcUYxQnVr?=
 =?utf-8?B?d096YVNwaXUvWnVtZEFqcUVqUGdaMXIrbW5jdysxTkM3MEdQeWVtMVdmUVZN?=
 =?utf-8?B?b2x1Q3dYVzg5T2pQVUJRRUlYR3Bnd1RVLzBRUC8wbnd5Njd2MnppeGRoSkJi?=
 =?utf-8?B?Rzl0YU1nb1BLN1RaaHVUWFI0N2h6ZlVRNnR1N3grM0x0WWpoWEpWSDJ2SHpJ?=
 =?utf-8?B?ditObDB4NGxyaVZicStjVE9kNkYwb3V5TFRvbmRsaXN0citQZVVIdE5zd0ls?=
 =?utf-8?B?a1paVmhmb1NpOCtBQmlWKzhONkRFR0xTTnBSWXZqelNsUFVHbEt6Nmx1N0g1?=
 =?utf-8?B?WGcreUVDT2NmU0hWSXdpWDl6MUZyc0RMS2Vza25WRUFsYWU0WHhQTmFuK3FL?=
 =?utf-8?B?cEhSbkFIT0ZvYVZqMysxYnd1eW9rVGRVSzJvZ0d6S3gyek9tc3N6R1Jpby9P?=
 =?utf-8?B?OGJLUDBUdVorOEpxeU41SllkMUZ2UWVxNlNUZ0ZRZDBFbGdtT044WUF2TjY5?=
 =?utf-8?B?d0hWMXRDVmRkbjRlU29vMDd0bGxudzBSSU5TL1pmN2JIZ1FLRURwYXFUMW9W?=
 =?utf-8?B?NTd4OTVOZ01WWE1CZHFVemgza0tPQUtqQ3V2WGo3aEExMVBUdDFHb2tML3FM?=
 =?utf-8?B?ci9nY3lYNG1NN2VHR25iR3VRN3E4UHk5R0x4T1k2N2h5MXVwMTBKL3FWeDNN?=
 =?utf-8?B?aEtPTVhXdDBCd3BiYXA0c29qc3lGUWtpUUR6M3JKRVA2N0ZGeGdsVjdwRk1a?=
 =?utf-8?B?dHFISElvZ3ZGTlljOUF4VnBwbkFrQUNSRFFjOTJueTBWaGxOOGZNRS9lcHhy?=
 =?utf-8?B?eGVBMFVXZmNRMWMxMFgwR1hLdTZYeXVCSWw2eXEvNCtsQkEyY3dHdUM5dEI1?=
 =?utf-8?B?VTAxOUFEdUxETHFCMGVjQi9UNnBXK0VwZFlpNWlxTnE0ZlBtdHJuWURsbWpB?=
 =?utf-8?B?cUh4akZKQ1NHNVJsajE1N0NzdThiTHM2cGtmTW9IZmJXKzBoMy9KZmVIbzFC?=
 =?utf-8?B?bEN1N1pwZlhkajFwRGFDUkV5KzJkNnBWQnZmdC82TGpnY2VuckNnTmFvNXh4?=
 =?utf-8?B?NE4xQVZsdjVSV1pXMUdJazlESFFSRWo2c3hOZS9rS2tJQzVuZS83MjBRY2g4?=
 =?utf-8?B?VlBmaXAvMndqQkdtRnpDN1htTk9vNXcxR245cGJlZnBmWFgwQWpZWjRrQ0pl?=
 =?utf-8?B?SFNsbEcwSkJGTE4zMHhlbmJtNlRFL21rN29DTklTTEZSNDVZcEFndGlibEZj?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	77HXB7scJ6qKltvhNERwTAXEab8gQCwdVuuxbQ6+zISkDlVS/lN3aNDSDOxUDEQJ2NxEZh9TaTT+Q9NBJJCILMTQFu0Qure+OHdIl/eTWb1HZ9OeHuzmjZ0Im3YWTXIRt4XlRFjm5glQjeb6Rt9jgYvcP+rHXF+JwpVd9vkbpwWXlSMOOLN0gUyIwGZ4+dmsj/PgdGGTJ+IPDcDOeQSdRKTbfSzPBp8p6x+eE85xxVE2whFsbFD7aJXD282e4aXuzhX44yvBIsgunuBU141RqJ8tMiUPdgKHX4WTYESLqk1p0gS41Aev/9wspypAmCaG8h+xk2exQRWHTsEmKK19/2vRAlSxKBQEmf9uljJKShk51Lp9jnaHOr8SXPZNVUA24Ps+CP87KYF0RlgcJUBwMjt7LnBF4hMTKofyif2UPbk/YKxV82AvEurRv0nmPeVLoe3lNnrU26bZQm4uYSNYZj97ItIU+BP99S40R6vdcuAxJ5E24YRtgKWcPrEayiUYQJfVkX6vBmG4cCEjtxBhA9GeTNB6FWXm8b2tZAZ8A3gzqg2L88+Zsc9hLgHJVu7TIaZ6TyEz1G97Ee/+VPPwssxFL9Y9SfKy6sa3rKP1pHrN1yXEa6LQSMStHoUfukSVA6iH+jRh2+oxuRQWSx3av228xg1jdBN/6Fu0GUirAcQDofvyQnZvn7187RFpdNvUIVkZEw2i2iaetssmcQI9fFFiK0MUpRqyNrtE2egCqkgoWAw4HMzR4RgiaBYVYvzt2OF02ZzuHsLPDkVae34uIVMCE4ezlcRvp34dLdYQcl51HlM7du9+A9KSEpgp2ffpBrDWx3UeVWA6Rp88irk8RA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9100d4-ccd0-489c-90f5-08dbba8e680e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 10:35:00.0143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oRVwfLw29RsIWQDJu+r+So5A/SQTtMPVIaaZsJNP6N8smFwIzZZRJBqHYxgu1/o3uiL0JjsiVRZ+EI0rgfi7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6912

On Tue, Aug 29, 2023 at 11:19:44PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Take into account guest's BAR view and program its p2m accordingly:
> gfn is guest's view of the BAR and mfn is the physical BAR value.
> This way hardware domain sees physical BAR values and guest sees
> emulated ones.
> 
> Hardware domain continues getting the BARs identity mapped, while for
> domUs the BARs are mapped at the requested guest address without
> modifying the BAR address in the device PCI config space.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> Since v9:
> - Extended the commit message
> - Use bar->guest_addr in modify_bars
> - Extended printk error message in map_range
> - Moved map_data initialization so .bar can be initialized during declaration
> Since v5:
> - remove debug print in map_range callback
> - remove "identity" from the debug print
> Since v4:
> - moved start_{gfn|mfn} calculation into map_range
> - pass vpci_bar in the map_data instead of start_{gfn|mfn}
> - s/guest_addr/guest_reg
> Since v3:
> - updated comment (Roger)
> - removed gfn_add(map->start_gfn, rc); which is wrong
> - use v->domain instead of v->vpci.pdev->domain
> - removed odd e.g. in comment
> - s/d%d/%pd in altered code
> - use gdprintk for map/unmap logs
> Since v2:
> - improve readability for data.start_gfn and restructure ?: construct
> Since v1:
>  - s/MSI/MSI-X in comments
> ---
>  xen/drivers/vpci/header.c | 52 ++++++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 3cc6a96849..1e82217200 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -33,6 +33,7 @@
>  
>  struct map_data {
>      struct domain *d;
> +    const struct vpci_bar *bar;
>      bool map;
>  };
>  
> @@ -44,6 +45,12 @@ static int cf_check map_range(
>  
>      for ( ; ; )
>      {
> +        /* Start address of the BAR as seen by the guest. */
> +        gfn_t start_gfn = _gfn(PFN_DOWN(is_hardware_domain(map->d)
> +                                        ? map->bar->addr
> +                                        : map->bar->guest_addr));
> +        /* Physical start address of the BAR. */
> +        mfn_t start_mfn = _mfn(PFN_DOWN(map->bar->addr));

Both of those should be declared outside of the loop, as there's no
need to (re)calculate them at each iteration.

Also start_gfn likely wants to be unsigned long?  All the usages of it
in the patch convert it to integer by using gfn_x().

>          unsigned long size = e - s + 1;
>  
>          if ( !iomem_access_permitted(map->d, s, e) )
> @@ -63,6 +70,13 @@ static int cf_check map_range(
>              return rc;
>          }
>  
> +        /*
> +         * Ranges to be mapped don't always start at the BAR start address, as
> +         * there can be holes or partially consumed ranges. Account for the
> +         * offset of the current address from the BAR start.
> +         */
> +        start_mfn = mfn_add(start_mfn, s - gfn_x(start_gfn));

This should then be a local loop variable with a different name.

> +
>          /*
>           * ARM TODOs:
>           * - On ARM whether the memory is prefetchable or not should be passed
> @@ -72,8 +86,8 @@ static int cf_check map_range(
>           * - {un}map_mmio_regions doesn't support preemption.
>           */
>  
> -        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
> -                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s));
> +        rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, start_mfn)
> +                      : unmap_mmio_regions(map->d, _gfn(s), size, start_mfn);
>          if ( rc == 0 )
>          {
>              *c += size;
> @@ -82,8 +96,9 @@ static int cf_check map_range(
>          if ( rc < 0 )
>          {
>              printk(XENLOG_G_WARNING
> -                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
> -                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
> +                   "Failed to %smap [%lx (%lx), %lx (%lx)] for %pd: %d\n",

I think we would usually write such mapping messages as:

[start gfn, end gfn] -> [start mfn, end mfn]

So:

"Failed to %smap [%lx, %lx] -> [%lx, %lx] for %pd: %d\n"

> +                   map->map ? "" : "un", s,  mfn_x(start_mfn), e,
> +                   mfn_x(start_mfn) + size, map->d, rc);
>              break;
>          }
>          ASSERT(rc < size);
> @@ -162,10 +177,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  bool vpci_process_pending(struct vcpu *v)
>  {
>      struct pci_dev *pdev = v->vpci.pdev;
> -    struct map_data data = {
> -        .d = v->domain,
> -        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> -    };
>      struct vpci_header *header = NULL;
>      unsigned int i;
>  
> @@ -177,6 +188,11 @@ bool vpci_process_pending(struct vcpu *v)
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = {
> +            .d = v->domain,
> +            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +            .bar = bar,
> +        };
>          int rc;
>  
>          if ( rangeset_is_empty(bar->mem) )
> @@ -229,7 +245,6 @@ bool vpci_process_pending(struct vcpu *v)
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                              uint16_t cmd)
>  {
> -    struct map_data data = { .d = d, .map = true };
>      struct vpci_header *header = &pdev->vpci->header;
>      int rc = 0;
>      unsigned int i;
> @@ -239,6 +254,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
> +        struct map_data data = { .d = d, .map = true, .bar = bar };
>  
>          if ( rangeset_is_empty(bar->mem) )
>              continue;
> @@ -306,12 +322,18 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       * First fill the rangesets with the BAR of this device or with the ROM
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
> +     *
> +     * For non-hardware domain we use guest physical addresses.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
>          struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> +        unsigned long start_guest = PFN_DOWN(is_hardware_domain(pdev->domain) ?
> +                                             bar->addr : bar->guest_addr);
> +        unsigned long end_guest = PFN_DOWN((is_hardware_domain(pdev->domain) ?
> +                                  bar->addr : bar->guest_addr) + bar->size - 1);
>  
>          if ( !bar->mem )
>              continue;
> @@ -331,11 +353,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        rc = rangeset_add_range(bar->mem, start, end);
> +        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
> -                   start, end, rc);
> +                   start_guest, end_guest, rc);
>              return rc;
>          }
>  
> @@ -352,7 +374,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              {
>                  gprintk(XENLOG_WARNING,
>                         "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
> -                        &pdev->sbdf, start, end, rc);
> +                        &pdev->sbdf, start_guest, end_guest, rc);
>                  return rc;
>              }
>          }

I think you are missing a change to adjust vmsix_table_base() to also
return the MSI-X table position in guest address space for domUs, or
else the MSI-X overlapping range checks for domUs are wrong.

Thanks, Roger.

