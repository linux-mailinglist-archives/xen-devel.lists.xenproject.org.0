Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB39D58FA9F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 12:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384377.619743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5KI-0001ba-FU; Thu, 11 Aug 2022 10:22:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384377.619743; Thu, 11 Aug 2022 10:22:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM5KI-0001Yv-CY; Thu, 11 Aug 2022 10:22:06 +0000
Received: by outflank-mailman (input) for mailman id 384377;
 Thu, 11 Aug 2022 10:22:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oM5KG-0001Yp-1R
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 10:22:04 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f50b6f0-195f-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 12:22:01 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 06:21:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5714.namprd03.prod.outlook.com (2603:10b6:303:98::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 10:21:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Thu, 11 Aug 2022
 10:21:50 +0000
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
X-Inumbo-ID: 6f50b6f0-195f-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660213321;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=a36EBYFPt67N6elBvanE6Be5b6mseFgTOhjTIYc4vtY=;
  b=ajBF0N2yaO1irwYi6+Pz2XtIezB1XuR9IiAOSID7WdoREw7pVQYce1sy
   7cMXL1Z/EVT8yDTONSvSGaUXar1+2QCi08Xo9CNkMo+ek6WlGPio/dzlX
   sAY8E5EXjFrv0szjpCOBhgevhtBxZ749ApFzmc71BnOilpHMZJhe6PPbc
   A=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 77863223
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AKWY+c6tzYQq9p+9skf+Pk3ZKIOfnOphVZgL3L?=
 =?us-ascii?q?MmfNr3fOXjw2xdKXGK55aDH35v3Guxd+/pgKQ+wLbxTwizIborcBzKvaWIBR?=
 =?us-ascii?q?r3IGnh30Bx70HU1hOy1/YD3m4O2p2k5uZ9NwTk58X2NPwaQJHrViW21zxCWz?=
 =?us-ascii?q?WNrSULLaNdUChQ9uzNzZfDSVK30qWJ0TCMbkjPdM4joLnl6+NxmiTuPDhYo2?=
 =?us-ascii?q?P+oEomzmMbvRtFINa1hkNBpehmQwjQ70pfthmLaMvXDyLDVZFk80k8+UFS/B?=
 =?us-ascii?q?VGHoAAAX/JwcYnFk8Rd3V9ZHcSAECYH+2afv0nbBzwe/QCPay+alaqaA24XH?=
 =?us-ascii?q?B4LnVK3EiDwHCM8j2PTrDpN5vsW6iyMPOw6IWd04z59z89CjcCD68tz7e6RH?=
 =?us-ascii?q?J4DyFMtMApS7ltB2xwzZCmZsDamLYEXXxBG5jzem3nhCrwnzuh9b7e92AL6u?=
 =?us-ascii?q?8c+WkdGAZOCLVV5L8UCxfTLvSdpDvUYriN7No85ddeMOOCoKV3aWHWO/95xd?=
 =?us-ascii?q?GIqmR3U/8TVEn8TmjUDKdiV+OFFJLwVmHFK47IW2emkA1TvxlA9AEPBeARWZ?=
 =?us-ascii?q?EMRnP3+O3AeVEIJTSu7pylgcH9TYeWQbMzgVNd+x39Gb+Ls7xlR0JVRc6YtP?=
 =?us-ascii?q?Bjy0noJik8o7WBdhK3Dfrh59WXS5M027EooXqFqy/hEHFHnkqCWfU+YRV2Fo?=
 =?us-ascii?q?HXsq8ummn52RbFWvkIoHs9CFg7lYPaWBEqFubb4sRDuq57ocQhnMFkjlS77K?=
 =?us-ascii?q?G9vjtIruEtgSiGP4XxIINUX7swiQqVzMDCRf1JDErE/2RJ9m6KpIKdbPu8GL?=
 =?us-ascii?q?NUFL85+tDqgVlwywhZoldNRLezdzl8rbZfUSozDM5SXxzxMisTwOufad+UTJ?=
 =?us-ascii?q?Xz0CN6m3SFqcVNrKVBWecTvvxO+pVs3K4cZUMXo+3yNHKyyNMgGiqyV+h/hx?=
 =?us-ascii?q?ZQkaZM8Fn9mwsMSxs0vRcvM5KLDpvJSPKcMlCwMNA43Nf1/jbVA78EvXI/dH?=
 =?us-ascii?q?g1NU4N0UuymSBQFcVG4TYOtdXLC8Q+8KIs24iYksFOm3TGeJx2xAe4lT/VGN?=
 =?us-ascii?q?KBshNH58y4Wibf9DVwA4VyIw1f0c0dRCmVFoXHmb1ao7XsandImaRzK69KQY?=
 =?us-ascii?q?7OO2XQ/rfTh6tpGVEdTtiLRYFoj+tTm8ogog/WDeHZCB8w7XSFfMndel2BZH?=
 =?us-ascii?q?gtGxfqEwkR9Z1lrLfARSNn36PFEPsB7oL7nqA6egz07ZjUlmbTJUDhXSyTYj?=
 =?us-ascii?q?b16Vc08PLJG0+naNxwj6yKiNUSKMrDmE02j4CiBTwagmSF3Wmto01kF7oRjs?=
 =?us-ascii?q?KjKm9zDqq26ZmoI0A5eZr9Odt6xrWH9g8dRQtw5umj72OmZTvwzMuM5RTjqd?=
 =?us-ascii?q?qBVZuBLu06BORA76xkJbT0ByAqbr2eyu1TAIRcOUv/6aplsFZF5rpjMuvdKt?=
 =?us-ascii?q?G5bGww6nBu5cC21N2GFGh4Ux5li1RRmQoVshOkwXxzHU6XDhkztk+1H/er1U?=
 =?us-ascii?q?Qre7HdZOhdWOsYNQJ/gBHvoc9OwbyZ3VbrEY9+ZlWzXhFrL59BqHCmA+Ezj2?=
 =?us-ascii?q?OBuMGFXulLOTI1nz4DuxLxGV/FsFjqoNQwyFE8Ltwai9XQMX4X7Sfcsaewq7?=
 =?us-ascii?q?6YuLdiy11C2o5xuTrrPktuZ5TQ1p34govxqf3rwWeQHWjxq4OI8Uj9yTZ2L7?=
 =?us-ascii?q?pdedgNqFUwcYALntIKficE57V7UBj7d6t4Wp0cx5D5lW3nLM3chYQXh2JND2?=
 =?us-ascii?q?jZLKeYRDAPtTnPLn5vrC3gPHL1MRGauHOobyE1zfnnnrFJFP238wotOO+XWd?=
 =?us-ascii?q?qfKBoCOrPaxugFqxVsoHJAaplnO8Ez21dXqn7tCOAB5jQM1hfirA3ijG4gGt?=
 =?us-ascii?q?mzPPvJz/0POyU+/xgt+5PB98jj+ti2batp+HFdt98LUgL/8NBKcNjV3oMQL3?=
 =?us-ascii?q?m5v/31hRVsQkgMZfVCUrbrW9txNQTu+HpwZyw1iW2M5Fuv100dDcSjdTyQ9z?=
 =?us-ascii?q?6GT5iKqcboocNCAmaCOOFPcBdUtYUiu2F5vMXKgu0yACrqXavBRIO1mH3daV?=
 =?us-ascii?q?M/eLEk31BpW6qrxFbuYbuGiSwywzDTEHkZWd8yNrPWPtZ87ZPvxG5JA/ThKm?=
 =?us-ascii?q?gutwFU+k/zg69Tfpus7Ls/1ybTgTwV2ZBGbPcRk7MQ3CLGkrHNyrR1RqjxLR?=
 =?us-ascii?q?BlAIkH2Zn9And5czvayO+0Ybs6eZxVZuBjeRwM6BycUv51ID7pL2PdIeEV9a?=
 =?us-ascii?q?TEgTxZAif0Uf5C0hHwPqr98C6afw2yJYSYO7JlxzLGXxK3k+PWX8aYFFxuIF?=
 =?us-ascii?q?cN+BKHoyZAAvfZvMFfkDgdNTEnLJPo1J2JAWcCXpmS7CA5Li9jkdK2lFQwJv?=
 =?us-ascii?q?EL33HWFvBFhz74LjpT//a1quFelNZqrXfvziB2cHs00AkEijsax7Lu5PM7Xk?=
 =?us-ascii?q?y8OWM/ZfLXqgpWDIQgz+BR0GALCtjjXgdLsvbf5pHVLhr8sfaH9PaY2276mx?=
 =?us-ascii?q?FdOjDUzjkVA/6sJK3B4Xl1ulwSHP7D+l1JG8eNAZ+vo?=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77863223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcGzcXf5ChOLoH3uBFznLk4rPUxahW1bU9HPJipZwYQd6f+zM5/UK7B4nw+xpunStClUDbqa0o4+LGCxnoF1Z9+NoC/aFpM/meXzDfzWvMjHYKmPG6GaXIKTfaLn9ibJdgO3nYmSfU6HPSkdejJ6lQvH5C79QDnR1PQJ2rCLta2OGFKzjByKPxHS4JZRyrSpYNoe2Am4dzaxB9A0LsWB4xMtW4SwxIXEXlb896QhbEYZ58+AmGaWi6ytz3KOOYHcAS2wC6KmdhDZo3pifbSakj28EaAwEkZQ48kTQgCBmPd4HOwgePfoGerbP9mMPZnhvfCb4a+4ULdkdZMaxPXudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a36EBYFPt67N6elBvanE6Be5b6mseFgTOhjTIYc4vtY=;
 b=QjBOH+8TqUrz8ozxgarZcPAj4Eapub21IZKiauq6uFL1hbVxCeZn4lbwR0BUEQiRb5CAa7rg/hkIZXLvgXYULk0L15Jylf7tMifeu4y+7aU2yQ9lFmwfNXAIHtCBNMwSgZzkmSDkYb/OlA7NQ82RfYrpDghwT8ad6XXlb3g2e0i/pTdbNpbrnb/AwmA7tIyoKjF/xxp1/T6E7hRYGE2cxjqyuIHFIy0ZVN/cbujlDH4BEtP8hncHLOT3UB0g2gLxJkjb3/T97xN4lh57giiPwJfN8fgvR0fzoVbcYibGa5vHIGaSf3P7PUcV+5yXDV7vJbiZkmNzq9UoYtqVnsalbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a36EBYFPt67N6elBvanE6Be5b6mseFgTOhjTIYc4vtY=;
 b=jvJKD/+Z/xC/g7fiy1/97rVzFiJDEQZ3QsKc74GR+Y7qikSoDtBPO7aJYGCM859DU1otOhvDC/TPRacGBCZKI32oC+vwr0z413DD63r+AnDDSGmWLLcjqGB4pxac2IH3uFXUWAiUa9JE8vE3jfzxEIRbXnRDRVaaSLglhAJYs+8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Thread-Topic: [PATCH] x86/cpu: Drop _init from *_cpu_cap functions
Thread-Index: AQHYrWuqM0jpHL25IEyIFgBUnyY/9K2pfX2A
Date: Thu, 11 Aug 2022 10:21:50 +0000
Message-ID: <7ff6d006-0a6d-60e9-ebb7-70ad3c6d6a5b@citrix.com>
References: <20220811101715.3947873-1-ross.lagerwall@citrix.com>
In-Reply-To: <20220811101715.3947873-1-ross.lagerwall@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb026774-58aa-4ee8-6507-08da7b834de2
x-ms-traffictypediagnostic: CO1PR03MB5714:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DfPKN3HJez0fgRnllfl0FQPiAnCV2WUQwucclrs2GJu/aW+nkf0e1cToO37oMU3a2dBfA8tr+qwu3GXXSqPeO5WWdHdtvf8zBEiSUBj3vFEY2fW/FN7UoGFtWzbOphmwiffhj9Gli1A++VGqyTUpGi3A5OiG2AGDeXZjlDXcTS4C6/BVx6JGgfk6ZZUYDq70T6H8/3Yd3zUoTeg6geZ9wTgSzPVlcPar3TSGTbJmqUZ65HcAKtA+6T3DqJ/JHsvCSg+kcCv0oe47KkJJCaGzToa2/F8ZBQG9VFdug02MBspvVjVc6BWUi/adBJn55D9tIZ5Mdk8ikZyaxE832nvgVeiM8Dvf+LoV2R5TkvmelrWvUVpvvBECQInvVgqhURPAHq6sVaK75LOAfrO1ELG85ef19mwFA68uLwYKs9DnOPrKJDDNDhgaJZQs9Ok6Ll7jnVpAit3ZTKtlgjTBbyZyn7C5J2uE92yxbKu9/Wzu/26dz32MQoljznRwqHSvTDqMYunqC+pMQWZKrbnkp/8xw6I8Nj+c8/9DH7ux5rKkX9W0tpjzTwuWyvNspvgxg8APyJMo0jrWa9z+MKoVS/3YFbNvI4prxSGx/5UJwP0+U9Bk9NzxeWKihZkLvj4GCOryK2HDpjsHIfpj4qCtWxz5YoN5ZujAHOc0aDXLHERYeAQ4PZeFzAx26Hu/Yt5DojFwKdIDM2axk8iUGEr6DOv5KRkXdnko4ReZhHqGu/XI8h0w0Eg2WvQbw1HG99/BivVKXe7AfY//aCr9xGUwWsUoB4KzOhorQ5dYlPas1zRAPGDKfwpwQq8fncCuoKG7wyhQtRzCxUKez81p2xKqOwyoa+cVBLG19hh20weJ7j0mtqeQbogLcDbvhsqoVSGdA2UP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(478600001)(4744005)(5660300002)(6486002)(66556008)(2906002)(66946007)(64756008)(66476007)(66446008)(38100700002)(31686004)(122000001)(8936002)(38070700005)(82960400001)(8676002)(6512007)(6506007)(26005)(36756003)(2616005)(186003)(53546011)(86362001)(71200400001)(41300700001)(316002)(54906003)(76116006)(91956017)(4326008)(31696002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzJmWXFIVTBlMnRJNUdocVA3dmJWQUxUN3d1STY4UWdsNis1ZVpLSFlLOFd0?=
 =?utf-8?B?WnlKR3NJc2NIK1k3VG5pelBYWHFLVVRoa21EMEJMUzY5SWc4RXNVc1BOdnBi?=
 =?utf-8?B?SjRsVFY2cmFOTHVyY3g5TEh2TmFHSm54SytpQWJWcVh5azdtSTY4WEdYSFhM?=
 =?utf-8?B?bnZCUDZEZDFsR1lySnFGWS9SU2JEVklvZ0VYeFMxdWQ0dTV5TEJ4RjJTQTBa?=
 =?utf-8?B?ZDdLbFBJRUo5ZHlrK3g3anJCQ01TcklmdVp1cXBlMWRoUE5HNmVnMllURWtX?=
 =?utf-8?B?Z0ozS2ZJU3g3NHZpVGsrMjVxNEtkYjFNODBOeEhnOENZMEZKazlqcDdIQlJJ?=
 =?utf-8?B?S3dXUUExYlg4eXhlSW8rRUs2a2hDQXQ0ZmVDTnZ1aVRYYVZTNnZ3aCtxNXRn?=
 =?utf-8?B?ajAvYms1bkc2OE9Ia0xuWmdPNVc3WVpGR3VKL05QNWZEV1BQbmU3Y1VMbzEv?=
 =?utf-8?B?WENSZHlRdGpvRzJMd3cvK09TMUtSenorTTF5emJmT3BMWE0vdE9hOGhvTGJN?=
 =?utf-8?B?STVsWVpQT3NTNVNUZ2VSeUQwaUJFRm5JV2owVTlzVE92SmVtRlFUZUdDM2c2?=
 =?utf-8?B?TS9qOXFpVWtMODBoZ1FwMXFFbUhQcE9UR3Z5Qk5qeGxyUUtQMnlHckltckNV?=
 =?utf-8?B?eFljUUNRWURIUXo0MXg4V0pOQkRoN0t3dFd1Z2xEMUVYMlpVMDlFWG9RWjFZ?=
 =?utf-8?B?U3BHNlJNK21QSjdFeXJGWTFYd0ZpR1VEQkc4L2hMYWRNT3NFbG1DdlRUWUJN?=
 =?utf-8?B?Z2tHM244Nll4bGcxUmc4Ynh3TkZ6dHdDWDFYeDdDckZrVXM2U052QVJtOE9w?=
 =?utf-8?B?dkMrM1ZwdXRSUUNJbm9aa0FjZ0JXK3dWV1kyc0lESjF1OGVQQkF0VWxiVWIw?=
 =?utf-8?B?Q3NzYTBNR2E2amhZTTJFQ3ZNTjR0a0dYY1ZwU3NBMEZBVkFSR251N2JmUHBR?=
 =?utf-8?B?YUl6d2x1VTU2T09SQm5RQWM2dHlKRjFoMUNZVHVPeU5TUTh6aFc3cisxeHVH?=
 =?utf-8?B?ZmdPMldaZzNTNjl5bXRiMWxGckxYblgvYXJtK3Ywd1E1ZWgvanJzSWFGMmFX?=
 =?utf-8?B?TEpGSkkzeWIxYUY3Rk1PYmVBQ0lDNEZjVWJiTTljeWdSQlV5TnlNVUVML0w4?=
 =?utf-8?B?RUtGVGJSb1l1RFYvQ2VJRzE1UXM3TU9FL3RnYkZ4UEpaOTVOL0w3U0p0VG90?=
 =?utf-8?B?dVV1SXFZMFoyanRCcU95YmRXNjZ1cWlHeGJCbEZrU1JSNjJXOXlDMGNZVlBu?=
 =?utf-8?B?UEd3cDhqWndKYndjQVMrb1A2bVRnRkIvWWJoVDdMODhBU2RyakN5cEgxc0Vv?=
 =?utf-8?B?M0Z1L05YeEljcHdTNXVLcHd2bnpKRXkwOGxTaVRQNVVrRUNsTFl3R04zbFBI?=
 =?utf-8?B?TUJTVlJaTTVibzgzRXN5VlZHMnkyOThQQkZyNzMzcEZ4YTZicmROVmlrakJV?=
 =?utf-8?B?VVdTM29jUzVXRGxVSit2THpqb0JsdWIzNUYzdEpkS0U5cnphNDdUQ01WK1g2?=
 =?utf-8?B?K2I3M01GV1Bna012eWtSb01MOExWTnFLUjhuRS9hKzViTDVVSUhsY0JWVkor?=
 =?utf-8?B?eFAraHFyTytrSHl6N3IxeHpVTnQvTCttVy9IRHNkajVvalpEVHZTSnJRcGZV?=
 =?utf-8?B?SFVXU3p6OG00RmhhUHlzQStuWVR3aEkyTFU0ODFxRGdQTXQ2WkdRMUNza0Jr?=
 =?utf-8?B?MzN2SlJ6VW1UZkRQWnEydXhqbG5PSDVCNEUycEs3MEZyd1RKelMzVExmbGlp?=
 =?utf-8?B?UHVkdUQraHVWV24zQ21DWnlJREFpN1RkbzIrWVZIWGk0eTZsT0ovY1pLS0VM?=
 =?utf-8?B?emxUTkt5L0FRSWp5VHNDWno3Sk0yYTFhdTRmeWNaVUpRU0ZZeXV1bytBV0Zw?=
 =?utf-8?B?emREVEh4SmgvdHEzbFZJcVM5b0I1cDBFVVR1MGY4dzNzbS9aREZubGFISC9H?=
 =?utf-8?B?U1ZuUXdDM3J3eHhoNWk0OVVUQWtGMzZRTENxZStrV0phK0dxdHV5TDFmV1Ry?=
 =?utf-8?B?MFJHMWtHdkdYaC9BNWJ3eFROa0dMQmlYWThjbHVVZXlmOXVPNW91MktBbkds?=
 =?utf-8?B?V3ZjellZLzRiR1QvcVpHWjZTWEQwRXI2aDVBSGxWQTZOOFhVaCtNNUpPK3gv?=
 =?utf-8?B?ZE9OWG9RYUIrcnpXazJudzZieWR0SUU4eFFpUGNzeEZLZm5PMlpRQU8wT2VK?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5380DC5375247B4380E6E6C82D82CDF7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q+z41u3mF6YT0s+QWRWjOwKBzK9lMEd2+wqdUN97vtJHhATSMEzfqyBaRmwGAZiy+TebzsZs61LOvPTNqTqVp6KFXmyQSjF8SqZb33AK6DdA47vPkZcIuYaDG1ri5Azt1R2N3VPEtoroc8ouIDVdLe1+hlmDOk24maOAsjoai6RCUDEchMz8aVHVuXkF/jO3NN3ZHTHxKm41mObY9VjI4RbULFIZfeB3k2TEVRx1UvdFhfrdfBRcbL4UCZAC7MrQkOkUo7t5pSGhZvQYcJpn7B0JUhC2wTgKgYHenfQnBr7izjcczJ1TCVKjK9vs+obaNsNGbU3uHVprzn2kB0d+JQirBogGmh3iR/OhCU/iS8BCSLrg9sypLzYmEOJXkX4FZU1tHkHVWHYkExS15NidCrhq8HF7dEk3qzCsv6+c01fvOS6vbUxteKRq2uDZpXPKSzhzhCQqkMCNnb0U9Rnzx2AT5qEpgL2SM+cqFezjjTZ8FyzMG0kK6MqSn7AFWIl8SXO+qlPJG0dhZC27YwQXI4hH+BXDqHTf9fBQpfiMGg4fTYJcL4MUPCMAtEDXAoZX2ilZGl3gs3xGTNN8Zhh4KaxrHFalKfzH7aPSwUIF0EdYy4mqcXG5hTlamgAKjntQ/zSqIvmyDZuIfKEbw0zzfT4P0d/zs/PJeWexYirWsDdLmCaJ3+9mgwGlU7tOcjg3kcwzLDJXo4v0gh0Kt3O5ScSOUgKTPSmx9ooxCfL8wvE22KAaS8a+ZTgPpqHcdbHDaLHdBlRppSDSsDEj4nnHT8OzYzOGfB4k7kkxqC2jr7nh2S1h042BdLJ44GXMOcHG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb026774-58aa-4ee8-6507-08da7b834de2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 10:21:50.3805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEuZby+z8zBBDXSkhX0+vcwJsOZn72zsimT9LnFRRwTBAiLOj2AVgCv6cIZXS/SwzgXeHfjto+tD/AruVMOfLdqeQ4XoPTePFUMUSby7j64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5714

T24gMTEvMDgvMjAyMiAxMToxNywgUm9zcyBMYWdlcndhbGwgd3JvdGU6DQo+IFRoZXNlIGZ1bmN0
aW9ucyBtYXkgYmUgY2FsbGVkIGJ5IGluaXRfYW1kKCkgYWZ0ZXIgdGhlIF9pbml0IGZ1bmN0aW9u
cw0KPiBoYXZlIGJlZW4gcHVyZ2VkIGR1cmluZyBDUFUgaG90cGx1ZyBvciBQViBzaGltIGJvb3Qg
c28gZHJvcCB0aGUgX2luaXQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxy
b3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPg0KDQpIbW0uwqAgVGhhdCdzIGEgYnVnIGluIGluaXRf
YW1kKCkgSSdkIHNheS7CoCBUaGVzZSByZWFsbHkgc2hvdWxkbid0IGJlDQp1c2VkIGFmdGVyIF9f
aW5pdC4NCg0KV2hpY2ggcGF0aCBleHBsb2RlZCBzcGVjaWZpY2FsbHk/DQoNCn5BbmRyZXcNCg==

