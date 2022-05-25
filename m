Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A26533F5B
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 16:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337256.561798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntsBL-00016n-J3; Wed, 25 May 2022 14:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337256.561798; Wed, 25 May 2022 14:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntsBL-000149-G0; Wed, 25 May 2022 14:40:15 +0000
Received: by outflank-mailman (input) for mailman id 337256;
 Wed, 25 May 2022 14:40:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntsBK-000142-63
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 14:40:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94bfc7f7-dc38-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 16:40:12 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 10:40:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2836.namprd03.prod.outlook.com (2603:10b6:404:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 14:40:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 14:40:06 +0000
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
X-Inumbo-ID: 94bfc7f7-dc38-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653489612;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AOenDSg54VBBAiUpCZJk0I1KTXaQwU1VR4zCNFs7/4E=;
  b=Hia0gV1wGsZ2JSbIRwu25L+PXNnW822TDOnhXKc3ymUige9WMoPru1BY
   SNiDPty2SMziP5T8OAm6HEp7dJ/FGqLbf6ymffkUUHFNsvv194olq8zsj
   6cKnbahWHjG8LHX6ZodBO9dJBwSa+chMU9mTQydFIJdXGQ3dyBAsyGPXK
   Q=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 72160967
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8j5WAarnlmo6iqJ3joVFyTgSaDheBmJsZBIvgKrLsJaIsI4StFCzt
 garIBmPa6yINGOmeosnPY7ipE9Tu8XXyNQyTFRkr30yRSkb+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 46q+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBDJKPsb9CaEdjLx4uOPIe37DNPWCGrpnGp6HGWyOEL/RGKmgTZNdd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFgXFp2Zwm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK//NpuzmNk2Sd1pD1DIL7U8WWH/x1m2G7l
 0PizyfTOFYjYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 UYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJS1e2W4q/d4gLcDG5USDdEMYYirJVvGmBs0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poed9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:7sH3zaEtCulqVWiEpLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="72160967"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXgTY7h8AqkNpDQFRTOOUshVE0Ok5Jr0z7wOHIzB8XsO39sVTPfGZ1YTL5JOkZ/kH3igV7T7kpAeB80hBnmNr6nkZ1r8kxuxiMslGDldHPdgU/Khp0q7JXa6vLKTizpIxwY2X8RfArPUBYpn6wbUdsZAo2wu8ZAH0wCrud8ffL/daPxjrSxrTxOd60XfilaAVPrQEpZkx+mYNxIDfKTFYE1lQncghYXtpyU+NXOlghAue1l1Y5SQTvEMshS0oiFMSK8Ozi3LsJhfOqRaM980Jm3g6yUejpHxi26BJbFSfx8bRd4s7v/j4tfpZbEzW4YH9W5X8J3jQqxcnl7umnoBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//DGViIIewRqUuL+1svWGp0U9ClJsjRCLLvTMRLhMZ4=;
 b=gVpTuKGPlKegg3CBcoDbBBW/leYfKmynm019Czg458nOaJ5pvl5GvG3B9GuiCq++zTi1MXsv3y9bJozfaFpGC1SYFoeF3oUsl5BTpEoBjopUlPakELHqTeMh7mFA7rql0nMki7HGj51dPbkJiIpAFThvt23NzEU/wsglJofuv6ElaTPDF1A2aZ6a/QGW2NyM0an3fx9TiT9ENgoITqX49vYxzuucMca8xLPEe5Iu/I0cA/jDQ46xWQ/yf2prgsg2d01nBw2ed7GA+fBA1zXMImHh+GvOJGQ11THLI5zmSmqY7YQxDFCzKqaxdeHQdYEuL4Is6R02JbsJ32ZrYHZyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//DGViIIewRqUuL+1svWGp0U9ClJsjRCLLvTMRLhMZ4=;
 b=Tq+FrMxeC/LtEoOWtUpkFaSca7pSeHWfhUNi1XMiRJxgbZNE8q1IyuCEwfIXK+ivYlrlO0zqS4jVLAhyh2RQLb+TszXFH5Ty4TJJFysV5i4tQhblP1xOAhD3v7S5UucTalz7Xmh6NBJeVaQcPWMSCM1zJ3eratK4JLidsJWYUwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 May 2022 16:40:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
Message-ID: <Yo4/wKX3johLB1Rz@Air-de-Roger>
References: <20220525081311.13416-1-roger.pau@citrix.com>
 <20220525081311.13416-2-roger.pau@citrix.com>
 <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58aa1cc1-3a67-60d4-6f8e-6c5746b05614@citrix.com>
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9a009b9-c01d-4d2f-e5a4-08da3e5c7585
X-MS-TrafficTypeDiagnostic: BN6PR03MB2836:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB283617011DEA9BDBAAECB9E28FD69@BN6PR03MB2836.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ypOR4EanwrIEy3V8WN1gQfb9669eMfQZ+QkkG6MurE5BNyeHztRuv/rB72dk7B4vPHahlds2MWFQvnxLnk45GbqFFR38UDm63ifxeyrbHgofHpYK2FsJPNWwp915bc42IC2pb984WvC7Up8V84iUz+04g4F81V15oiEhbYB/xgqq10b61RBnB2hrjTufSSLKYwAwW25OwGwBJQasw441t2SQiS/7UXp7+tM7/YhRG9afJ+UT88lLWl0f1OQrnG3eEWlQz+pyK0GlxoG6ra3b7etIgKI0LsVR272ARkGs0OoOCHXy8g22N6BtJAszJePkoukZc/GTXgWSorTFkAoFbLEAfONhwI9qJ6K9bcfIFcupbxZGDJJqcjDxKS2HKfQb8KVtGjfe2UnXnl0ciAp91Ts+/qcRDCrmTwebutNK3Bhqkr9pwg8PfmboamQwJECqmDuD1DAwp0TwzrY4gTU3sIEdsnfXTGME42opOZQ/FK4JvBVz9vITKF7LSptPq5newJ+bIzlLCatX74wVMefRdHzQr9X0rGP+aQLO1MzNuOEcNf8A9hD1212RwDlBA04YITrDTd3I+oX+xJcTHXKNx/dF5lmuJju1UI+PIARHS4fOhhji3gm88rEzojgPMezZjR+VFX3VK8Fz+n9cVUmd4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(66476007)(4326008)(8676002)(6862004)(8936002)(66556008)(5660300002)(186003)(6636002)(316002)(2906002)(54906003)(6486002)(508600001)(38100700002)(83380400001)(33716001)(86362001)(6512007)(9686003)(6506007)(53546011)(6666004)(26005)(82960400001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wk04RVhUdVdqMU16SkVhM2Y0R091T0QvTklDR3hmUXFXRzRuT3M0bmx1Uk1W?=
 =?utf-8?B?SnltN0NreGNXSk94dmt1b1dTcVdGVWo0bjJMZlV5S1l4OTJueWJLSDdza3Z6?=
 =?utf-8?B?OWQyKzVSVUNtOVV6QXZuYUNUSVA5RXh3KzBzOWovNk5xWTUvUXFOTTNXK05G?=
 =?utf-8?B?c0dRRDZpbVlvR0dycFBmNWFVUDZTai9URFRHc3lCZGdpcVdmUURvdjVvSDdv?=
 =?utf-8?B?Ui9PUHVwZE9uUzhOMWxMTTh1K3ljLzhyaUJsdFVSSTRmRmRNMEtySi9ISzZ6?=
 =?utf-8?B?RklPeVFXdWRQazVmQXY2K3RnKzNsMGRQSjcybm5jYUpjMXVTOTRZTFJjaXAy?=
 =?utf-8?B?d2w0bEt5Zm15NXptbXNMWVJrdW5NWkduWmJ6UkVPNTdtejdTc1ZSWVRHYmY3?=
 =?utf-8?B?TnhpaFEwUElYS0lKcktkSXdwZzFvbVJyRU5BMFBIUndockxsbnlXRGFyV1Qx?=
 =?utf-8?B?RzFSYVN2ajVXejFUb1VJdnlISThZeWtVWUpWSWhyR0lvRmhNelJ6TkllYm5P?=
 =?utf-8?B?UjBMWkhQdUltWmZ3UUliRTJrZWtoZDhCVDJ1dFhOaXNjZWswZm9pRnIzc0hU?=
 =?utf-8?B?am1SZUZiVzd5bm1qeU84dS8wT0VRL2VoWFF1VlBvVk9vTjRVZkk1R2JSRnJN?=
 =?utf-8?B?UnpXTmt3VVByei9tekw2NWZLcFNSRGdsQk1ZMXVIdm9hUVB3Ymw1R2dMMXky?=
 =?utf-8?B?Rllqc0RKKzlKZTlVS3hLdWlVN1p0dlNzSnBqUXJOUjJEbC9QMllmQ3o2cHQr?=
 =?utf-8?B?a2hyWU9Ud1NxeW82VFlSa1BGL1hadllZTEtEL3hlNEdkeEdzWXZIbkRxeEho?=
 =?utf-8?B?Wk9ad0xONlg4VjhRUWJ0Sk5LbmZUUy9ITDk5aG5CRmtlKzZmNjBwMC9xZU53?=
 =?utf-8?B?blhjdVlyd29SVkpLcFBxeVJxUXhvRjV5NUpodUMzSnhieHdubFNibmtzM0h5?=
 =?utf-8?B?T0NVK1NCS2M5T3pBa29ZYW1KNXlUcXN3RDlqYm5tb3QzaTdlRDVPN2xlOHVJ?=
 =?utf-8?B?bkdUSHo3bXYrUGRBTUpnY0JJNUFKSWtKbEh5alUxeVJhbXlvZXdubm55TTVH?=
 =?utf-8?B?VWV0Y0RNNStEWUZJNkhwZ0hvRGFGWnp2ZzIyNElyRzJTR3RZZnVLN1FnTWNB?=
 =?utf-8?B?alJ6bmNNd2ZRTnZLMFRmY0NXajBsblM5alZ2QWQyUnNuRDRXcm5yVGJUT01S?=
 =?utf-8?B?VFcyRmJxVFA3WTBnWFZmTkNXYUh3U0w0Y0RzdU8rWHlSanY0bTRIMGJFalJD?=
 =?utf-8?B?cHlEN3o1UnljMGIvbGpOQ0JuRjA3V1I2S3RNRlpiN1pQVm1GVit0WjJySDFB?=
 =?utf-8?B?QlRxbThETitId2Q4U0QxQlZvcStzVkswNEVHclc3aGt2K21yZmFERWV4cUpY?=
 =?utf-8?B?dGZVV0FRem9jRGU3NWFHQlZjMEhNNkdTTjFMdElaZFlmbmhwTUJEek42NDhw?=
 =?utf-8?B?YTcvNUZIVVR3bm5MV0VST3V6eU9iMlRubWVIWng1NjNOakd3TWFaZVZwblhZ?=
 =?utf-8?B?Y21UTHFQeUVWVVNYbHpVVkVUMjhIaTBOcStySXk1c1d4ZGhiT083cGJ5QjhY?=
 =?utf-8?B?K3VhNk9kbW1iQlNHbHBuU0VCcHRuNDk2MFFRKzVjcjR0aGdZOHluV1hQaUIz?=
 =?utf-8?B?SWh3K1NaMHN2anJHNVg2NnZPd09HVUZjSWpGczh5ZnlHTGZOZnp3NlNHVEE4?=
 =?utf-8?B?cm5rMVdFNmIzdDJWSkMybmVnSEtEbmoxMUxrdlJtN3A5Z1lxZkNhYk9GTXQ5?=
 =?utf-8?B?YW54d0VYWk1PaUZkUVZ3S1ZRdlVJdXpxcHJoUzlPMHdQVThxZ2RFRm5CWmRS?=
 =?utf-8?B?RDRyYkxtMzZuWXRUU2w0VEt3UjFGWllraEZBM0pFYWpLZGJhVVpCVGtwU1k0?=
 =?utf-8?B?aTkxbUNKdjZ4TFJLWHozM0xzSGZnNlNURWVhRTdkV251bTIxdExaMWErdXhn?=
 =?utf-8?B?dlU0REd6Zk9kb0ttOEdEMGtlKzFMbmJVVmlKRVJ0OEdsVzlnTWJmZVlQQUhz?=
 =?utf-8?B?OVFxVnlWOFpKNWtvVmpwWCs0WWNtN1pONUZsNGhUei8vN2l2eTNHOGtKRHFr?=
 =?utf-8?B?M0laTXhhVDh2MzhwS1NVWWswbElWQnUrMC9wZmZmY0RKYjMxMlgrelVqRHdM?=
 =?utf-8?B?cTlobXdjZUREaFB1aHZiRTQwN0Jqekxtb1pMaHdZUXlQdUJCbjRwTERXZVEz?=
 =?utf-8?B?ZG1jZmMxNng5S3hzR1JlRDlnMForaUFRamh6YkxwVEJIcEZIUEQ3YjR6MG0y?=
 =?utf-8?B?S0xqd0gzZkd0R3N2MFJQcDFRWTdUeCt5ckhreXExWmswMExocmNGUlhsSTc0?=
 =?utf-8?B?YllTSS9LdVAwaFpNWXF5c1NreFNIajB4cE9YYTNxaWtCVnlISEtDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a009b9-c01d-4d2f-e5a4-08da3e5c7585
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 14:40:06.0968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04Nd3ZroelEnb2xUY96EgRhytWwbR984Q/toz+wTSDa/TYEsDaRQhG54bpcFylJZB0s2W6B5XKfV9X+UbDyR6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2836

On Wed, May 25, 2022 at 10:52:48AM +0000, Andrew Cooper wrote:
> On 25/05/2022 09:13, Roger Pau Monne wrote:
> > Rename the flag to better note that it's not actually forcing any IPIs
> > to be issued if none is required, but merely avoiding the usage of TLB
> > flush assistance (which itself can avoid the sending of IPIs to remote
> > processors).
> >
> > No functional change expected.
> >
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v2:
> >  - New in this version.
> 
> :(  This needs reverting.
> 
> It is specific to IPIs, because of our current choice of algorithm for
> freeing pagetables.
> 
> "no assist" excludes ipi-helper hypercalls which invoke
> INVALIDATE_TLB_VECTOR.  Such hypercalls do exist and specifically would
> be improvement that we ought to use.

So the improvement of that mechanism is that you can pass a cpumask
parameter to an hypercall in order to avoid having to issue repeated
wrmsrs (or APIC MMIO accesses) to send IPIs to different vCPUs?

But that could be seen as generic assistance for triggering the
execution of remote IDT handlers, and as such won't be restricted by
the NO_ASSIST flag (also because it would be implemented in
send_IPI_mask() rather than flush_area_mask() IMO).

> Furthermore, we do want to work around the limitation that created
> FLUSH_FORCE_IPI, because we absolutely do want to be able to use
> hypercalls/remote TLB flushing capabilities when available.

I agree, we need to get rid of FLUSH_FORCE_IPI.

> I accept that FORCE_IPI perhaps isn't a perfect name, but it's a whole
> lot less bad than NO_ASSIST.

I'm happy for you and Jan to decide on a different name that you both
agree.

Thanks, Roger.

